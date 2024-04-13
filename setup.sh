#!/bin/bash

#Post-Installation Process for Hyprland
#
echo "Post-Installation Process for Hyprland"

echo -n "continue? <y/n>: "
read installSetup

if [ $installSetup == "y" ]; then
  echo "proceeding..."
  sleep 3

elif [ $installSetup == "n" ]; then
  echo "aborting..."
  sleep 3
  exit 1

else
  echo "bad writing, aborting..."
  slep 3
  exit 2
fi 

#Upgrading the system

echo "Updating now..."
sudo pacman -Syyu


#Getting yay

echo "Installing yay..."
sleep 3
git clone https://aur.archlinux.org/yay.git
cd ./yay
makepkg -si


#Installing Hyprland + some packages
#
echo "Hyprland will now be installed, check README for details..."
sleep 3

yay -S hyprland wofi waybar wayland mesa lib32-mesa xdg-desktop-portal-hyprland xdg-utils xdg-user-dirs xdg-desktop-portal polkit-gnome wlroots vulkan-headers vulkan-radeon qt6-wayland qt5-wayland pavucontrol network-manager-applet neovim neofetch nautilus man-db linux-zen-headers alacritty dosfstools hyprpaper hyprlock gtk3 gtk4 fuse dunst btop pipewire-pulse pipewire-alsa pipewire alsa-firmware

sudo systemctl enable sddm

#Hyprland dotfiles 

cp -rf ./hypr/ ~/.config/
cp -rf ./waybar/ ~/.config/
cp -rf ./alacritty/ ~/.config/
cp -rf ./sddm/sddm.conf /etc/
cp -rf ./sddm/themes/ /usr/share/sddm/
cp -rf ./wofi/ ~/.config/
cp -rf ./wlogout/ ~/.config/wlogout/

echo "reboot"
