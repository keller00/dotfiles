#!/bin/sh

system_type=$(uname -s)

function yes_or_no {
    while true; do
        read -p "$* [y/n]: " yn
        case $yn in
            [Yy]*) return 0  ;;
            [Nn]*) return  1 ;;
        esac
    done
}

if [[ "$system_type" = "Darwin" ]]; then

    # install homebrew if it's missing
    if ! command -v brew >/dev/null 2>&1; then
        yes_or_no "Should install install homebrew?" && \
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    if command -v brew >/dev/null 2>&1; then
        brew analytics off
        yes_or_no "Should install ~/.Brewfile?" && \
        brew bundle --global
    fi
fi

PYTHON_VER="3"
HOME_PYTHON_LOC=".local/opt/venv"
PYTHON="python${PYTHON_VER}"
if command -v ${PYTHON} >/dev/null 2>&1; then
    yes_or_no "Should setup home Python ${PYTHON_VER}?" && \
    ${PYTHON} -m venv ${HOME_PYTHON_LOC} && \
    . ${HOME_PYTHON_LOC}/bin/activate && \
    pip install -U pip setuptools wheel && \
    pip install -U all-repos pipx && \
    for dep in pre-commit virtualenv hatch aactivator ; do
        pipx install ${dep}
    done
    pre-commit init-templatedir ~/.git-template
    deactivate
    # Setup all-repos symlinks
    pushd ~/.local/opt/venv/bin > /dev/null && \
        ls all-repos-* pipx | xargs -I % ln -fs ~/.local/opt/venv/bin/% ~/.local/bin/% && \
    popd > /dev/null
fi

echo "Setting up ~/.git-template"
pre-commit init-templatedir ~/.git-template

echo "Make sure neovim, 1password, and lazygit is installed"
