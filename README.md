# dotfiles

These are my dotfiles managed by [stow](https://www.gnu.org/software/stow/).

## Setting up

1. Install stow

    ```sh
    brew install stow
    ```

2. Clone this repository

    ```sh
    git clone git@github.com:keller00/dotfiles
    ```

3. Install the symlinks

    ```sh
    stow .
    ```

## Get rid of dotfiles

Simply execute `stow --delete .`
