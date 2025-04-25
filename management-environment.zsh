if (( $+commands[fnm] )); then
	eval "$(fnm env --use-on-cd --shell zsh)"
fi
if (( $+commands[pyenv] )); then
	eval "$(pyenv init - zsh)"
fi
