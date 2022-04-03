{ config, lib, pkgs, ... }: {
    home.packages = [
        pkgs.bat
        pkgs.exa
        pkgs.fzf
        pkgs.wget
        pkgs.gron
        pkgs.duf
        pkgs.ripgrep
        pkgs.gitleaks
        pkgs.jq
        pkgs.tldr
        pkgs.postgresql
        pkgs.hugo
        pkgs.lazygit
        pkgs.pfetch
    ];

    xdg.enable = true;
    xdg.configFile."i3/config".text = builtins.readFile ./i3;

    home.sessionVariables = {
        LANG = "en_US.UTF-8";
        LC_CTYPE = "en_US.UTF-8";
        LC_ALL = "en_US.UTF-8";
        EDITOR = "nvim";
        PAGER = "less -FirSwX";
        MANPAGER = "sh -c 'col -bx | ${pkgs.bat}/bin/bat -l man -p'";
    };

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

    programs.neovim = {
        enable = true;
        package = pkgs.neovim-nightly;
    };

    programs.fish = {
        enable = true;
        shellAliases = {
            pbcopy = "xclip";
            pbpaste = "xclip -o";
        };
    };


  # Make cursor not tiny on HiDPI screens
  xsession.pointerCursor = {
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
    size = 128;
  };

}
