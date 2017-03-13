###########
# ALIASES #
###########

# basic 
alias la="ls -a"
alias ch='cd ~'
alias c='clear'
alias ..='cd ..;'
alias untar='tar -zxvf'
alias grep='grep --color=auto'
alias sw='telnet towel.blinkenlights.nl'

# git
alias gs="git status"
alias ga="git add -u"
alias gd="git diff --staged"
alias gcm="git commit -m"
alias gb="git branch"
alias krono="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
alias gcf="git add -u && git commit -m \"format\" && git push"
alias gcu="git add -u && git commit -m \"update\" && git push"
alias glog="git log --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

# osx
alias purgederiveddata='rm -rf ~/Library/Developer/Xcode/DerivedData/*'
alias clip='pbcopy <'

# file manipulation
alias rmspaces="for f in *\ *; do mv "$f" "${f// /-}"; done"

# tome
alias testmodeoiq='node ~/opt/workdesk-backend-simulator/index.js'
alias ssh-oiq-staging="ssh root@10.4.4.157"
alias ports='netstat -tulanp'
alias mike-last-seen='/Users/mike/Documents/oiq/workdesk-lastseen-helper/mike'

# python
alias p2='python'
alias p3='python3'
alias p2i='pip install'
alias sp2i='sudo pip install'
alias sp3i='sudo pip3 install'
alias p3i='pip3 install'


# FUNCTIONS #
#
function grepr()
{
    grep -r "$1" .
}

function _add_to()
{
    echo "$1" >> ~/Documents/stuff/$2
}

function idea:()
{
    str=""
    for var in "$@"
    do
        str="$str$var "
    done
    _add_to "$str" "ideas"
}

function song:()
{
    str=""
    for var in "$@"
    do
        str="$str$var "
    done
    _add_to "$str" "songs.txt" 
}

function book:()
{
    str=""
    for var in "$@"
    do
        str="$str$var "
    done
    _add_to "$str" "books.txt"
}



function rotate()
{
    convert $1 -rotate $2 "$2$1"
}

function mkcd()
{
    mkdir -p $1
    cd $1
}

