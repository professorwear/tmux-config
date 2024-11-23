# tmux-config
## Description
Stop rebuilding a terminal environment across different hosts.
## Installation and Configuration
### Ubuntu Distributions
### Plugins
 - tmux-plugins/tpm
 - tmux-plugins/tmux-sensible
 - christoomey/vim-tmux-navigator
 - catppuccin/tmux
 - tmux-plugins/tmux-cpu
 - tmux-plugins/tmux-battery
 - tmux-plugins/tmux-resurrect
 - tmux-plugins/tmux-continuum
#### To be explored at a later date
 - tmux-mighty-scroll
 - tmux-powerline
#### Installation
We may need to download and install a custom font to display icons. This seems to happen with `gnome-terminal` and `Windows subsystem for Linux (WSL)` <p>
[Download](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/0xProto.zip) <br>
##### Ubuntu /w gnome-terminal
  1. Unzip and copy to ~/.fonts
  2. `fc-cache -fv` to rebuild the font fc-cache
  3. Restart your session if you still cannot find the 0xProto Nerd Font.
##### Windows 11
Standard windows behavior, unzip the fonts and double click on a font to install.<p>
I recommend `0xProtoNerdFont-Regular.ttf`
#### Configuration
Clone the repository and run the configuration script.
```bash
git clone https://github.com/professorwear/tmux-config.git ~/proj/tmux-config
chmod +x ~/proj/tmux-config/applyConfig.sh && ~/proj/tmux-config/applyConfig.sh
```
#### Running nvim
Run `:MasonInstallAll` command after lazy.nvim finishes downloading plugins on first run.
## Additonal resources
 - [Fireship's Tmux in 100 Seconds](https://www.youtube.com/watch?v=vtB1J_zCv8I)
 - [Dreams of Code Tmux has forever changed the way I write code.](https://www.youtube.com/watch?v=DzNmUNvnB04)
 - [Dreams of Code .dotfiles repo](https://github.com/dreamsofcode-io/dotfiles/tree/main)
 - [NvChad for Neovim](https://nvchad.com)
 - [TMUX cheatsheet](https://tmuxcheatsheet.com)
