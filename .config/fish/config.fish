function fish_greeting
end

function fish_prompt
    set -l last_status $status

    set time $(date +"%H:%M")
    set prompt ""

    if test $last_status -eq 0
        set prompt $(string join "" $prompt "[92mS[0m ")
    else
        set prompt $(string join "" $prompt "[31mF[0m ")
    end

    set prompt $(string join "" $prompt "[90m[$time][0m [34m$USER[0m@[34m$hostname[0m [32m$(prompt_pwd -D 3)[0m")
    if which git > /dev/null
        if git status > /dev/null 2> /dev/null
            set branch "$(git branch --show-current)"
            set human_readable "$(git describe --always --abbrev=7 2> /dev/null)"

            if [ -n "$branch" ]
                set prompt $(string join "" $prompt " ([33m$branch[0m)")
            else if [ -n "$human_readable" ]
                set prompt $(string join "" $prompt " [[33m$human_readable[0m]")
            end

            if git status -u no --porcelain -b 2> /dev/null | grep ahead > /dev/null
                set prompt $(string join "" $prompt "^")
            end

            if test -n "$(git status --short 2> /dev/null)"
                set prompt $(string join "" $prompt "<")
            end
        end
    end
    set prompt $(string join "" $prompt " | ")
    
    echo -n "$prompt"
end

function fish_right_prompt
    set file_count $(command ls -al | grep -E "^[^d].*" | wc -l)
    set dir_count $(math $(command ls -al | grep -E "^d.*" | wc -l) - 2)

    echo "[$file_count files] [$dir_count dirs]"
end

alias ls="ls -alh --color"
alias nv="nvim"

fish_add_path $HOME/.local/ $HOME/github/Odin/ $HOME/.cargo/bin/

# zoxide
zoxide init fish | source

# fzf
fzf --fish | source
