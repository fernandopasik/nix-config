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
    zsh-git-prompt
    zsh-history-substring-search
    zsh-syntax-highlighting
    starship
  ];

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
