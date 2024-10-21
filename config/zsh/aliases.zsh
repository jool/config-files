# Get operating system
platform='unknown'
unamestr=$(uname)
if [[ $unamestr == 'Linux' ]]; then
  platform='linux'
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi

alias erlgrep='find . -name "*.[h|e]rl" | xargs grep --color $1'
alias emacs='emacs -nw'
alias git-co-master-pull-and-prune="git co master && git pull && git fetch --prune"
alias e='emacsclient -t'
alias vi='nvim'

alias get_proxy="gcloud compute instances list | grep proxy | awk '{print $4}'"
