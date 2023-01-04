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

  use "tpope/vim-fugitive"
  -- use 'mhinz/vim-startify'
  -- use {
  --     'goolord/alpha-nvim',
  --     requires = { 'nvim-tree/nvim-web-devicons' },
  -- }

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  use 'editorconfig/editorconfig-vim'
  use 'christoomey/vim-tmux-navigator'
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-context'

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
  use 'nvim-lua/lsp-status.nvim'
  use 'onsails/lspkind.nvim'

  use 'onsails/diaglist.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'lukas-reineke/indent-blankline.nvim'

  -- Debugging
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'

  use 'simrat39/symbols-outline.nvim'
  use 'simrat39/rust-tools.nvim'

  -----------------------------------------------------------------------
  -- colorscheme
  -----------------------------------------------------------------------
  use 'folke/tokyonight.nvim'
  use 'dracula/vim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use "EdenEast/nightfox.nvim"
  use "projekt0n/github-nvim-theme"
  use { 'lifepillar/vim-solarized8', as = "solarized8" }

  -----------------------------------------------------------------------
  -- Workflow improvements
  -----------------------------------------------------------------------
  use 'ThePrimeagen/harpoon'
  use 'ThePrimeagen/git-worktree.nvim'

  use 'iamcco/markdown-preview.nvim'

  -----------------------------------------------------------------------
  -- Telescope
  -----------------------------------------------------------------------
  use {'nvim-telescope/telescope.nvim', tag = '0.1.0' }
  use "nvim-telescope/telescope-file-browser.nvim"
  use {
      "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig"
  }

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
  -- Buffer line
  -----------------------------------------------------------------------
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

end)
