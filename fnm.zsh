if (( $+commands[fnm] )); then
	eval "$(fnm env --use-on-cd --shell zsh)"
fi
