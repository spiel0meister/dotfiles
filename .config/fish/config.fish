function fish_greeting
end

alias ls="ls -al --color"
alias nv="nvim"

fish_add_path $HOME/.local/bin/ $HOME/github/Odin/ $HOME/.cargo/bin/

# zoxide
zoxide init fish | source

# fzf
fzf --fish | source
