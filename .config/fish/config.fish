function fish_greeting
end

function fish_prompt
    set prompt "[34m$USER[0m@[34m$hostname[0m [32m$PWD[0m"
    if which git > /dev/null
        if git status > /dev/null 2> /dev/null
            set branch "$(git branch --show-current)"
            set prompt $(string join "" $prompt " ([33m$branch[0m)")

            if test -n "$(git status -u no --porcelain 2> /dev/null)"
                set prompt $(string join "" $prompt "^")
            end

            if test -n "$(git status --short 2> /dev/null)"
                set prompt $(string join "" $prompt "<")
            end

            set prompt $(string join "" $prompt " ")
        end
    end
    set prompt $(string join "" $prompt "\$ ")
    
    echo -n "$prompt"
end

alias ls="ls -al --color"
alias nv="nvim"

fish_add_path $HOME/.local/bin/ $HOME/github/Odin/ $HOME/.cargo/bin/

# zoxide
zoxide init fish | source

# fzf
fzf --fish | source
