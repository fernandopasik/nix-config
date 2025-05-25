{
  config,
  isDarwin,
  lib,
  pkgs,
  ...
}:
lib.mkMerge [
  {
    environment.systemPackages = with pkgs; [
      jdk17
      jdk21
      jdk24
    ];

    programs.java.enable = true;

    programs.zsh.promptInit = ''
      export JAVA_HOME="${pkgs.jdk24}/lib/openjdk"
    '';
  }
  (lib.optionalAttrs isDarwin {
    homebrew = {
      brews = [ "jenv" ];
    };

    programs.zsh.promptInit = ''
      export PATH="$HOME/.jenv/bin:$PATH"
      eval "$(jenv init -)"
    '';
  })
]
