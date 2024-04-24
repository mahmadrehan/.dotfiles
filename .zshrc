h=$HOME
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM_DIR="$h/.config/zsh"
export CHROME_EXECUTABLE="/usr/"
export ANDROID_HOME=$HOME/Library/Android/sdk
export EDITOR="/usr/bin/nvim"

export DOC_SSD_LOC="/Volumes/documentSSD"
export EXT_SDD_LOC="/Volumes/freeNVMe"

source $ZSH/oh-my-zsh.sh

# INFO: Autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#AAA,bold"
# source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

plugins=(
  git
  zsh-syntax-highlighting
  # zsh-completions
  zoxide
 podman bun golang volta)

HYPHEN_INSENSITIVE="true"

# other stuff
source "$ZSH_CUSTOM_DIR/rc/base.zsh"
source "$ZSH_CUSTOM_DIR/rc/alias.zsh"
source "$ZSH_CUSTOM_DIR/rc/paths.zsh"

# starship
source <(/opt/homebrew/bin/starship init zsh --print-full-init)
export STARSHIP_CONFIG=~/.config/startship.toml

# bun completions
[ -s "$h/.bun/_bun" ] && source "$h/.bun/_bun"
# rust completions
[ -f ~/.cargo/env ] && source $HOME/.cargo/env

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

CONDA_PATH="/Users/aether/anaconda3"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/aether/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/aether/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/aether/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/aether/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "/home/aether/.bun/_bun" ] && source "/home/aether/.bun/_bun"

eval "$(fzf --zsh)"

# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd() {
    \builtin pwd -L
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd() {
    # shellcheck disable=SC2164
    \builtin cd -- "$@"
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
function __zoxide_hook() {
    # shellcheck disable=SC2312
    \command zoxide add -- "$(__zoxide_pwd)"
}

# Initialize hook.
# shellcheck disable=SC2154
if [[ ${precmd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]] && [[ ${chpwd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]]; then
    chpwd_functions+=(__zoxide_hook)
fi

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

__zoxide_z_prefix='z#'

# Jump to a directory using only keywords.
function __zoxide_z() {
    # shellcheck disable=SC2199
    if [[ "$#" -eq 0 ]]; then
        __zoxide_cd ~
    elif [[ "$#" -eq 1 ]] && { [[ -d "$1" ]] || [[ "$1" = '-' ]] || [[ "$1" =~ ^[-+][0-9]$ ]]; }; then
        __zoxide_cd "$1"
    elif [[ "$@[-1]" == "${__zoxide_z_prefix}"?* ]]; then
        # shellcheck disable=SC2124
        \builtin local result="${@[-1]}"
        __zoxide_cd "${result:${#__zoxide_z_prefix}}"
    else
        \builtin local result
        # shellcheck disable=SC2312
        result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -- "$@")" &&
            __zoxide_cd "${result}"
    fi
}

# Jump to a directory using interactive search.
function __zoxide_zi() {
    \builtin local result
    result="$(\command zoxide query --interactive -- "$@")" && __zoxide_cd "${result}"
}

# Completions.
if [[ -o zle ]]; then
    function __zoxide_z_complete() {
        # Only show completions when the cursor is at the end of the line.
        # shellcheck disable=SC2154
        [[ "${#words[@]}" -eq "${CURRENT}" ]] || return 0

        if [[ "${#words[@]}" -eq 2 ]]; then
            _files -/
        elif [[ "${words[-1]}" == '' ]] && [[ "${words[-2]}" != "${__zoxide_z_prefix}"?* ]]; then
            \builtin local result
            # shellcheck disable=SC2086,SC2312
            if result="$(\command zoxide query --exclude "$(__zoxide_pwd)" --interactive -- ${words[2,-1]})"; then
                result="${__zoxide_z_prefix}${result}"
                # shellcheck disable=SC2296
                compadd -Q "${(q-)result}"
            fi
            \builtin printf '\e[5n'
        fi
        return 0
    }

    \builtin bindkey '\e[0n' 'reset-prompt'
    [[ "${+functions[compdef]}" -ne 0 ]] && \compdef __zoxide_z_complete __zoxide_z
fi

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

\builtin alias z=__zoxide_z
\builtin alias zi=__zoxide_zi

# =============================================================================
#
# To initialize zoxide, add this to your configuration (usually ~/.zshrc):
#
# eval "$(zoxide init zsh)"

# ---
