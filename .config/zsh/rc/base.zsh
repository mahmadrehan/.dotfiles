# Some base config lies here

ZSH_THEME="robbyrussell"

# some shell envs vars
export DOCKER_BUILDKIT=0
export DOCKER_HOST='unix:///Users/aether/.local/share/containers/podman/machine/qemu/podman.sock'
export PNPM_HOME="$HOME/.local/share/pnpm"
export ANSIBLE_SCRIPT_DIR="/Volumes/documentSSD/main/Scripts/ansible"
export VOLTA_HOME="$HOME/.volta"
export ANDROID_SDK_HOME="$HOME/.android"
# INFO: for compilers to find openjdk
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# INFO: some keymaps
bindkey -s ^f "source goto-project\n"
bindkey -s ^u "source goto-university-stuff\n"

setopt nocaseglob
