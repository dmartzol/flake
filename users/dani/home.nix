{ config, lib, pkgs, ... }: {
  xdg.enable = true;
  home.packages = [
    pkgs.bat
  ];
  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    EDITOR = "nvim";
    PAGER = "less -FirSwX";
    MANPAGER = "sh -c 'col -bx | ${pkgs.bat}/bin/bat -l man -p'";
  };
  #xdg.configFile."i3/config".text = builtins.readFile ./i3;

programs.git = {
    enable = true;
    userName = "Daniel Martinez Olivas";
    userEmail = "danielmartinezolivas@gmail.com";
    aliases = {
        prettylog = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(r) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
        root = "rev-parse --show-toplevel";
    };
    extraConfig = {
        color.ui = true;
        github.user = "dmartzol";
    };
};

  # Make cursor not tiny on HiDPI screens
  xsession.pointerCursor = {
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
    size = 128;
  };

}
