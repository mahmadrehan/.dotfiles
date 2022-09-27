export ZSH="/home/jupyter/.oh-my-zsh"
export ZSH_CUSTOM_DIR="/home/jupyter/.config/zsh"
export CHROME_EXECUTABLE="/usr/bin/chromium"
export ANDROID_HOME=$HOME/Android/Sdk
export EDITOR="/usr/bin/nvim"

ZSH_THEME="robbyrussell"
plugins=(
    git
    zsh-autosuggestions
)

# vim in terminal !!!!!!!!!!!!!!!
# set -o vi
# set editing-mode vi
# set keymap vi
# set show-mode-in-prompt on
# set vi-ins-mode-string "i"
# set vi-cmd-mode-string ":"

source $ZSH/oh-my-zsh.sh
source <(kubectl completion zsh)

DOC_SSD_LOC="/run/media/drives/documentSSD"
EXT_SDD_LOC="/run/media/drives/freeNVMe"

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#555,bg=#000,bold" #,underline"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666,bold" #,underline"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jupyter/anaconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jupyter/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jupyter/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jupyter/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Other Sourcing

# Custom aliases
source "$ZSH_CUSTOM_DIR/rc/alias.zsh"
source "$ZSH_CUSTOM_DIR/rc/base.zsh"
source "$ZSH_CUSTOM_DIR/rc/paths.zsh"

# bun completions
[ -s "/home/jupyter/.bun/_bun" ] && source "/home/jupyter/.bun/_bun"
