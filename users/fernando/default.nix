{
  pkgs,
  isDarwin,
  isLinux,
  lib,
  config,
  ...
}:
let
  gitconfigLocalContent = ''
    [user]
      name = Fernando Pasik
      email = fernando@pasik.com.ar
  '';
in
{
  environment.systemPackages = with pkgs; [ git ];

  home-manager.users.fernando =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    {
      home = {
        stateVersion = "25.05";
        username = "fernando";
        homeDirectory = if isDarwin then "/Users/fernando" else "/home/fernando";

        packages = with pkgs; [ git ];

        file = {
          "repos/.keep".text = "";
          ".zshrc".text = ''
            . ~/repos/dotfiles/utils.sh
          '';
        };

        activation = lib.mkMerge [
          {
            cloneDotfiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
              export PATH=${pkgs.git}/bin:$PATH
              DOTFILES_DIR="$HOME/repos/dotfiles"
              if [ ! -d "$DOTFILES_DIR" ]; then
                echo "🧰 Cloning dotfiles into $DOTFILES_DIR"
                git clone https://github.com/fernandopasik/dotfiles.git "$DOTFILES_DIR"
              else
                echo "🧰 Updating dotfiles in $DOTFILES_DIR"
                git -C "$DOTFILES_DIR" pull --rebase
              fi
              if [ ! -f "$HOME/.gitconfig.local" ]; then
                echo "🔀 Creating .gitconfig.local"
                echo -e "${gitconfigLocalContent}" > "$HOME/.gitconfig.local"
              fi
              cd $DOTFILES_DIR && ${pkgs.stow}/bin/stow .
            '';
          }
          (lib.optionalAttrs isDarwin {
            unhideLibrary = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
              /usr/bin/chflags nohidden ~/Library
            '';
          })
        ];
      };
    };

  security.sudo = lib.mkMerge [
    (lib.optionalAttrs isDarwin {
      extraConfig = ''
        Defaults:fernando !requiretty
        fernando ALL=(ALL) NOPASSWD:SETENV: ALL
      '';
    })
    (lib.optionalAttrs isLinux {
      enable = true;
      extraRules = [
        {
          users = [ "fernando" ];
          commands = [
            {
              command = "ALL";
              options = [
                "NOPASSWD"
                "SETENV"
              ];
            }
          ];
        }
      ];
    })
  ];

  system = lib.optionalAttrs isDarwin {
    defaults.dock.persistent-others = [ "/Users/fernando/Downloads" ];
  };

  users.users.fernando = lib.mkMerge [
    { home = if isDarwin then "/Users/fernando" else "/home/fernando"; }
    (lib.optionalAttrs isLinux {
      isNormalUser = true;
      extraGroups = [
        "docker"
        "networkmanager"
        "wheel"
      ];
    })
    (lib.optionalAttrs isDarwin { shell = pkgs.zsh; })
  ];
}
