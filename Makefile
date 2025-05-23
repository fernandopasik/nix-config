verify: format lint check hooks

venv:
	@python -m venv .venv
	@echo 'run `. .venv/bin/activate` to develop'

install:
	pip install -r requirements-dev.txt
	pre-commit install

check:
	nix flake check

format:
	pre-commit run --all-files yamlfmt
	mdformat .
	nix shell nixpkgs#nixfmt-rfc-style -c sh -c 'find . -name "*.nix" -exec nixfmt --strict {} +'

lint:
	yamllint .
	pymarkdown fix .
	nix shell nixpkgs#statix -c statix check

hooks:
	pre-commit run --all-files

rebuild-nixos:
	sudo nixos-rebuild switch --refresh --flake .#uac

rebuild-darwin:
	sudo darwin-rebuild switch --refresh --flake .#Deimos

flake-update:
	nix flake update

nix-gc:
	sudo nix-collect-garbage -d
	nix-collect-garbage -d
	sudo nix-store --gc
