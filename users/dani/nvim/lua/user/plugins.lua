  -- This file can be loaded by calling `lua require('plugins')` from your init.vim
--_ = vim.cmd [[packadd packer.nvim]]

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use 'nvim-lua/popup.nvim'
    use 'mhinz/vim-startify' -- welcome screen
    use 'AndrewRadev/splitjoin.vim' -- Switch between single-line and multiline forms of code

    -- plugin to show function signature as I type
    use 'ray-x/lsp_signature.nvim'

    -- plugin to reload lua config
    use 'famiu/nvim-reload'

    -- plugin to display hidden characters easily
    use 'tjdevries/cyclist.vim'

    -- telescope requirements...
    use 'nvim-lua/plenary.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'nvim-telescope/telescope-file-browser.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- color themes
    use 'rakr/vim-one'
    use({"catppuccin/nvim", as = "catppuccin"})
    use 'navarasu/onedark.nvim'

    -- Status bar
    use 'nvim-lualine/lualine.nvim'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    -- keymap menu
    use { 'folke/which-key.nvim' }

    -- Navigation
    --use 'ggandor/lightspeed.nvim'     -- lightspeed to move faster
    --use 'unblevable/quick-scope'      -- jump to any word in the current line
    use {
        'phaazon/hop.nvim',
        branch = 'v1', -- optional but strongly recommended
    }

    -- Appeareance
    -- indentation lines
    use "lukas-reineke/indent-blankline.nvim"
    -- go language support
    use {'fatih/vim-go',  run = ':GoInstallBinaries' }
    -- native LSP server
    use 'neovim/nvim-lspconfig' 

    -- file navigator
    --" commenting code
    use 'preservim/nerdcommenter' 
    -- automatic closing of quotes, parenthesis, etc
    use 'Raimondi/delimitMate' 
    -- git plugin
    use 'tpope/vim-fugitive'
    -- shows current git branch
    use 'itchyny/vim-gitbranch' 
    -- github copilot
    use 'github/copilot.vim' 

    -- LSP autocompletion...
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use "onsails/lspkind-nvim"
    -- For ultisnips users.
    use "L3MON4D3/LuaSnip" --snippet engine
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    --use 'SirVer/ultisnips'
    -- LSP autocompletion...

    -- shows a git diff in the sign column
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
    }

    -- Sql
    use "tpope/vim-dadbod"
    use { "kristijanhusak/vim-dadbod-completion" }
    use { "kristijanhusak/vim-dadbod-ui" }

    -- Pretty colors
    use "norcalli/nvim-colorizer.lua"

    -- buffers instead of tabs
    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require("bufferline").setup()
        end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
