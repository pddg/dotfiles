# Ignoring warning of "zsh compinit: insecure files, run compaudit for list."
# export ZSH_DISABLE_COMPFIX=true

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk
autoload -Uz colors && colors
autoload -Uz vcs_info
autoload -Uz compinit && compinit -u
autoload -Uz +X bashcompinit && bashcompinit

### Completions
autoload history-search-end
autoload predict-on
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# 余分な空白は詰めて記録
setopt hist_reduce_blanks  

# 古いコマンドと同じものは無視 
setopt hist_save_no_dups

# historyコマンドは履歴に登録しない
setopt hist_no_store

# 補完時にヒストリを自動的に展開         
setopt hist_expand

# 履歴をインクリメンタルに追加
setopt inc_append_history

# パス補完をいいかんじにする
setopt magic_equal_subst

# インクリメンタルからの検索
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

setopt AUTO_PARAM_KEYS
setopt inc_append_history


zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
autoload predict-on
zle -N predict-on
zle -N predict-off
bindkey '^X^P' predict-on
bindkey '^O' predict-off
zstyle ':predict' verbose true

### Prompts

PROMPT='%F{green}%m:%f%F{blue}%~%f ${vcs_info_msg_0_} $(kube_ps1)
%(?.%(!.#.$).%F{red}!%f) '
PROMPT2="> "

setopt prompt_subst
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:*' unstagedstr "%F{red}*"
# 
zstyle ':vcs_info:*' formats "%F{green}%c%u%b%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
KUBE_PS1_CTX_COLOR="magenta"
KUBE_PS1_PREFIX=""
KUBE_PS1_SUFFIX=""
KUBE_PS1_SEPARATOR=""
KUBE_PS1_SYMBOL_ENABLE=false

function get_cluster_short() {
    fullClusterName="$1"
    if [[ $fullClusterName =~ ^gke\_.* ]]; then
        echo " $(echo $fullClusterName | cut -d _ -f2)"
    else
        echo $fullClusterName
    fi
}
KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short

### Plugins

zinit load momo-lab/zsh-abbrev-alias
zinit light zsh-users/zsh-autosuggestions
zinit ice wait'!0'; zinit load zsh-users/zsh-syntax-highlighting
zinit ice wait'!0'; zinit load zsh-users/zsh-completions

### Path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

### Anyenv
if  type anyenv > /dev/null 2>&1  ; then
    eval "$(anyenv lazyload)"
fi

### Environment variables
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config

###  Aliases
alias v='nvim'
alias vim='nvim'
alias ll='ls -l'
compdef v=vim
compdef vim=vim

alias k='kubectl'
alias tf='terraform'

# Other snippets
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^g' peco-src

# Completion
# なんかここで127で死ぬ。
# https://github.com/kubernetes/kubernetes/pull/88165
# https://github.com/kubernetes/kubectl/issues/125
if type kubectl > /dev/null 2>&1 ; then
    source <(kubectl completion zsh | sed /_bash_comp/d)
fi

# 現在のcontextが空のとき表示を消す
if type kubectx > /dev/null 2>&1 ; then
    kube_current_ctx=$(kubectx -c 2>&1)
    if [ $? != 0 ]; then
        kubeoff
    fi
fi
