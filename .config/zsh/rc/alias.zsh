############################################################################
#                    All of my aliases lie here                            #
############################################################################
OC_SSD_LOC="/run/media/drives/documentSSD"
EXT_SDD_LOC="/run/media/drives/freeNVMe"

## Common / general ##

alias nv="nvim"
alias cat="bat"
alias grep="rg"
alias l="lsd"
alias ll="lsd -laS"
alias lll="lsd -laS --total-size"
alias tree="lsd --tree"
alias rm="rm -I --preserve-root"
alias untar="tar -zxvf $1"
alias kpid="kill -SIGKILL"
alias gpustats="watch -n 1 nvidia-smi"
alias aursearch="yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk \"{print \$2}\")' | xargs -ro yay -S"

## For managing dotfiles ##

alias dotconfig="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"

## pacman ##

alias pup="sudo pacman -Syu --noconfirm"
alias pdown="sudo pacman -S $1"
alias psearch="sudo pacman -sS $1"
alias pshow-unused="sudo pacman -Qtdq"
alias pclean="sudo pacman -Sc"
alias pla="sudo pacman -Q"

## chmod-ing ##

alias 644='chmod 644'
alias 755='chmod 755'
alias 777='chmod 777'

## development related ##

alias py='python'
alias rust="rustc"
alias pip-update="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"

alias dev="./scripts/dev.sh"
alias cjv="sudo archlinux-java set"
alias activate="conda activate $1"
alias deactivate="conda deactivate"

alias rvh="ssh ubuntu@146.59.54.232 -i ~/.ssh/kodeddicted_ed25519"
alias testingserver="echo '404 server not found'"

alias setupk8s="bash ~/.config/scripts/setup/dev_k8s_cluster.sh"

## for navigating to directories ##

alias freessd="cd $EXT_SSD_LOC"
alias maindrive="cd $DOC_SSD_LOC/main"

alias clib="cd $DOC_SSD_LOC/main/GitHub/Library"
alias prjs="cd $DOC_SSD_LOC/main/Projects"
alias rndm="cd $DOC_SSD_LOC/main/Random"
alias docs="cd $DOC_SSD_LOC/main/Documentation"
alias github="cd $DOC_SSD_LOC/main/GitHub"

## for navigating to config dirs ##

alias nvimconf="cd ~/.config/nvim"
alias zconf="cd ~/.config/zsh"
alias termconf="cd ~/.config/alacritty"

## random ##

alias runopenbullet2="sudo docker run --name openbullet2 --rm -p 8069:5000 -it openbullet/openbullet2:latest"
