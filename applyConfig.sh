#!/bin/bash
if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
echo "You are running in Windows Subsystem for Linux, you will need a nerdfont pack to correctly display status bar icons."
echo "Howto on this to come later, or just bug me now about it"
echo ""
echo "Continuing in 5 seconds"
echo ""
sleep 5
fi

sudo apt install tmux xsel gcc -y
# We need to grab nvim from outside of the normal package repo due to the stable branch not having 0.10.0
# This is a quick and dirty, no error handling nor file/folder checks
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc
source ~/.bashrc

if ! [ -d ~/.config/tmux ]; then
mkdir -p ~/.config/tmux
fi

if ! [ -f ~/.config/tmux/tmux.conf ]; then
cat <<EOF > ~/.config/tmux/tmux.conf
set -g @plugin 'tmux-plugins/tpm' # Plugin manager for tmux
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'christoomey/vim-tmux-navigator'
set -g @plugin 'catppuccin/tmux' # Custom colors 
set -g @plugin 'tmux-plugins/tmux-cpu'
set -g @plugin 'tmux-plugins/tmux-battery'
set -g @plugin 'tmux-plugins/tmux-resurrect' # Restore tmux environment after system restart
set -g @plugin 'tmux-plugins/tmux-continuum' # Automates tmux-resurrect to save every 1m

# Configure tmux
set -g mouse on
set -g default-terminal "tmux-256color"
set -g base-index 1 # Start windows at 1 instead of 0
set -g renumber-windows on # Renumber windows after closing a window

# Configure catppuccin plugin
set -g @catppuccin_flavor "mocha"
set -g @catppuccin_window_status_style "rounded"
set -g @catppuccin_status_background "#242638"
set -g @catppuccin_window_current_text " #{b:pane_current_path}"
set -g @catppuccin_window_text " #{b:pane_current_path}"
## Load catppuccin
run "~/.config/tmux/plugins/tmux/catppuccin.tmux"
## Make the status line pretty and add some modules
set-window-option -g status-position top
set -g status-right-length 100
set -g status-left-length 100
set -g status-left "#{E:@catppuccin_status_session}"
set -g status-right "#{E:@catppuccin_status_application}"
set -agF status-right "#{E:@catppuccin_status_cpu}"
set -agF status-right "#{E:@catppuccin_status_battery}"

# Configure continuum
set -g @continuum-restore 'on' # Auto-restore on first tmux startup
set -g @continuum-boot 'on'
set -g @continuum-boot-options 'iterm,fullscreen'
set -g @continuum-save-interval '1'
set -g @resurrect-strategy-vim 'session'
set -g @resurrect-capture-pane-contents 'on'

run "~/.tmux/plugins/tpm/tpm"
EOF
else
echo "You already have a tmux config file"
exit 1
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

if ! [ -d ~/.config/nvim ]; then
mkdir -p ~/.config/nvim
fi

timeStamp=$(date +"%Y%m%d-%H%M%S")
tmpDir=~/tmp-$timeStamp
git clone https://github.com/NvChad/starter $tmpDir
rm -fr $tmpDir/.git
shopt -s dotglob
mv $tmpDir/* ~/.config/nvim/
shopt -u dotglob
rm -fr $tmpDir

cat <<EOF > ~/.config/nvim/lua/plugins/vim-tmux-navigator.lua
return {
	{
		"christoomey/vim-tmux-navigator",
		event = "VeryLazy",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		},
	},
}
EOF

if ! [ -f ~/.bash_aliases ]; then
cat <<EOF > ~/.bash_aliases
alias pbcopy="xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"
EOF
else
echo "I don't want to destroy your .bash_aliases file, sorry"
exit 1
fi

source ~/.tmux/plugins/tpm/bin/install_plugins
tmux
