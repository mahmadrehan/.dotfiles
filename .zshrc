h=$HOME
export ZSH="$h/.oh-my-zsh"
export ZSH_CUSTOM_DIR="$h/.config/zsh"
export CHROME_EXECUTABLE="/usr/bin/chromium"
export ANDROID_HOME=$HOME/Android/Sdk
export EDITOR="/usr/bin/nvim"

DOC_SSD_LOC="/run/media/drives/documentSSD"
EXT_SDD_LOC="/run/media/drives/freeNVMe"

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#555,bg=#000,bold" #,underline"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666,bold" #,underline"

HYPHEN_INSENSITIVE="true"
plugins=( git z zsh-autosuggestions )

# other stuff
source $ZSH/oh-my-zsh.sh
source <(kubectl completion zsh)
source "$ZSH_CUSTOM_DIR/rc/alias.zsh"
source "$ZSH_CUSTOM_DIR/rc/base.zsh"
source "$ZSH_CUSTOM_DIR/rc/paths.zsh"

# starship
eval "$(starship init zsh)"

# bun completions
[ -s "$h/.bun/_bun" ] && source "$h/.bun/_bun"
# rust completions
[ -f ~/.cargo/env ] && source $HOME/.cargo/env


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
