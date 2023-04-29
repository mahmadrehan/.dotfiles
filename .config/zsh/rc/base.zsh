# Some base config lies here

ZSH_THEME="robbyrussell"

# some shell envs vars
export DOCKER_BUILDKIT=0
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"
export PNPM_HOME="$HOME/.local/share/pnpm"
export ANSIBLE_SCRIPT_DIR="/run/media/drives/documentSSD/main/Scripts/ansible"
export VOLTA_HOME="$HOME/.volta"
export ANDROID_SDK_HOME="$HOME/.android"

# INFO: some keymaps
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^g "source goto-project\n"
