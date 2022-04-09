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

# config files
    xdg.enable = true;
    home.file.".inputrc".source = ./inputrc;
    xdg.configFile."i3/config".text = builtins.readFile ./i3;
    xdg.configFile."nvim/init.lua".source = ./nvim/init.lua;
    xdg.configFile."nvim/lua/user/plugins.lua".source = ./nvim/lua/user/plugins.lua;
    xdg.configFile."nvim/lua/user/options.lua".source = ./nvim/lua/user/options.lua;
    xdg.configFile."nvim/lua/user/color.lua".source = ./nvim/lua/user/color.lua;
    xdg.configFile."nvim/lua/user/completion.lua".source = ./nvim/lua/user/completion.lua;
    xdg.configFile."nvim/lua/user/hop.lua".source = ./nvim/lua/user/hop.lua;
    xdg.configFile."nvim/lua/user/keymaps.lua".source = ./nvim/lua/user/keymaps.lua;
    xdg.configFile."nvim/lua/user/lualine.lua".source = ./nvim/lua/user/lualine.lua;
    xdg.configFile."nvim/lua/user/telescope.lua".source = ./nvim/lua/user/telescope.lua;
    xdg.configFile."nvim/lua/user/luasnip.lua".source = ./nvim/lua/user/luasnip.lua;
    xdg.configFile."nvim/lua/user/gitsigns.lua".source = ./nvim/lua/user/gitsigns.lua;
    xdg.configFile."nvim/lua/user/which-key.lua".source = ./nvim/lua/user/which-key.lua;
    xdg.configFile."nvim/lua/user/cyclist.lua".source = ./nvim/lua/user/cyclist.lua;
    xdg.configFile."nvim/lua/user/lsp/init.lua".source = ./nvim/lua/user/lsp/init.lua;
    xdg.configFile."nvim/lua/user/lsp/lsp.lua".source = ./nvim/lua/user/lsp/lsp.lua;

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

    programs.kitty = {
        enable = true;
        extraConfig = builtins.readFile ./kitty;
    };

    programs.fish = {
        enable = true;
        interactiveShellInit = lib.strings.concatStrings (lib.strings.intersperse "\n" [
            #"source ${sources.theme-bobthefish}/fish_prompt.fish"
            #"source ${sources.theme-bobthefish}/fish_right_prompt.fish"
            #"source ${sources.theme-bobthefish}/fish_title.fish"
            (builtins.readFile ./config.fish)
            "set -g SHELL ${pkgs.fish}/bin/fish"
        ]);

        shellAliases = {
            pbcopy = "xclip";
            pbpaste = "xclip -o";
        };

        plugins = [
            {
                name = "z";
                src = pkgs.fetchFromGitHub {
                    owner = "jethrokuan";
                    repo = "z";
                    rev = "ddeb28a7b6a1f0ec6dae40c636e5ca4908ad160a";
                    sha256 = "0c5i7sdrsp0q3vbziqzdyqn4fmp235ax4mn4zslrswvn8g3fvdyh";
                };
            }
            {
                name = "fish-fzf";
                src = pkgs.fetchFromGitHub {
                    owner = "jethrokuan";
                    repo = "fzf";
                    rev = "24f4739fc1dffafcc0da3ccfbbd14d9c7d31827a";
                    sha256 = "0kz057nr07ybh0y06ww3p424rgk8pi84pnch9jzb040qqn9a8823";
                };
            }
        ];
    };

  # Make cursor not tiny on HiDPI screens
  xsession.pointerCursor = {
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
    size = 128;
  };

}
