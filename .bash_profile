if [ -f ~/.bashrc ] ; then
	. ~/.bashrc
fi

export PATH="$HOME/.poetry/bin:$PATH"

. "$HOME/.cargo/env"
