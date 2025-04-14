function fish_greeting
end

function fish_prompt
    function get_git_branch
        if which git > /dev/null
            printf "%s" "$(git branch --show-current 2> /dev/null)"
        end
    end

    set branch $(get_git_branch)
    if test -z $branch
        echo "[34m$USER[0m@[34m$hostname[0m [32m$PWD[0m\$ "
    else
        echo "[34m$USER[0m@[34m$hostname[0m [32m$PWD[0m ([33m$branch[0m)\$ "
    end
end

alias ls="ls -al --color"
alias nv="nvim"

fish_add_path $HOME/.local/bin/ $HOME/github/Odin/ $HOME/.cargo/bin/

# zoxide
zoxide init fish | source

# fzf
fzf --fish | source
