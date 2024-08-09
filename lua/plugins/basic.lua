return {
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
          -- load the colorscheme here
          vim.cmd([[colorscheme tokyonight]])
        end,
    },
    {
        "ray-x/go.nvim",
        lazy = true,
    },
    {
        "ray-x/guihua.lua",
    },
    {
        "ray-x/lsp_signature.nvim",
    },
    {
        "lewis6991/gitsigns.nvim",
        lazy = true,
    },
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        lazy = true,
    },
    {
        "rafamadriz/friendly-snippets",
    },
    {
        "folke/todo-comments.nvim",
        lazy = true,
    },
    {
        "folke/zen-mode.nvim",
        lazy = true,
    },
    {
        "folke/trouble.nvim",
        lazy = true,
        opts = {},
        cmd = "Trouble",
        keys = {
          {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
          },
          {
            "<leader>xX",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
          },
          {
            "<leader>cs",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
          },
          {
            "<leader>cl",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
          },
          {
            "<leader>xL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
          },
          {
            "<leader>xQ",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
          },
        },
    },
    {
        "tpope/vim-fugitive",
    },
    {
        "goolord/alpha-nvim",
        dependencies = 'nvim-tree/nvim-web-devicons',
    },
    {
        "nvim-tree/nvim-web-devicons",
    },
    {
        "nvim-neotest/nvim-nio",
        lazy = true,
    },
    {
        "vim-test/vim-test",
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = 'nvim-lua/plenary.nvim',
        config = function ()
          local null_ls = require("null-ls")
          local methods = require("null-ls.methods")
          local helpers = require("null-ls.helpers")

          local function ruff_fix()
              return helpers.make_builtin({
                  name = "ruff",
                  meta = {
                      url = "https://github.com/charliermarsh/ruff/",
                      description = "An extremely fast Python linter, written in Rust.",
                  },
                  method = methods.internal.FORMATTING,
                  filetypes = { "python" },
                  generator_opts = {
                      command = "ruff",
                      args = { "--fix", "-e", "-n", "--stdin-filename", "$FILENAME", "-" },
                      to_stdin = true
                  },
                  factory = helpers.formatter_factory
              })
          end

          null_ls.setup({
              sources = {
                  -- ruff_fix(),
                  -- null_ls.builtins.diagnostics.ruff,
                  -- null_ls.builtins.formaters.black,
                  -- require("none-ls.diagnostics.ruff"),
                  -- require("none-ls.diagnostics.mypy"),
                  -- require("none-ls.formatting.black"),
                  null_ls.builtins.diagnostics.ruff,
                  -- require("null_ls.builtins.diagnostics.ruff"),
                  -- require("null_ls.builtins.diagnostics.mypy"),
                  -- require("null_ls.builtins.formatting.black"),
              }
          })

        end
    },
    {
        "astral-sh/ruff-lsp",
    },
    {
        "numToStr/Comment.nvim",
        lazy = true,
    },
    {
        "editorconfig/editorconfig-vim",
    },
    {
        "mrjones2014/smart-splits.nvim",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ':TSUpdate',
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
    },
    {
        "nvim-treesitter/playground",
    },
    -- LSP
    {
        "neovim/nvim-lspconfig",
    },
    {
        "saadparwaiz1/cmp_luasnip",
    },
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "hrsh7th/cmp-buffer",
    },
    {
        "hrsh7th/cmp-path",
    },
    {
        "hrsh7th/cmp-cmdline",
    },
    {
        "hrsh7th/nvim-cmp",
    },
    {
        "windwp/nvim-autopairs",
    },
    {
        "lukas-reineke/cmp-rg",
    },
    {
        "onsails/lspkind.nvim",
    },

    {
        "onsails/diaglist.nvim",
    },
    {
        "nvim-lualine/lualine.nvim",
    },
    {
        "lukas-reineke/indent-blankline.nvim",
    },
    -- Debugging
    {
        "mfussenegger/nvim-dap",
    },
    {
        "rcarriga/nvim-dap-ui",
    },
    {
        "leoluz/nvim-dap-go",
    },
    {
        "nvim-telescope/telescope-dap.nvim",
    },
    {
        "mfussenegger/nvim-dap-python",
    },
    {
        "simrat39/symbols-outline.nvim",
    },
    {
        "simrat39/rust-tools.nvim",
    },
    {
        "google/vim-jsonnet",
    },

    -----------------------------------------------------------------------
    -- colorscheme
    -----------------------------------------------------------------------
    {
        "dracula/vim",
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
    },
    {
        "EdenEast/nightfox.nvim",
    },
    {
        "projekt0n/github-nvim-theme",
    },
    {
        "lifepillar/vim-solarized8",
        name = "solarized8"
    },
    {
        "sainnhe/sonokai",
    },
    {
        "tjdevries/colorbuddy.nvim",
    },
    {
        "ishan9299/nvim-solarized-lua",
    },
    {
        "nyoom-engineering/oxocarbon.nvim",
    },
    {
        "rose-pine/neovim",
        name = 'rose-pine',
    },
    {
        "rebelot/kanagawa.nvim",
        name = 'kanagawa',
    },
    {
        "shaunsingh/nord.nvim",
    },

    -----------------------------------------------------------------------
    -- Workflow improvements
    -----------------------------------------------------------------------
    {
        "ThePrimeagen/harpoon",
    },
    {
        "ThePrimeagen/git-worktree.nvim",
    },

    -----------------------------------------------------------------------
    -- Telescope
    -----------------------------------------------------------------------
    {
        "nvim-telescope/telescope.nvim",
        version = '0.1.3',
    },
    {
        "SmiteshP/nvim-navic",
        dependencies = "neovim/nvim-lspconfig",
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
          "nvim-telescope/telescope.nvim",
          "nvim-lua/plenary.nvim",
          "SmiteshP/nvim-navic",
        },
    },
    {
        "mbbill/undotree",
    },
    {
        "dhruvasagar/vim-zoom",
    },
    {
        "will133/vim-dirdiff",
    },
    {
        "b0o/schemastore.nvim",
    },
    -----------------------------------------------------------------------
    -- Fancy icons
    -----------------------------------------------------------------------
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup { default = true }
        end,
    },
    -----------------------------------------------------------------------
    -- tab line
    -----------------------------------------------------------------------
    {
        "kdheepak/tabline.nvim",
        dependencies = {
          { 'hoob3rt/lualine.nvim', opt=true },
          {'kyazdani42/nvim-web-devicons', opt = true}
        },
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
    },
}
