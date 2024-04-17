zstyle ':completion:*' completer _complete _ignored _correct
zstyle ':completion:*' max-errors 3
zstyle :compinstall filename '${HOME}/.zshrc'

autoload -Uz compinit
compinit

# History related settings
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000
SAVEHIST=1000
HISTORY_IGNORE="(ls|cd|pwd|exit|cd)*"
setopt INC_APPEND_HISTORY    # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY         # Share history between all sessions.
setopt HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE     # Do not record an event starting with a space.
setopt HIST_NO_STORE         # Don't store history commands
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history.
HIST_STAMPS="yyyy-mm-dd"     # Add timstamps to history entries.
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'  # Make sure ag is installed

setopt nomatch notify
unsetopt autocd beep extendedglob

# End of lines configured by zsh-newuser-install
if [[ -d "/usr/local/bin" ]]; then
    export PATH="/usr/local/bin:${PATH}"
fi

# Use case-sensitive completion.
CASE_SENSITIVE="true"

# User configuration
if command -v brew >/dev/null 2>&1 && [[ -d "$(brew --prefix)/opt/zplug" ]]; then
    export ZPLUG_HOME="$(brew --prefix)/opt/zplug"
else
    export ZPLUG_HOME="${HOME}/.zplug"
fi
. $ZPLUG_HOME/init.zsh

zplug "plugins/git", as:plugin, from:oh-my-zsh
zplug "plugins/fzf", as:plugin, from:oh-my-zsh
zplug "agkozak/zsh-z", as:plugin, from:github
zplug "zsh-users/zsh-autosuggestions", as:plugin, from:github
zplug "dikiaap/dotfiles", as:theme, from:github, use:.oh-my-zsh/themes/oxide.zsh-theme
zplug "olets/zsh-window-title", as:plugin, from:github

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# Important PATH and other variables
export EDITOR='nvim'

if [[ -d "${HOME}/.local/bin" ]]; then
    export PATH="${HOME}/.local/bin:${PATH}"
fi

if [[ -f "${HOME}/.profile" ]]; then
  . ${HOME}/.profile
fi
# Custom aliases
if [[ -f "${HOME}/.aliases" ]]; then
  . ${HOME}/.aliases
fi

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "\e[3~" delete-char

# Make virtualenvs reproducible
export VIRTUALENV_PIP="embed"
export VIRTUALENV_SETUPTOOLS="embed"
export VIRTUALENV_WHEEL="embed"
export VIRTUALENV_NO_PERIODIC_UPDATE="True"

eval "$(aactivator init)"

# Note to future self: use .aliases for aliases, use .profile for local only settings, and this file is for everything else
