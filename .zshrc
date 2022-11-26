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

# Note to future self: use .aliases for aliases, use .profile for local only settings, and this file is for everything else
