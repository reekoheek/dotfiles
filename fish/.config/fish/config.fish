#--- SYSTEM

set LC_ALL en_US.UTF-8
set LANG en_US.UTF-8
set LC_ALL en_US.UTF-8
set LC_CTYPE ""
set COLORTERM truecolor

set PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin

if test -d "/Library/Apple"
    set -a PATH /Library/Apple/usr/bin
end

if test -d "/Applications/kitty.app"
    set -a PATH /Applications/kitty.app/Contents/MacOS
end

if test -d "$HOME/bin"
    set -a PATH "$HOME/bin"
end

#--- ANDROID

if test -d "$HOME/Library/Android/sdk"
    set ANDROID_SDK_ROOT "$HOME/Library/Android/sdk"
    set ANDROID_HOME "$HOME/Library/Android/sdk"
    set -p PATH "$ANDROID_HOME/platform-tools" "$ANDROID_HOME/tools/bin"
end

#--- BAT

set BAT_THEME "gruvbox-dark"

#--- DOCKER

# set COMPOSE_DOCKER_CLI_BUILD 1
# set DOCKER_BUILDKIT 1

#--- FLUTTER

if test -d "$HOME/opt/flutter"
    set -a PATH "$HOME/opt/flutter/bin"
end

#--- FZF

set fzf_fd_opts --hidden --exclude=.git
set -x FZF_DEFAULT_COMMAND "fd --type=f --hidden --exclude=.git"
# set FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

#--- GO

# if test -s "$HOME/.gvm/scripts/gvm"
#     function gvm
#         bass source "$HOME/.gvm/scripts/gvm" ';' gvm $argv
#     end
# end

set GOPATH "$HOME/var/go"
set -a PATH "$GOPATH/bin"

#-- JAVA

# if test -d "$HOME/.jenv"
#     set -a PATH "$HOME/.jenv/bin"
#     # status --is-interactive; and source (jenv init -|psub)
# end

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
    fish_vi_key_bindings

    alias htop='sudo htop'
    alias mtr='sudo mtr'
    alias ducks='du -cks * | sort -rn | head'
    alias v=nvim
    alias g=git
end
