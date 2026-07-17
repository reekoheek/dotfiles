source /usr/share/cachyos-fish-config/cachyos-config.fish

set -Ux SUDO_EDITOR nvim

# load secrets
if test -f ~/secrets/config.fish
  source ~/secrets/config.fish
end

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# pnpm
set -gx PNPM_HOME "/home/reekoheek/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
