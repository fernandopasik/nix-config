# Nix Configuration

Nix configuration to setup your Mac or Linux computer for everyday tasks and software development
workflow.

<!-- BADGES - START -->

[![Build Status](https://github.com/fernandopasik/pc-playbook/actions/workflows/main.yml/badge.svg)](https://github.com/fernandopasik/pc-playbook/actions/workflows/main.yml "Build Status")
[![Known Vulnerabilities](https://snyk.io/test/github/fernandopasik/pc-playbook/badge.svg?targetFile=package.json)](https://snyk.io/test/github/fernandopasik/pc-playbook?targetFile=package.json "Known Vulnerabilities")

<!-- BADGES - END -->

## Install Nix

### MacOS

1. Install Nix

   ```sh
   sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)
   ```

2. Install Nix Darwin

   ```sh
   sudo mkdir -p /etc/nix-darwin
   sudo chown $(id -nu):$(id -ng) /etc/nix-darwin
   cd /etc/nix-darwin
   nix --extra-experimental-features 'nix-command flakes' flake init -t nix-darwin/master
   sudo scutil --set HostName "Deimos"
   sudo scutil --set LocalHostName "Deimos"
   sudo scutil --set ComputerName "Deimos"
   sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "Deimos"
   sed -i '' "s/simple/$(scutil --get LocalHostName)/" flake.nix
   sudo nix --extra-experimental-features 'nix-command flakes' run nix-darwin/master#darwin-rebuild -- switch
   ```

3. Install HomeBrew

   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

4. Run flake

   ```sh
   sudo darwin-rebuild switch --refresh --flake github:fernandopasik/nix-config#Deimos
   ```

### Windows WSL

1. Install WSL

   ```bat
   wsl --install --no-distribution
   ```

2. Download latest NixOS WSL [release](https://github.com/nix-community/NixOS-WSL/releases/latest)

3. Install NixOS WSL

   ```bat
   wsl --import NixOS D:\WSL\NixOS D:\Downloads\nixoswsl --version 2
   ```

4. Start NixOS WSL

   ```bat
   wsl -d NixOS
   ```

5. Change hostname

   ```sh
   sudo hostnamectl set-hostname uac
   ```

6. Run flake

   ```sh
   sudo nixos-rebuild switch --refresh --flake github:fernandopasik/nix-config#uac
   ```

## License

MIT (c) 2023 [Fernando Pasik](https://fernandopasik.com)
