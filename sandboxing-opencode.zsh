if [[ "$OSTYPE" = "linux"* ]]; then
  opencode() {
    bwrap \
      --die-with-parent \
      --unshare-all \
      --share-net \
      --bind $PWD $PWD \
      --chdir $PWD \
      `# Basic filesystem structure` \
      --ro-bind /usr /usr \
      --symlink usr/lib /lib64 \
      --dev /dev \
      --proc /proc \
      --tmpfs /tmp \
      --ro-bind /run /run \
      `# Minimal /etc files needed` \
      --ro-bind /etc/resolv.conf /etc/resolv.conf \
      --ro-bind /etc/hosts /etc/hosts \
      --ro-bind /etc/nsswitch.conf /etc/nsswitch.conf \
      --ro-bind /etc/passwd /etc/passwd \
      --ro-bind /etc/group /etc/group \
      --ro-bind /etc/localtime /etc/localtime \
      `# SSL certificates for API access` \
      --ro-bind /etc/ssl /etc/ssl \
      --ro-bind-try /etc/ca-certificates /etc/ca-certificates \
      `# Opencode path` \
      --ro-bind $HOME/.local/share/mise $HOME/.local/share/mise \
      --bind $HOME/.local/share/opencode $HOME/.local/share/opencode \
      --bind $HOME/.local/share/opentui $HOME/.local/share/opentui \
      --bind $HOME/.local/state/opencode $HOME/.local/state/opencode \
      --bind $HOME/.cache/opencode $HOME/.cache/opencode \
      --bind $HOME/.config/opencode $HOME/.config/opencode \
    opencode "$@"
  }
fi
