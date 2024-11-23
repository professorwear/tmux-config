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
[On WSL, we need to have a nerd font chosen as well for the terminal.](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/0xProto.zip) <br>
Use: 0xProtoNerdFontMono-Regular.ttf
#### Configuration
Grab 'applyConfig.sh' and run.
```bash
chmod +x applyConfig.sh && ./applyConfig.sh
```
#### Running nvim
Run `:MasonInstallAll` command after lazy.nvim finishes downloading plugins on first run.
## Additonal resources
 - [Fireship's Tmux in 100 Seconds](https://www.youtube.com/watch?v=vtB1J_zCv8I)
 - [Dreams of Code Tmux has forever changed the way I write code.](https://www.youtube.com/watch?v=DzNmUNvnB04)
 - [Dreams of Code .dotfiles repo](https://github.com/dreamsofcode-io/dotfiles/tree/main)
 - [NvChad for Neovim](https://nvchad.com)
 - [TMUX cheatsheet](https://tmuxcheatsheet.com)
