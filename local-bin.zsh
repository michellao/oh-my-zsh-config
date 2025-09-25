typeset -U path PATH
tmp=()
if (( $+commands[brew] )); then
  tmp+="$(brew --prefix rustup)/bin"
fi
if (( $+commands[composer] )); then
  tmp+="$(composer global -q config bin-dir --absolute)"
fi
path=(~/.local/bin ~/.cargo/bin $tmp $path)
export PATH
