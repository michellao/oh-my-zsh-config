typeset -U path PATH
tmp=()
if (( $+commands[brew] )); then
	tmp+="$(brew --prefix rustup)/bin"
fi
path=(~/.local/bin ~/.cargo/bin $tmp $path)
export PATH
