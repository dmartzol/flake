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
}
