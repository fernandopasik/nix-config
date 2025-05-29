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
      export PATH="$HOME/.jenv/shims:$PATH"
      eval "$(jenv init -)"
    '';

    system.activationScripts.postActivation.text = ''
      if [ -x /opt/homebrew/bin/jenv ]; then
        JENV_CMD=/opt/homebrew/bin/jenv
      elif [ -x /usr/local/bin/jenv ]; then
        JENV_CMD=/usr/local/bin/jenv
      else
        echo "jenv not found, skipping JDK registration"
        exit 0
      fi

      mkdir -p "$HOME/.jenv/versions"

      ln -sf ${pkgs.jdk17} "$HOME/.jenv/versions/17"
      ln -sf ${pkgs.jdk21} "$HOME/.jenv/versions/21"
      ln -sf ${pkgs.jdk24} "$HOME/.jenv/versions/24"

      $JENV_CMD rehash
    '';
  })
  (lib.optionalAttrs isLinux {
    programs.java.enable = true;

    programs.zsh.promptInit = ''
      export JAVA_HOME="${pkgs.jdk24}/lib/openjdk"
    '';
  })
]
