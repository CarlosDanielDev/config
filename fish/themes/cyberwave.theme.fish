# Cyber Wave theme for Fish shell
# Coordinates with Neovim and tmux themes

# Define colors
set -l background "#0f1117"
set -l foreground "#e2e2e2"
set -l command "#5fb0ff"
set -l param "#b77fdb"
set -l path_color "#7dcfcf"
set -l error "#e56767"
set -l comment "#6272a4"
set -l selection "#2d3450"
set -l operator "#d787d7"
set -l quote "#7eca9c"
set -l redirection "#e0af68"
set -l match "#b77fdb"
set -l escape "#e0af68"
set -l autosuggestion "#4d5370"

# Syntax Highlighting
set -g fish_color_normal $foreground
set -g fish_color_command $command
set -g fish_color_keyword $param
set -g fish_color_quote $quote
set -g fish_color_redirection $redirection
set -g fish_color_end $operator
set -g fish_color_error $error
set -g fish_color_param $param
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $operator
set -g fish_color_escape $escape
set -g fish_color_autosuggestion $autosuggestion

# Pager colors
set -g fish_pager_color_prefix $command
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_progress $param
set -g fish_pager_color_selected_prefix $command
set -g fish_pager_color_selected_completion $foreground
set -g fish_pager_color_selected_description $path_color
set -g fish_pager_color_selected_background --background=$selection

# Prompt colors - if you're using a custom prompt, adjust as needed
set -g fish_color_cwd $path_color
set -g fish_color_user $param
set -g fish_color_host $command
set -g fish_color_host_remote $redirection

# Git prompt colors
set -g __fish_git_prompt_color $path_color
set -g __fish_git_prompt_color_branch $path_color
set -g __fish_git_prompt_color_dirtystate $redirection
set -g __fish_git_prompt_color_stagedstate $quote
set -g __fish_git_prompt_color_upstream $command

# Title
set -g fish_color_cancel -r

