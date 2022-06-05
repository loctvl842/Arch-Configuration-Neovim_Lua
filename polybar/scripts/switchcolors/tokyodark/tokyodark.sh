#!/bin/bash

ColorDIR="$HOME/.config/polybar/colours/colourful.ini"
ALDIR="$HOME/.config/alacritty/alacritty.yml"
NvimDIR="$HOME/.config/nvim/lua/caparies/colorscheme.lua"
I3DIR="$HOME/.config/i3/config"
ThemeDIR="$HOME/.config/polybar/themes"
Powermenu_Rofi_DIR="$HOME/.config/rofi/powermenu/"
ColorlsDIR="$HOME/.config/colorls/dark_colors.yaml"
Icon_Theme_DIR="$HOME/.config/Arch Config/My Custom Arch"
Dunst_DIR="$HOME/.config/dunst"
Zsh_DIR="$HOME/.config/zsh"

if  [[ $1 = "tokyodark" ]]; then

  # Changing colors of polybar
  sed -i -e 's/background = .*/background = #2d568710/g' $ColorDIR
  sed -i -e 's/setting = .*/setting = #fa1414/g' $ColorDIR
  sed -i -e 's/wlan-ramp-signal = .*/wlan-ramp-signal = #9404d6/g' $ColorDIR
  sed -i -e 's/powermenu = .*/powermenu = #fa8541/g' $ColorDIR
  sed -i -e 's/xwindow = .*/xwindow = #a37233/g' $ColorDIR
  sed -i -e 's/change_theme = .*/change_theme = #faa434/g' $ColorDIR
  sed -i 's/date = .*/date = #fffc05/g' $ColorDIR
  sed -i -e 's/cpu = .*/cpu = #2263bf/g' $ColorDIR
  sed -i 's/border = .*/border = #61AFEF/g' $ColorDIR
  sed -i -e 's/i3-seperator = .*/i3-seperator = #cc9a74/g' $ColorDIR
  sed -i -e 's/i3-unfocus = .*/i3-unfocus = #d12662/g' $ColorDIR
  sed -i "s/colors: .*/colors: *tokyo-night-storm/g" $ALDIR
  sed -i '0,/colorscheme .*/s//colorscheme tokyodark/' $NvimDIR
  sed -i '0,/set $ac .*/s//set $ac #fa8541/' $I3DIR
  sed -i '0,/background: .*/s//background: #14141410;/' $ThemeDIR/tokyo_night_powermenu.rasi
  sed -i '0,/background: .*/s//background: #14141410;/' $ThemeDIR/tokyo_night_setting.rasi
  sed -i '0,/background: .*/s//background: #14141410;/' $ThemeDIR/tokyo_night_switch_theme.rasi
  sed -i '0,/foreground: .*/s//foreground: #7da6ff;/' $ThemeDIR/tokyo_night_switch_theme.rasi
  sed -i '0,/foreground: .*/s//foreground: #7da6ff;/' $ThemeDIR/tokyo_night_setting.rasi
  sed -i '0,/foreground: .*/s//foreground: #7da6ff;/' $ThemeDIR/tokyo_night_powermenu.rasi
  # Border color
  sed -i '0,/bright-blue: .*/s//bright-blue: #ff9e64f0;/' $ThemeDIR/tokyo_night_powermenu.rasi
  sed -i '0,/bright-blue: .*/s//bright-blue: #ff9e64f0;/' $ThemeDIR/tokyo_night_setting.rasi
  sed -i '0,/bright-blue: .*/s//bright-blue: #ff9e64f0;/' $ThemeDIR/tokyo_night_switch_theme.rasi

  # Changing colors of zsh and clorls
  sed -i -e 's/unrecognized_file: .*/unrecognized_file: red/g' $ColorlsDIR
  sed -i -e 's/dir: .*/dir:  "#ff8a0d"/g' $ColorlsDIR
  sed -i 's/\<recognized_file\>: .*/recognized_file:  "#cf42ab"/g' $ColorlsDIR

  # Changing colors of dunst
  sed -i '57,60 s/background = .*/background = "#14141410"/1' $Dunst_DIR/dunstrc
  sed -i '57,60 s/foreground = .*/foreground = "#356eb0"/1' $Dunst_DIR/dunstrc
  sed -i '62,65 s/background = .*/background = "#14141410"/1' $Dunst_DIR/dunstrc
  sed -i '62,65 s/foreground = .*/foreground = "#356eb0"/1' $Dunst_DIR/dunstrc
  sed -i '0,/frame_color = .*/s//frame_color = "#FFB74D"/' $Dunst_DIR/dunstrc

  # Changing Wallpapers
  sed -i -e 's/Anime/Spaces/g' $I3DIR
  feh --bg-scale --randomize $Arch_Config_DIR/Spaces/*

  # Changing colors of powermenu of rofi
  sed -i '0,/background: .*/s//background: #14141410;/' $Powermenu_Rofi_DIR/styles/colors.rasi
  sed -i '0,/background-inputbar: .*/s//background-inputbar: #14141410;/' $Powermenu_Rofi_DIR/styles/colors.rasi
  sed -i '0,/foreground: .*/s//foreground: #7da6ff;/' $Powermenu_Rofi_DIR/styles/colors.rasi
  sed -i '0,/border: .*/s//border: #ff9e64;/' $Powermenu_Rofi_DIR/styles/colors.rasi

  # Changing colors of powermenu of zsh-prompt
  sed -i '34,36 s/yellow/blue/g' $Zsh_DIR/zsh-prompt
  sed -i '34,36 s/magenta/red/1' $Zsh_DIR/zsh-prompt

  # handle command
  notify-send "Change Theme" "Tokyo Dark" --icon="$Icon_Theme_DIR/Tokyo-dark.png" -t 1500 -a "System"
  sleep 1
  i3-msg reload
  flameshot config -m "#fa8541"
  feh --bg-scale --randomize ~/.config/Arch\ Config/Spaces/*
  pkill dunst
  dunst &
  $HOME/.config/polybar/launch.sh
fi