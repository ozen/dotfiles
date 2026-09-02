#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "usage: $0 [--check|--write] [skills-directory]" >&2
    exit 2
}

mode="${1:---check}"
case "$mode" in
    --check|--write)
        shift
        ;;
    *)
        usage
        ;;
esac

if [ "$#" -gt 1 ]
then
    usage
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
skills_dir="$(cd "${1:-$script_dir/../skills}" && pwd)"
failed=false

disables_model_invocation() {
    awk '
        NR == 1 {
            if ($0 != "---") {
                exit 1
            }
            next
        }
        $0 == "---" {
            closed = 1
            exit found ? 0 : 1
        }
        $0 == "disable-model-invocation: true" {
            found = 1
        }
        END {
            if (!closed) {
                exit 1
            }
        }
    ' "$1"
}

has_codex_policy() {
    awk '
        /^[^[:space:]#]/ {
            in_policy = ($0 == "policy:")
        }
        in_policy && /^  allow_implicit_invocation:[[:space:]]+false([[:space:]]*#.*)?$/ {
            found = 1
        }
        END {
            exit !found
        }
    ' "$1"
}

for skill_file in "$skills_dir"/*/SKILL.md
do
    if ! disables_model_invocation "$skill_file"
    then
        continue
    fi

    skill_dir="${skill_file%/SKILL.md}"
    codex_policy="$skill_dir/agents/openai.yaml"

    if [ -f "$codex_policy" ] && has_codex_policy "$codex_policy"
    then
        continue
    fi

    if [ "$mode" = "--check" ]
    then
        echo "missing Codex explicit-only policy: $codex_policy" >&2
        failed=true
        continue
    fi

    if [ -e "$codex_policy" ]
    then
        echo "refusing to overwrite existing policy: $codex_policy" >&2
        failed=true
        continue
    fi

    mkdir -p "$skill_dir/agents"
    printf '%s\n' \
        'policy:' \
        '  allow_implicit_invocation: false' \
        > "$codex_policy"
    echo "created $codex_policy"
done

if [ "$failed" = true ]
then
    exit 1
fi
