#!/bin/sh
# Toggle dark/light modes for alacritty, tmux, neovim

ALACRITTYCONF="$HOME/.config/alacritty/alacritty.toml"
TMUXCONF="$HOME/.config/tmux/tmux.conf"
VIMCONF="$HOME/.config/evim/lua/config_themes.lua"
CURRENT_MODE="dark"

if grep -q "light" "$ALACRITTYCONF"; then
  CURRENT_MODE="light"
else
  CURRENT_MODE="dark"
fi

# Function to switch theme in current vim/neovim instances within Tmux
switch_vim_theme() {
  theme_for_vim_panes="$1"
  tmux list-panes -a -F '#{pane_id} #{pane_current_command}' |
    grep vim | 
    cut -d ' ' -f 1 |
    xargs -I PANE tmux send-keys -t PANE ESCAPE ":set background=${theme_for_vim_panes}" ENTER
}

# Toggle logic based on current mode
if [ "$CURRENT_MODE" = "light" ]; then
  sed -i "" "s/light/dark/" "$ALACRITTYCONF"
  sed -i "" "s/theme light/theme dark/" "$TMUXCONF"
  sed -i "" 's/vim.opt.background = "light"/vim.opt.background = "dark"/' "$VIMCONF"
  switch_vim_theme "dark"
else
  sed -i "" "s/dark/light/" "$ALACRITTYCONF"
  sed -i "" "s/theme dark/theme light/" "$TMUXCONF"
  sed -i "" 's/vim.opt.background = "dark"/vim.opt.background = "light"/' "$VIMCONF"
  switch_vim_theme "light"
fi

tmux source-file "$TMUXCONF"
