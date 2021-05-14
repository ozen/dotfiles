# ls aliases
alias l='ls -lh'
alias la='ls -lAh'
alias lr='ls -tRh'
alias lS='ls -1Ssh'

# apt aliases which are similar to dnf aliases
alias aptl="apt list"
alias aptli="apt list --installed"
alias apti="sudo apt install"
alias aptr="sudo apt remove"
alias aptu="sudo apt update && sudo apt upgrade"
alias apts="apt search"
alias aptp="apt show"

# global shortcuts
alias -g H="| head"
alias -g T="| tail"
alias -g G="| grep"
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

# history aliases
alias h='history'
alias hs='history | grep'
alias hsi='history | grep -i'

# common aliases
alias c='clear'
alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '
(( $+commands[fd] )) || alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias duf='du -sh'
alias t='tail -f -n 100'
alias p="ps axf -o pid,ppid,user,etime,bsdtime,args"
alias reload!='. ~/.zshrc'

# custom aliases
alias backup="rsync -avv --delete --info=name1"
alias wnv="watch -n 0.5 -d -t nvidia-smi"
alias matlabc="matlab -nojvm -nodisplay -nosplash"
alias top="top -c -d 1"
alias ys="screen -d -R yigit-main"
alias youtube="noglob youtube-dl"
alias tb="tensorboard --logdir"
alias nb2py="jupyter nbconvert --to python"
alias snodeinfo='sinfo --Node -O "NodeList,StateCompact,CPUsState,Memory,AllocMem,Gres,GresUsed"'

# custom global aliases
alias -g docker-user-opts="-v=/etc/group:/etc/group:ro -v=/etc/passwd:/etc/passwd:ro -v=/etc/shadow:/etc/shadow:ro -v=/etc/sudoers:/etc/sudoers:ro -v=/etc/sudoers.d:/etc/sudoers.d:ro -v=/tmp/.X11-unix:/tmp/.X11-unix:rw -u=\$(id -u) -e='DISPLAY'"
alias -g ssh-bg="-A -f -C -q -N"

# functions
alias suz="noglob suz"

function matlabr {
    local command=$@
    matlab -nojvm -nodisplay -nosplash -nodesktop -r "try, $command; catch, exit(1), end, exit(0);"
    echo "matlab exit code: $?"
}

function activate {
    local VENV=${1:-venv}
    source $VENV/bin/activate
}

function topp {
    ytopp_args="-c -d 1"
    for pid in `pgrep -f $1`; do
        ytopp_args="$ytopp_args -p $pid"
    done
    top $(echo $ytopp_args | xargs)
}

function sok {
    local PORT=${2:-1080}
    ssh -D ${PORT} -A -f -C -q -N $1
}

function killsok {
    local PORT=${1:-1080}
    pkill -f "ssh -D ${PORT}"
}

function sshl {
    if [[ $1 =~ '^[0-9]+$' ]] ; then
        ssh -L $1':localhost:'$1 -A -f -C -q -N $2
    else
        ssh -L $1 -A -f -C -q -N $2
    fi
}

function sshr {
    if [[ $1 =~ '^[0-9]+$' ]] ; then
        ssh -R $1':localhost:'$1 -A -f -C -q -N $2
    else
        ssh -R $1 -A -f -C -q -N $2
    fi
}

function suz {
    sudo -u $1 HOME=$(echo ~$1) ZDOTDIR=$ZDOTDIR PATH=$PATH LD_LIBRARY_PATH=$LD_LIBRARY_PATH zsh
}

function set-proxy {
    export all_proxy=socks5://127.0.0.1:1080
    export http_proxy=http://127.0.0.1:8035
    export https_proxy=$http_proxy
    export ftp_proxy=$http_proxy
    export dns_proxy=$http_proxy
    export rsync_proxy=$http_proxy
    export no_proxy="localhost,127.0.0.1"
    export use_proxy=on
}

function unset-proxy {
    export use_proxy=off
}

function priv2pub {
    ssh-keygen -y -f $1 > $1.pub
}

function randomize {
    for inp in "$@"; do
        if [ -f "$inp" ]; then
            file_name=$(basename "$inp")
            dir_name=$(dirname "$inp")
            extension="${file_name##*.}"
            file_name="${file_name%.*}"
            if [ $file_name = $extension ]; then
                extension=""
            else
                extension=.$extension
            fi
            new_name=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)
            mv $inp $dir_name/$new_name$extension
        fi
    done
}

function cheat {
    curl cht.sh/$1
}

function path {
    if [[ -d "$1" ]] ; then
        if [[ -z "$PATH" ]] ; then
            export PATH=$1
        else
            export PATH=$PATH:$1
        fi
    fi
}

function ld-path {
    if [[ -d "$1" ]] ; then
        if [[ -z "$LD_LIBRARY_PATH" ]] ; then
            export LD_LIBRARY_PATH=$1
        else
            export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$1
        fi
    fi
}

function sss {
    ssh $@ -t "screen -d -R yigit-main"
}

function retina {
    if [[ -z "$1" ]] ; then
        ssh retina.cs.bilkent.edu.tr -t "screen -d -R yigit-main"
    else
        if [[ $HOSTNAME == "retina" ]] ; then
            ssh retina$1
        else
            ssh -J retina.cs.bilkent.edu.tr retina$1 -t "screen -d -R yigit-main"
        fi 
    fi
}

function retina-bridge {
    pkill -f 'ssh -L 9101'
    ssh -L 9101:localhost:9101 -L 9102:localhost:9102 -L 9103:localhost:9103 -L 2222:localhost:22 -J retina.cs.bilkent.edu.tr -A -f -C -q -N retina$1
}

function bridge {
    local PORT=${2:-2222}
    pkill -f 'ssh -L 9101'
    ssh -L 9101:localhost:9101 -L 9102:localhost:9102 -L 9103:localhost:9103 -L ${PORT}:localhost:22 -A -f -C -q -N $1
}

function argos-bridge {
    local TARGET=${1:-yigit}
    local PORT=${2:-2222}
    pkill -f 'ssh -L 9101'
    ssh -L 3390:localhost:3389 -L 9101:localhost:9101 -L 9102:localhost:9102 -L 9103:localhost:9103 -L ${PORT}:localhost:22 -J 10.0.90.1 -A -f -C -q -N ${TARGET}
}

function swap {
    mv $1.backup $1.backup2; mv $1 $1.backup; mv $1.backup2 $1
}

function ducks {
    local DIR=${1:-.}
    local N=${2:-30}
    du -a $DIR | sort -n -r | head -n $N
}

function dducks {
    local DIR=${1:-.}
    local N=${2:-30}
    du $DIR | sort -n -r | head -n $N
}

function count {
    if [[ -z "$2" ]] ; then
        find $1 -type f | wc -l
    else
        find $2 -type f -name $1 | wc -l
    fi
}

function dcount {
    local DIR=${1:-.}
    local D=${2:-1}
    for d in $(find ${DIR} -maxdepth ${D} -type d); do 
        echo ${d} $(count ${d})
    done
}

function sundrain {
    sudo scontrol update NodeName=$1 State=DOWN Reason="undraining"
    sudo scontrol update NodeName=$1 State=RESUME
}

