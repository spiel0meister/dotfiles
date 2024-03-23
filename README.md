# dotfiles

This are my dotfiles.

## Dependencies

- GNU stow
- git

## Installation

Clone the repository into your home directory:
```bash
git clone --depth=1 https://github.com/spiel0meister/dotfiles.git
```

Then, open the directory and run:
```bash
stow . --adopt
git restore .
```
