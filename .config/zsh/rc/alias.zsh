############################################################################
#                    All of my aliases lie here                            #
############################################################################
OC_SSD_LOC="/Volumes/documentSSD"
EXT_SDD_LOC="/Volumes/freeNVMe"
MAIN_HDD_LOC="/Volumes/HDD1"

## Common / general ##

alias n="nvim"
alias np="nvim ."
alias t='tmux new-session -s "$(basename "$(pwd)")"'
alias t2="tmux"
alias tls="tmux ls"
alias tattach="tmux attach -t"
alias tdetach="tmux detach"
alias cat="bat"
alias grep="rg"
alias l="lsd"
alias ll="lsd -laS"
alias lll="lsd -laS --total-size"
alias tree="lsd --tree"
 # alias rm="rm -I --preserve-root"
alias untar="tar -zxvf $1"
alias kpid="kill -SIGKILL"
alias rmnm="find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +"
alias oimg="kitty +kitten icat"

alias gaa="git add ."
alias gcm="git commit -m"
alias gps="git push"

alias gtp="source goto-project"
alias gtup="source goto-university-stuff"

## For managing dotfiles ##

alias dotconfig="/usr/bin/git --git-dir=$HOME/dotfiles.git --work-tree=$HOME"

## chmod-ing ##

alias 644='chmod 644'
alias 755='chmod 755'
alias 777='chmod 777'

## development related ##

alias py='python3'
alias rust="rustc"
alias pip-update="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"

alias dev="./scripts/dev.sh"
alias ljv="sudo archlinux-java status"
alias sjv="sudo archlinux-java set"
alias listenvs="conda info --envs"

alias pman="podman"

# INFO: quick command to filter and remove select
#       > docker rmi -f $(docker images | grep "fastapi" | awk "{print \$3}")


## for navigating to directories ##

alias gtmain="cd $DOC_SSD_LOC/main"
alias gthdd="cd $MAIN_HDD_LOC/data"

alias clib="cd $DOC_SSD_LOC/main/GitHub/library"
alias prjs="cd $DOC_SSD_LOC/main/Projects"
alias rndm="cd $DOC_SSD_LOC/main/Random"
alias docs="cd $DOC_SSD_LOC/main/Documentation"
alias github="cd $DOC_SSD_LOC/main/GitHub"

## for navigating to config dirs ##

alias nvimconf="cd ~/.config/nvim && n ."
alias zconf="cd ~/.config/zsh && n ."
alias termconf="cd ~/.config/kitty"
# alias hypconf="cd ~/.config/hypr/ && n hyprland.conf"
# alias wayconf="cd ~/.config/waybar/ && n config.jsonc"
alias i3conf="cd ~/.config/i3/ && n config"
alias polyconf="cd ~/.config/polybar/ && n config"
