source ~/.zplug/init.zsh

zplug zsh-users/zsh-syntax-highlighting
zplug zsh-users/zsh-completions
zplug zsh-users/zsh-autosuggestions, from:github
zplug zsh-users/zsh-history-substring-search

zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

zplug "lib/*", from:oh-my-zsh

zplug load

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

eval "$(pyenv init -)"
eval "$(fasd --init auto)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Gopath
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Transfer.sh 
transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }
