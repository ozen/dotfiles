#!/usr/bin/env node
import fs from "node:fs";
import path from "node:path";
import process from "node:process";
import { fileURLToPath } from "node:url";

const script = fileURLToPath(import.meta.url);
const root = path.resolve(path.dirname(script), "..", "..");
const sourceExtensions = new Set([".md", ".mjs", ".js", ".ts", ".json", ".yaml", ".yml"]);

const joined = (...parts) => parts.join("");
const forbidden = [
  ["legacy delegation tool", new RegExp(`\\b${joined("T", "ask")}\\b`)],
  ["legacy structured-input tool", new RegExp(`\\b${joined("Ask", "Question")}\\b`)],
  ["legacy recurring command", new RegExp(`${joined("/", "loop")}\\b`)],
  ["legacy durable-objective command", new RegExp(`${joined("/", "goal")}\\b`)],
  ["legacy skill-authoring command", new RegExp(`\\b${joined("create", "-skill")}\\b`)],
  ["legacy UI driver", new RegExp(`\\b${joined("control", "-ui")}\\b`)],
  ["legacy CLI driver", new RegExp(`\\b${joined("control", "-cli")}\\b`)],
  ["launcher agent-type field", new RegExp(`\\b${joined("subagent", "_type")}\\b`)],
  ["launcher background field", new RegExp(`\\b${joined("run", "_in_background")}\\b`)],
  ["launcher branch field", new RegExp(`\\b${joined("cloud", "_base_branch")}\\b`)],
  ["legacy custom worker type", new RegExp(`\\b${joined("poteto", "-agent")}\\b`)],
  ["legacy specialized reviewer", new RegExp(`\\b${joined("Comment", " Sicko")}\\b`)],
  ["legacy package namespace", new RegExp(joined("@cursor", "-skill"))],
  ["legacy source path", new RegExp(joined("pstack", "/skills"))],
  ["legacy skill directory", new RegExp(joined("\\.cursor", "/skills"))],
];

function* files(directory) {
  for (const entry of fs.readdirSync(directory, { withFileTypes: true })) {
    const target = path.join(directory, entry.name);
    if (entry.isDirectory()) yield* files(target);
    else if (sourceExtensions.has(path.extname(entry.name)) && target !== script) yield target;
  }
}

const failures = [];
for (const file of files(root)) {
  const lines = fs.readFileSync(file, "utf8").split(/\r?\n/);
  for (let index = 0; index < lines.length; index += 1) {
    for (const [label, pattern] of forbidden) {
      if (pattern.test(lines[index])) {
        failures.push(`${path.relative(root, file)}:${index + 1}: ${label}`);
      }
    }
  }
}

if (failures.length > 0) {
  console.error(failures.join("\n"));
  process.exit(1);
}

console.log(`portable: ${root}`);
