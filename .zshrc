# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# User configuration
if [[ -d "$(brew --prefix)/opt/zplug" ]]; then
    export ZPLUG_HOME="$(brew --prefix)/opt/zplug"
else
    export ZPLUG_HOME="${HOME}/.zplug"
fi
source $ZPLUG_HOME/init.zsh

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

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Important PATH and other variables
export EDITOR='nvim'

if [[ -d "${HOME}/.bin" ]]; then
    export PATH="${HOME}/.bin:${PATH}"
fi

if [[ -d "/usr/local/bin" ]]; then
    export PATH="/usr/local/bin:${PATH}"
fi

if [[ -f .profile ]]; then
  source .profile
fi
# Custom aliases
if [[ -f .aliases ]]; then
  source .aliases
fi
# Note to future self: use .aliases for aliases, use .profile for local only settings, and this file is for everything else
