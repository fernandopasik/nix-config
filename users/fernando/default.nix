{
  pkgs,
  lib,
  config,
  ...
}:
let
  inherit (pkgs.stdenv) isDarwin isLinux;

  username = "fernando";
  homeDir = if isDarwin then "/Users/${username}" else "/home/${username}";
in
{
  users.users.${username} = lib.mkMerge [
    {
      shell = pkgs.zsh;
      home = homeDir;
    }
    (lib.mkIf isLinux {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "docker"
      ];
    })
  ];

  security.sudo =
    if isDarwin then
      {
        extraConfig = ''
          Defaults:fernando !requiretty
          fernando ALL=(ALL) NOPASSWD:SETENV: ALL
        '';
      }
    else
      {
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
      };

  environment.systemPackages = with pkgs; [ git ];

  home-manager.users.${username} =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    {
      home = {
        homeDirectory = homeDir;
        stateVersion = "25.05";
        inherit username;

        packages = with pkgs; [ git ];

        file = {
          "repos/.keep".text = "";
          ".zshrc".text = ''
            . ~/repos/dotfiles/utils.sh

            export STARSHIP_CONFIG=~/.config/starship.toml
            eval "$(starship init zsh)"
          '';
          ".gitconfig.local".text = ''
            [user]
              name = Fernando Pasik
              email = fernando@pasik.com.ar
            [credential "https://github.com"]
              helper =
              helper = !/run/current-system/sw/bin/gh auth git-credential
            [credential "https://gist.github.com"]
              helper =
              helper = !/run/current-system/sw/bin/gh auth git-credential
          '';
        };

        activation.cloneDotfiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          export PATH=${pkgs.git}/bin:$PATH
          DOTFILES_DIR="$HOME/repos/dotfiles"
          if [ ! -d "$DOTFILES_DIR" ]; then
            echo "🧰 Cloning dotfiles into $DOTFILES_DIR"
            git clone https://github.com/fernandopasik/dotfiles.git "$DOTFILES_DIR"
          else
            echo "🧰 Updating dotfiles in $DOTFILES_DIR"
            git -C "$DOTFILES_DIR" pull --rebase
          fi

          ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
          ln -sf "$DOTFILES_DIR/.npmrc" "$HOME/.npmrc"
          mkdir -p "$HOME/.config"
          ln -sf "$DOTFILES_DIR/.starship.toml" "$HOME/.config/starship.toml"
          mkdir -p "$HOME/.config/gh"
          ln -sf "$DOTFILES_DIR/.ghconfig.yml" "$HOME/.config/gh/config.yml"
        '';
      };
    };

  system =
    { }
    // lib.optionalAttrs isDarwin {
      defaults.dock.persistent-apps = [
        "/Applications/Signal.app"
        "/System/Applications/Home.app"
        "/System/Applications/Notes.app"
        "/Applications/Visual Studio Code.app"
      ];

      defaults.dock.persistent-others = [ "/Users/${username}/Downloads" ];
    };
}
