filesystem_structure_args=(
  --ro-bind /usr /usr
  --symlink usr/lib /lib64
  --dev /dev
  --proc /proc
  --tmpfs /tmp
  --ro-bind /run /run
)

minimal_etc_files_args=(
  --ro-bind /etc/resolv.conf /etc/resolv.conf
  --ro-bind /etc/hosts /etc/hosts
  --ro-bind /etc/nsswitch.conf /etc/nsswitch.conf
  --ro-bind /etc/passwd /etc/passwd
  --ro-bind /etc/group /etc/group
  --ro-bind /etc/localtime /etc/localtime
)

ssl_certificates_args=(
  --ro-bind /etc/ssl /etc/ssl
  --ro-bind-try /etc/ca-certificates /etc/ca-certificates
)

if [[ "$OSTYPE" = "linux"* ]]; then
  opencode() {
    bwrap \
      --die-with-parent \
      --unshare-all \
      --share-net \
      --bind $PWD $PWD \
      --chdir $PWD \
      $filesystem_structure_args \
      $minimal_etc_files_args \
      $ssl_certificates_args \
      `# Opencode path` \
      --ro-bind $HOME/.local/share/mise $HOME/.local/share/mise \
      --bind $HOME/.agents $HOME/.agents \
      --bind $HOME/.local/share/opencode $HOME/.local/share/opencode \
      --bind $HOME/.local/share/opentui $HOME/.local/share/opentui \
      --bind $HOME/.local/state/opencode $HOME/.local/state/opencode \
      --bind $HOME/.cache/opencode $HOME/.cache/opencode \
      --bind $HOME/.config/opencode $HOME/.config/opencode \
    opencode "$@"
  }

  codex() {
    bwrap \
      --die-with-parent \
      --unshare-all \
      --share-net \
      --bind $PWD $PWD \
      --chdir $PWD \
      $filesystem_structure_args \
      $minimal_etc_files_args \
      $ssl_certificates_args \
      `# Codex path` \
      --ro-bind $HOME/.local/share/mise $HOME/.local/share/mise \
      --bind $HOME/.agents $HOME/.agents \
      --bind $HOME/.codex $HOME/.codex \
      codex "$@"
  }

  pi() {
    bwrap \
      --die-with-parent \
      --unshare-all \
      --share-net \
      --bind $PWD $PWD \
      --chdir $PWD \
      $filesystem_structure_args \
      $minimal_etc_files_args \
      $ssl_certificates_args \
      `# Pi path` \
      --ro-bind "$HOME/.local/share/mise" "$HOME/.local/share/mise" \
      --bind "$HOME/.agents" "$HOME/.agents" \
      --bind "$HOME/.pi" "$HOME/.pi" \
      pi "$@"
  }
fi

#pi() {
#  smolvm machine run -s "$ZSH_CUSTOM/Smolfile" -v $HOME/.agents:/home/sandbox/.agents -v $HOME/.pi:/home/sandbox/.pi -v $PWD:/workspace -it -- su -c "pi $@" sandbox
#}
