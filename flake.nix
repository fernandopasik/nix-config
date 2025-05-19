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
          wslModule = nixos-wsl.nixosModules.wsl;
          homeManagerModule = home-manager.nixosModules.home-manager;
        };

        modules = [
          ./machines/uac
          ./users/fernando
          ./users/fernando/linux.nix
        ];
      };

      darwinConfigurations.Deimos = nix-darwin.lib.darwinSystem {
        system = "x86_64-darwin";

        specialArgs = {
          homeManagerModule = home-manager.darwinModules.home-manager;
        };

        modules = [
          ./machines/deimos
          ./users/fernando
          ./users/fernando/darwin.nix
        ];
      };
    };
}
