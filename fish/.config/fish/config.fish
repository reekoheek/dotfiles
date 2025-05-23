#--- SYSTEM

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE ""
set -x COLORTERM truecolor

set PATH /usr/local/bin /usr/bin /bin /usr/local/sbin /usr/sbin /sbin

if test -d "/Library/Apple"
	set -a PATH /Library/Apple/usr/bin
end

if test -d "/Applications/kitty.app"
	set -a PATH /Applications/kitty.app/Contents/MacOS
end

if test -d "$HOME/bin"
	set -a PATH "$HOME/bin"
end

if test -d "$HOME/.local/bin"
	set -a PATH "$HOME/.local/bin"
end

#--- ANDROID

if test -d "$HOME/Library/Android/sdk"
	set -x ANDROID_SDK_ROOT "$HOME/Library/Android/sdk"
	set -x ANDROID_HOME "$HOME/Library/Android/sdk"
	set -p PATH "$ANDROID_HOME/platform-tools" "$ANDROID_HOME/cmdline-tools/latest/bin"
end

#--- BAT

set -x BAT_THEME "gruvbox-dark"

#--- CURL

if test -d "/usr/local/opt/curl/bin"
	fish_add_path /usr/local/opt/curl/bin
end

#--- DOCKER

# set -x COMPOSE_DOCKER_CLI_BUILD 1
# set -x DOCKER_BUILDKIT 1

#--- DOTNET


set -x DOTNET_ROOT "/usr/local/share/dotnet"
set -a PATH "$DOTNET_ROOT"

#--- FLUTTER

set -x CHROME_EXECUTABLE "/Applications/Google Chrome Canary.app/Contents/MacOS/Google Chrome Canary"
if test -d "$HOME/opt/flutter"
	set -a PATH "$HOME/opt/flutter/bin"
end

#--- FZF

set fzf_fd_opts --hidden --exclude=.git
set -x FZF_DEFAULT_COMMAND "fd --type=f --hidden --exclude=.git"
# set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

#--- GO

# if test -s "$HOME/.gvm/scripts/gvm"
#	function gvm
#	bass source "$HOME/.gvm/scripts/gvm" ';' gvm $argv
#	end
# end

set -x GOPATH "$HOME/var/go"
set -a PATH "$GOPATH/bin"

#-- JAVA

if test -d "$HOME/.jenv"
	set -x JAVA_HOME (jenv javahome)
#	set -x JDTLS_HOME ~/opt/jdt-language-server
#	set -a PATH "$HOME/.jenv/bin"
#	# status --is-interactive; and source (jenv init -|psub)
end

#-- JBANG

if test -d "$HOME/.jbang"
	alias j!=jbang
	set -a PATH "$HOME/.jbang/bin"
end


#--- MYSQL

if test -d "/usr/local/opt/mysql-client"
	set -p PATH "/usr/local/opt/mysql-client/bin"
end

#--- RUST

if test -d "$HOME/.cargo"
	set -p PATH "$HOME/.cargo/bin"
end

#--- STARSHIP

starship init fish | source

#--- ZOXIDE

zoxide init fish | source

#--- INTERACTIVE

if status is-interactive
	# Commands to run in interactive sessions can go here
	set fish_greeting ""
	set -U fish_key_bindings fish_default_key_bindings
	# fish_vi_key_bindings

	alias htop='sudo htop'
	alias mtr='sudo mtr'
	alias ducks='du -cks * | sort -rn | head'
	alias v=nvim
	alias g=git
	alias ssh="kitty +kitten ssh"
end

# bun
set -Ux BUN_INSTALL "/Users/reekoheek/.bun"
fish_add_path "/Users/reekoheek/.bun/bin"


# pnpm
set -gx PNPM_HOME "/Users/reekoheek/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end