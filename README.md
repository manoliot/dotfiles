# dotfiles

Personal dotfiles, managed by [GNU stow][stow].

## Installation

1. Clone this repository
```shell-session
$ git clone https://github.com/manoliot/dotfiles.git $HOME/.dotfiles
$ cd ~/.dotfiles
```

2. Symlink desired configuration files using [stow][stow], for example:
```shell-session
$ stow zsh
```

## License
MIT License (See [LICENSE](LICENSE) for details).

[stow]: https://www.gnu.org/s/stow/manual/stow.html
