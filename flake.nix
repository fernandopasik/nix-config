{
  description = "Fernando's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nix-darwin = {
      url = "github:lnl7/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    android-nixpkgs = {
      url = "github:tadfisher/android-nixpkgs";
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
      android-nixpkgs,
    }:

    {
      nixosConfigurations.uac = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          isDarwin = false;
          isLinux = true;
          isWSL = true;
          wslModule = nixos-wsl.nixosModules.wsl;
          homeManagerModule = home-manager.nixosModules.home-manager;
          androidModule = android-nixpkgs;
        };

        modules = [
          { nixpkgs.config.allowUnfree = true; }
          ./machines/uac
        ];
      };

      nixosConfigurations.trantor = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";

        specialArgs = {
          isDarwin = false;
          isLinux = true;
          isWSL = false;
          homeManagerModule = home-manager.nixosModules.home-manager;
        };

        modules = [
          { nixpkgs.config.allowUnfree = true; }
          ./machines/trantor
        ];
      };

      darwinConfigurations.Deimos = nix-darwin.lib.darwinSystem {
        system = "x86_64-darwin";

        specialArgs = {
          isDarwin = true;
          isLinux = false;
          isWSL = false;
          homeManagerModule = home-manager.darwinModules.home-manager;
          androidModule = android-nixpkgs;
        };

        modules = [
          { nixpkgs.config.allowUnfree = true; }
          ./machines/deimos
        ];
      };

      darwinConfigurations.Work = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";

        specialArgs = {
          isDarwin = true;
          isLinux = false;
          isWSL = false;
          homeManagerModule = home-manager.darwinModules.home-manager;
          androidModule = android-nixpkgs;
        };

        modules = [
          { nixpkgs.config.allowUnfree = true; }
          ./machines/work
        ];
      };
    };
}
