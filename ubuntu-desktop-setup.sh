# sudo apt update
# sudo apt install pipx
# pipx install gnome-extensions-cli --system-site-packages
# pipx ensurepath
# source ~./bashrc
# gext install disable-workspace-switcher@jbradaric.me
# gext install instantworkspaceswitcher@amalantony.net
gnome-extensions disable ubuntu-dock@ubuntu.com
gnome-extensions disable ding@rastersoft.com

gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 10

# Dash to Dock grabs Super+1..9/0 and Super+Shift+1..9/0 for pinned apps.
# Free those keys first, otherwise the workspace bindings below never receive
# the shortcuts.
if gsettings list-schemas | grep -qx 'org.gnome.shell.extensions.dash-to-dock'; then
	for n in 1 2 3 4 5 6 7 8 9 10; do
		gsettings set org.gnome.shell.extensions.dash-to-dock "app-hotkey-${n}" '@as []'
		gsettings set org.gnome.shell.extensions.dash-to-dock "app-shift-hotkey-${n}" '@as []'
	done
fi

# GNOME Shell also has Super+N "switch to application N" bindings on some
# versions; clear those too so they cannot shadow the workspace shortcuts.
for n in 1 2 3 4 5 6 7 8 9; do
	gsettings set org.gnome.shell.keybindings "switch-to-application-${n}" '@as []'
	# Super + N switches to workspace N; Super + Shift + N moves the window there
	gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-${n}" "['<Super>${n}']"
	gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-${n}" "['<Super><Shift>${n}']"
done

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 "['<Super>0']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 "['<Super><Shift>0']"

# A plain Super tap opens the Activities overview by default. Move that
# action to Super + Space so tapping Super alone no longer does anything.
gsettings set org.gnome.mutter overlay-key ''
gsettings set org.gnome.shell.keybindings toggle-overview "['<Super>space']"

# Ubuntu grabs Super + Space for input-source switching (and IBus does too),
# which shadows the overview binding above. Keep the XF86Keyboard keys as the
# input-source shortcuts and free Super + Space for GNOME Shell.
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['XF86Keyboard']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Shift>XF86Keyboard']"
if gsettings list-schemas | grep -qx 'org.freedesktop.ibus.general.hotkey'; then
	gsettings set org.freedesktop.ibus.general.hotkey triggers '@as []'
fi

# Super + Enter opens the system's default terminal application
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['<Super>Return']"

# Super + E opens the home folder in the default file manager
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"

# GNOME Shell grabs Super + N to focus the active notification, which shadows
# the browser media key below. Free it and give the shell time to release its
# grab before asking gsd-media-keys to grab the same combination.
gsettings set org.gnome.shell.keybindings focus-active-notification '@as []'
sleep 1

# Super + N opens the system's default browser
gsettings set org.gnome.settings-daemon.plugins.media-keys www "['<Super>n']"

# Super + W closes the active window (keep Alt + F4 as well)
gsettings set org.gnome.desktop.wm.keybindings close "['<Alt>F4', '<Super>w']"

# Super + F toggles fullscreen for the active window (keep F11 as well)
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['F11', '<Super>f']"
