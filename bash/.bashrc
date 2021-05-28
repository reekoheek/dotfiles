#--- SYSTEM

alias ls='ls -G'
alias ll='ls -la'
alias htop='sudo htop'
alias mtr='sudo mtr'
alias grep='grep --color=auto'
alias ducks='du -cks * | sort -rn | head'

export LC_ALL=en_US.UTF-8

shopt -s histappend # append to bash history file, rather than overwriting it

# BREW

if [ -f "`which brew`" ] && [ -f $(brew --prefix)/etc/bash_completion ]; then
	source $(brew --prefix)/etc/bash_completion
fi

#--- ANDROID

if [ -d "$HOME/Library" ]; then
	export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
	export ANDROID_HOME=$HOME/Library/Android/sdk
	export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$PATH
fi

#--- DOCKER

#export COMPOSE_DOCKER_CLI_BUILD=1
#export DOCKER_BUILDKIT=1

#--- FLUTTER

[ -d "$HOME/opt/flutter" ] && export PATH="$PATH:$HOME/opt/flutter/bin"

#--- FZF

if [ -d "$HOME/Library" ]; then
	if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
		export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
	fi

	[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.bash" 2> /dev/null

	source "/usr/local/opt/fzf/shell/key-bindings.bash"
fi

export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#--- GIT

alias g=git

#--- GO

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

export GOPATH=$HOME/var/go
export PATH=$PATH:$GOPATH/bin

#--- JAVA

if [ -d "$HOME/.jenv" ]; then
	export PATH="$HOME/.jenv/bin:$PATH"
	eval "$(jenv init -)"
fi

#--- NODE.JS

if [ -d "$HOME/.nvm" ]; then
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" --no-use # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

#--- RUST

[ -d "$HOME/.cargo" ] && export PATH="$HOME/.cargo/bin:$PATH"

#--- STARSHIP

eval "$(starship init bash)"

#---  ZOXIDE

eval "$(zoxide init bash)"

