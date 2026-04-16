{
  config,
  isDarwin,
  isLinux,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    zsh
    zsh-autosuggestions
    zsh-history-substring-search
    zsh-syntax-highlighting
    starship
  ];

  environment.etc."starship.toml" = lib.mkMerge [
    {
      text = ''
        "$schema" = 'https://starship.rs/config-schema.json'

        add_newline = true

        [character]
        success_symbol = '[➜](bold green)'
      '';
    }
    (lib.optionalAttrs (!isDarwin) { mode = "0644"; })
  ];

  system.activationScripts.extraActivation.text = ''
    if [ -e /etc/starship.toml ]; then
      chmod -h 644 /etc/starship.toml || true
    fi
  '';

  users = lib.optionalAttrs isLinux { defaultUserShell = pkgs.zsh; };

  programs.zsh = lib.mkMerge [
    {
      enable = true;
      enableCompletion = true;
      enableBashCompletion = true;
      enableGlobalCompInit = true;

      interactiveShellInit = ''
        unsetopt EXTENDED_HISTORY
        setopt HIST_IGNORE_ALL_DUPS
        setopt HIST_REDUCE_BLANKS
        setopt HIST_SAVE_NO_DUPS

        source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh

        bindkey '^[OA' history-substring-search-up
        bindkey '^[[A' history-substring-search-up
        bindkey '^[OB' history-substring-search-down
        bindkey '^[[B' history-substring-search-down
      '';

      promptInit = ''
        export STARSHIP_CONFIG=/etc/starship.toml
        eval "$(starship init zsh)"
      '';
    }
    (lib.optionalAttrs isLinux {
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    })
    (lib.optionalAttrs isDarwin {
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
    })
  ];
}
