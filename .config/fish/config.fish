# Env vars
set -x GOPATH $HOME/go
if test -d $GOPATH
    set -x PATH $GOPATH/bin $PATH
end
# Poetry
set -x POETRY_ROOT $HOME/.poetry
if test -d $POETRY_ROOT
    set -x PATH $POETRY_ROOT/bin $PATH
end

set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x PIPENV_VENV_IN_PROJECT true

# decors/fish-ghq
set -U GHQ_SELECTOR peco

# Color
set -x LSCOLORS gxfxcxdxbxegedabagacad

# Appearance
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
set -x theme_title_use_abbreviated_path yes
set -x theme_display_user no
set -x theme_date_format "+%m/%d %H:%M(%a)"
set -x theme_display_virtualenv yes
set -x theme_powerline_fonts yes
set -x theme_git_worktree_support no
set -x theme_display_git_ahead_verbose yes
set -x theme_display_git_master_branch yes
set -x theme_color_scheme dark
set -x fish_prompt_pwd_dir_length 1
set -x theme_project_dir_length 1
set -x theme_display_cmd_duration no
set -x theme_display_k8s_context no

# Setup hilighting
set -x fish_color_error ff260d
set -x fish_color_command 00a1f9
set -x fish_color_param 00ddef
set -x fish_color_quote ffc400
set -x fish_color_redirection ab7aef
set -x fish_color_escape 9ae204
set -x fish_color_operator 9ae204

if type nvim > /dev/null 2>&1
    # alias
	balias vim "nvim"
end

if type anyenv > /dev/null 2>&1
    source (anyenv init - fish | psub)
end

if test -e /proc/version; and grep -q Microsoft /proc/version
    umask 022
    set -x DISPLAY localhost:0.0
end
