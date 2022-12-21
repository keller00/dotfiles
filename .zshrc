zstyle ':completion:*' completer _complete _ignored _correct
zstyle ':completion:*' max-errors 3
zstyle :compinstall filename '/Users/mark/.zshrc'

autoload -Uz compinit
compinit
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch notify
unsetopt autocd beep extendedglob
bindkey -v

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
zplug "agkozak/zsh-z", as:plugin, from:github
zplug "zsh-users/zsh-autosuggestions", as:plugin, from:github
zplug "dikiaap/dotfiles", as:theme, from:github, use:.oh-my-zsh/themes/oxide.zsh-theme

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
bindkey "^[[3~" delete-char
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

# Make virtualenvs reproducible
export VIRTUALENV_PIP="embed"
export VIRTUALENV_SETUPTOOLS="embed"
export VIRTUALENV_WHEEL="embed"
export VIRTUALENV_NO_PERIODIC_UPDATE="True"

eval "$(aactivator init)"

# Note to future self: use .aliases for aliases, use .profile for local only settings, and this file is for everything else
