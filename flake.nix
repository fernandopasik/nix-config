{
  description = "Fernando's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      home-manager,
      nix-darwin,
      nixos-wsl,
      nixpkgs,
    }:
    {
      nixosConfigurations.uac = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          isDarwin = false;
          isLinux = true;
          wslModule = nixos-wsl.nixosModules.wsl;
          homeManagerModule = home-manager.nixosModules.home-manager;
        };

        modules = [ ./machines/uac ];
      };

      darwinConfigurations.Deimos = nix-darwin.lib.darwinSystem {
        system = "x86_64-darwin";

        specialArgs = {
          isDarwin = true;
          isLinux = false;
          homeManagerModule = home-manager.darwinModules.home-manager;
        };

        modules = [ ./machines/deimos ];
      };

      darwinConfigurations.Work = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";

        specialArgs = {
          isDarwin = true;
          isLinux = false;
          homeManagerModule = home-manager.darwinModules.home-manager;
        };

        modules = [ ./machines/work ];
      };
    };
}
