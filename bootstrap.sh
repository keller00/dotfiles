#!/bin/sh

system_type=$(uname -s)
THIS_DIR=$(dirname "$0")
PYTHON_VER="3"
HOME_DIR="${HOME}"
HOME_PYTHON_LOC="${HOME_DIR}/.local/opt/venv"
PYTHON="python${PYTHON_VER}"

(cd "${THIS_DIR}" && stow --delete . || true && mkdir -p "${HOME_DIR}/.local/bin" && stow .)

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

if command -v ${PYTHON} >/dev/null 2>&1; then
    yes_or_no "Should setup home Python ${PYTHON_VER}?" && \
    ${PYTHON} -m venv ${HOME_PYTHON_LOC} && \
    . ${HOME_PYTHON_LOC}/bin/activate && \
    pip install -U pip setuptools wheel && \
    pip install -U pipx && \
    pipx install --force pre-commit virtualenv all-repos &&
    pre-commit init-templatedir "${HOME_DIR}/.git-template"
    deactivate
fi

echo "Setting up ${HOME_DIR}/.git-template"
pre-commit init-templatedir "${HOME_DIR}/.git-template"

echo "Make sure neovim, 1password, lazygit and ghostty is installed"
