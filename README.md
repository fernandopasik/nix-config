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
nix flake init -t nix-darwin/master
sed -i '' "s/simple/$(scutil --get LocalHostName)/" flake.nix
sudo nix run nix-darwin/master#darwin-rebuild -- switch
```

## License

MIT (c) 2023 [Fernando Pasik](https://fernandopasik.com)
