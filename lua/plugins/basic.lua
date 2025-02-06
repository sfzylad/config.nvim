return {
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

    -----------------------------------------------------------------------
    -- Workflow improvements
    -----------------------------------------------------------------------
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
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
        'Glench/Vim-Jinja2-Syntax',
    },
    {
        'vmware-archive/salt-vim',
    },
    {
        'mfussenegger/nvim-lint',
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
    {
      "p00f/clangd_extensions.nvim",
      lazy = true,
      config = function() end,
      opts = {
        inlay_hints = {
          inline = false,
        },
        ast = {
          --These require codicons (https://github.com/microsoft/vscode-codicons)
          role_icons = {
            type = "",
            declaration = "",
            expression = "",
            specifier = "",
            statement = "",
            ["template argument"] = "",
          },
          kind_icons = {
            Compound = "",
            Recovery = "",
            TranslationUnit = "",
            PackExpansion = "",
            TemplateTypeParm = "",
            TemplateTemplateParm = "",
            TemplateParamObject = "",
          },
        },
      },
    },
    {
        'pmizio/typescript-tools.nvim',
    },



    -----------------------------------------------------------------------
    -- Fancy icons
    -----------------------------------------------------------------------
    { "nvim-tree/nvim-web-devicons", opts = {} },
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
        'arkav/lualine-lsp-progress',
        dependencies = {
          { 'hoob3rt/lualine.nvim', opt=true },
        },
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
    },
    { 'rest-nvim/rest.nvim' },

    {
      "leath-dub/snipe.nvim",
      keys = {
        {"gb", function () require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu"}
      },
      opts = {}
    }
}
