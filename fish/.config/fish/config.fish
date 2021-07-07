#--- SYSTEM

alias htop='sudo htop'
alias mtr='sudo mtr'
alias ducks='du -cks * | sort -rn | head'
alias v=nvim

# set -gx LC_ALL en_US.UTF-8
# set -gx LANG en_US.UTF-8
# set -gx LC_ALL en_US.UTF-8
# set -gx LC_CTYPE ""
# set -gx COLORTERM truecolor

if test -d "$HOME/bin"
    set -gx PATH $PATH "$HOME/bin"
end

#--- ANDROID

if test -d "$HOME/Library/Android/sdk"
    set -gx ANDROID_SDK_ROOT "$HOME/Library/Android/sdk"
    set -gx ANDROID_HOME "$HOME/Library/Android/sdk"
    set -gx PATH "$ANDROID_HOME/platform-tools" "$ANDROID_HOME/tools/bin" $PATH
end

#--- BAT

set -gx BAT_THEME "gruvbox-dark"

#--- DOCKER

# set -gx COMPOSE_DOCKER_CLI_BUILD 1
# set -gx DOCKER_BUILDKIT 1

#--- FLUTTER

if test -d "$HOME/opt/flutter"
    set -gx PATH $PATH "$HOME/opt/flutter/bin"
end

#--- FZF

set fzf_fd_opts --hidden --exclude=.git
set -gx FZF_DEFAULT_COMMAND "fd --type=f --hidden --exclude=.git"
# set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

#--- GIT

alias g=git

#--- GO

if test -s "$HOME/.gvm/scripts/gvm"
    function gvm
        bass source "$HOME/.gvm/scripts/gvm" ';' gvm $argv
    end
end

set -gx GOPATH "$HOME/var/go"
set -gx PATH $PATH "$GOPATH/bin"

#--- JAVA

if test -d "$HOME/.jenv"
	set -gx PATH "$HOME/.jenv/bin" $PATH
  # status --is-interactive; and source (jenv init -|psub)
end

#--- RUST

if test -d "$HOME/.cargo"
    set -gx PATH "$HOME/.cargo/bin" $PATH
end

#--- STARSHIP

starship init fish | source

#--- ZOXIDE

zoxide init fish | source

#--- INTERACTIVE

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting ""
    fish_vi_key_bindings
end
