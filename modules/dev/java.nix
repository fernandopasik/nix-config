{
  config,
  isDarwin,
  isLinux,
  lib,
  pkgs,
  ...
}:
lib.mkMerge [
  {
    environment.systemPackages = with pkgs; [
      jdk24
      jdk21
      jdk17
    ];
  }
  (lib.optionalAttrs isDarwin {
    homebrew = {
      brews = [ "jenv" ];
    };

    programs.zsh.promptInit = ''
      export PATH="$HOME/.jenv/bin:$PATH"
      eval "$(jenv init -)"
    '';

    system.activationScripts.postActivation.text = ''
      /opt/homebrew/bin/jenv add ${pkgs.jdk17}/lib/openjdk
      /opt/homebrew/bin/jenv add ${pkgs.jdk21}/lib/openjdk
      /opt/homebrew/bin/jenv add ${pkgs.jdk24}/lib/openjdk
    '';
  })
  (lib.optionalAttrs isLinux {
    programs.java.enable = true;

    programs.zsh.promptInit = ''
      export JAVA_HOME="${pkgs.jdk24}/lib/openjdk"
    '';
  })
]
