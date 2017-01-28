export ZPLUG_HOME=$HOME/.zplug

if ! [[ -d $ZPLUG_HOME ]]; then
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
    FRESH_INSTALL=true
fi
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-syntax-highlighting"
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"
#zplug "plugins/pyenv", from:oh-my-zsh, if:"[ -d $HOME/.pyenv ]"
#zplug "plugins/rbenv", from:oh-my-zsh, if:"[ -d $HOME/.rbenv ]"

if (($+FRESH_INSTALL)); then
    zplug install
    zplug clear
fi

zplug load

# if zplug failed
# source ~/.extra.sh
# unsetopt menu_complete   # do not autoselect the first completion entry
# unsetopt flowcontrol
# setopt auto_menu         # show completion menu on successive tab press
# setopt complete_in_word
# setopt always_to_end
# zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|?=** r:|?=**'
# zstyle ':completion:*' menu select
# autoload -Uz promptinit
# promptinit
#
# my-backward-delete-word() {
#     local WORDCHARS=${WORDCHARS/\//}
#     zle backward-delete-word
# }
# zle -N my-backward-delete-word
# bindkey '^W' my-backward-delete-word
#
# stty sane
# bindkey -e

alias vi="nvim -p"
alias vif="fzf | xargs nvim"
export EDITOR=nvim
export PATH=$HOME/.local/bin:$PATH
export TERM=screen-256color

PROMPT='%F{green}%1~%f %# '
RPROMPT=" %F{yellow}%(1j.%j.)%{$reset_color%}"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'
