-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -----------------------------------------------------------------------
  -- Packer can manage itself
  -----------------------------------------------------------------------
  use 'wbthomason/packer.nvim'
  use 'arzg/vim-colors-xcode'

  -----------------------------------------------------------------------
  -- golang
  -----------------------------------------------------------------------
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'
  use 'ray-x/lsp_signature.nvim'

  use 'lewis6991/gitsigns.nvim'
  use 'nvim-lua/plenary.nvim'
  use {'L3MON4D3/LuaSnip', tag = 'v<CurrentMajor>.*'}
  use 'rafamadriz/friendly-snippets'
  use 'folke/todo-comments.nvim'
  use "folke/zen-mode.nvim"
  use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = false,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  })

  use "tpope/vim-fugitive"
  -- use 'mhinz/vim-startify'
  use {
      'goolord/alpha-nvim',
      requires = { 'nvim-tree/nvim-web-devicons' },
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  use 'editorconfig/editorconfig-vim'
  use 'mrjones2014/smart-splits.nvim'
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'nvim-treesitter/playground'

  use 'neovim/nvim-lspconfig'
  use 'saadparwaiz1/cmp_luasnip'

  -----------------------------------------------------------------------
  -- LSP
  -----------------------------------------------------------------------
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'windwp/nvim-autopairs'
  use 'lukas-reineke/cmp-rg'
  -- Causes rust-analyzer to slow down.
  -- use 'nvim-lua/lsp-status.nvim'
  use 'onsails/lspkind.nvim'

  use 'onsails/diaglist.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'lukas-reineke/indent-blankline.nvim'

  -- Debugging
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'leoluz/nvim-dap-go'
  -- use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'

  use 'simrat39/symbols-outline.nvim'
  use 'simrat39/rust-tools.nvim'

  use 'google/vim-jsonnet'

  -----------------------------------------------------------------------
  -- colorscheme
  -----------------------------------------------------------------------
  use 'folke/tokyonight.nvim'
  use 'dracula/vim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use "EdenEast/nightfox.nvim"
  use "projekt0n/github-nvim-theme"
  use { 'lifepillar/vim-solarized8', as = "solarized8" }
  use { 'sainnhe/sonokai' }
  use { 'tjdevries/colorbuddy.nvim' }
  use { 'ishan9299/nvim-solarized-lua' }

  use {'nyoom-engineering/oxocarbon.nvim'}

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  -----------------------------------------------------------------------
  -- Workflow improvements
  -----------------------------------------------------------------------
  use 'ThePrimeagen/harpoon'
  use 'ThePrimeagen/git-worktree.nvim'


  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  -----------------------------------------------------------------------
  -- Telescope
  -----------------------------------------------------------------------
  use {'nvim-telescope/telescope.nvim', tag = '0.1.0' }
  use { "nvim-telescope/telescope.nvim" }

  use {
      "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig"
  }

  use {
      "nvim-telescope/telescope-file-browser.nvim",
      requires = {
          "nvim-telescope/telescope.nvim",
          "nvim-lua/plenary.nvim",
          "SmiteshP/nvim-navic",
      }
  }

  use 'mbbill/undotree'
  use 'dhruvasagar/vim-zoom'

  -----------------------------------------------------------------------
  -- Fancy icons
  -----------------------------------------------------------------------
  use {
    "nvim-tree/nvim-web-devicons",
    module = "nvim-web-devicons",
    config = function()
    require("nvim-web-devicons").setup { default = true }
    end,
  }

  -----------------------------------------------------------------------
  -- tab line
  -----------------------------------------------------------------------
  use {
      'kdheepak/tabline.nvim',
      requires = {
          { 'hoob3rt/lualine.nvim', opt=true },
          {'kyazdani42/nvim-web-devicons', opt = true}
      }
  }

  -- use 'hiphish/rainbow-delimiters.nvim'


  -----------------------------------------------------------------------
  -- leap / better easy motion
  -----------------------------------------------------------------------
-- use { 'ggandor/leap.nvim' }
  -----------------------------------------------------------------------
  -- Buffer line
  -----------------------------------------------------------------------
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  -----------------------------------------------------------------------
  -- OIL file explorer
  -----------------------------------------------------------------------
  -- use 'stevearc/oil.nvim'

  use 'shaunsingh/nord.nvim'

end)
