{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    rbenv
    ruby

    # Required Libs
    autoconf
    bison
    gcc
    libyaml
    openssl
    pkg-config
    readline
    zlib
  ];

  programs.zsh.promptInit = ''
    export PATH="$(gem env gemdir)/bin:${pkgs.rbenv}/bin:$PATH"
    if [[ ! -d "$(rbenv root)/plugins/ruby-build" ]]; then
      git clone --quiet https://github.com/rbenv/ruby-build.git "$(rbenv root)/plugins/ruby-build"
    fi
    export RUBY_CONFIGURE_OPTS="--with-libyaml-dir=${pkgs.libyaml.dev} --with-openssl-dir=${pkgs.openssl.out}"
    export CPPFLAGS="-I${pkgs.openssl.dev}/include"
    export LDFLAGS="-I${pkgs.openssl.out}/lib"
    eval "$(rbenv init -)"
  '';
}
