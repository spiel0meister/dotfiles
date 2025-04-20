function fish_greeting
end

function fish_prompt
    function get_git_status
        if which git > /dev/null
            printf "%s" "$(git status --short 2> /dev/null)"
        end
    end

    function get_git_branch
        if which git > /dev/null
            printf "%s" "$(git branch --show-current 2> /dev/null)"
        end
    end

    set branch $(get_git_branch)
    set git_status $(get_git_status)

    set prompt "[34m$USER[0m@[34m$hostname[0m [32m$PWD[0m"
    if test -n $branch
        set prompt $(string join "" $prompt " ([33m$branch[0m)")
    end
    if test -n $status
        set prompt $(string join "" $prompt "< ")
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
