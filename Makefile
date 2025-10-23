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

rebuild:
ifeq ($(shell uname),Darwin)
	sudo darwin-rebuild switch --refresh --flake .#$(shell hostname)
else
	sudo nixos-rebuild switch --refresh --flake .#$(shell hostname)
endif

update:
	nix flake update

gc:
	sudo nix-collect-garbage -d
	nix-collect-garbage -d
	sudo nix-store --gc
