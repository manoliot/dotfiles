# Autocompletion and prompt
autoload -Uz compinit promptinit
compinit
promptinit
prompt redhat

# Vi keys
bindkey -v

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Export
export EDITOR="nvim"

# Alias
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'
alias grep='grep --color=auto'
alias rgrep='rgrep --color=auto'
alias my-youtube-dl='youtube-dl --write-info-json --write-description --write-annotations --download-archive archive.txt -o "%(uploader)s/%(upload_date)s - %(title)s [%(id)s].%(ext)s"'

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# FZF
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

export FZF_DEFAULT_COMMAND='fd --type f'

# The Fuck
eval $(thefuck --alias)

# Allow local customizations in the ~/.zshrc.local file
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
