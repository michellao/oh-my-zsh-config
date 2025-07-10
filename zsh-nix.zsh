NIX_SHELL_PATH=/usr/share/zsh/plugins/zsh-nix-shell/nix-shell.plugin.zsh
if [[ -f $NIX_SHELL_PATH ]]; then
    source $NIX_SHELL_PATH
fi
