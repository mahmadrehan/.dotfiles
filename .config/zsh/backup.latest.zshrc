# Some Global envs to set
export ZSH="/home/jupyter/.oh-my-zsh"
export ZSH_CUSTOM=/home/jupyter/.config/zsh
export CHROME_EXECUTABLE="/usr/bin/chromium"
export ANDROID_HOME=$HOME/Android/Sdk
export editor="/usr/bin/nvim"

###################################################################
#                             Base                                #
###################################################################

source "$ZSH_CUSTOM/rc/base.zsh"

###################################################################
#                      Related to zsh & other                     #
###################################################################

source $ZSH/oh-my-zsh.sh
source <(kubectl completion zsh)

###################################################################
#                             Aliases                             #
###################################################################

source "$ZSH_CUSTOM/rc/alias.zsh"

###################################################################
#                              Paths                              #
###################################################################

source "$ZSH_CUSTOM/rc/paths.zsh"

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
