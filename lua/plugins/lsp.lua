return {
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
        main = "ibl",
        opts = {},
        config = function ()
            local highlight = {
                "CursorColumn",
                "Whitespace",
            }
            require("ibl").setup{
                indent = { highlight = highlight, char = "" },
                whitespace = {
                    highlight = highlight,
                    remove_blankline_trail = false,
                },
                scope = { enabled = true },

            }
        end
    },
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
        'theHamsta/nvim-dap-virtual-text',
    },
    {
        "simrat39/symbols-outline.nvim",
    },
    {
        "google/vim-jsonnet",
    },
    {
        "astral-sh/ruff-lsp",
    },
    {
      'mrcjkb/rustaceanvim',
      version = '^5', -- Recommended
      lazy = false, -- This plugin is already lazy
    },
    {
    	"chrisgrieser/nvim-lsp-endhints",
    	event = "LspAttach",
    	opts = {}, -- required, even if empty
    },
    -- {
    --     'saghen/blink.cmp',
    --     -- optional: provides snippets for the snippet source
    --     dependencies = { 'L3MON4D3/LuaSnip' },
    --
    --     -- use a release tag to download pre-built binaries
    --     version = '1.*',
    --     -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    --     -- build = 'cargo build --release',
    --     -- If you use nix, you can build from source using latest nightly rust with:
    --     -- build = 'nix run .#build-plugin',
    --
    --     ---@module 'blink.cmp'
    --     ---@type blink.cmp.Config
    --     opts = {
    --       -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    --       -- 'super-tab' for mappings similar to vscode (tab to accept)
    --       -- 'enter' for enter to accept
    --       -- 'none' for no mappings
    --       --
    --       -- All presets have the following mappings:
    --       -- C-space: Open menu or open docs if already open
    --       -- C-n/C-p or Up/Down: Select next/previous item
    --       -- C-e: Hide menu
    --       -- C-k: Toggle signature help (if signature.enabled = true)
    --       --
    --       -- See :h blink-cmp-config-keymap for defining your own keymap
    --       keymap = { preset = 'enter' },
    --
    --       appearance = {
    --         -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    --         -- Adjusts spacing to ensure icons are aligned
    --         nerd_font_variant = 'mono'
    --       },
    --
    --       -- (Default) Only show the documentation popup when manually triggered
    --       completion = { documentation = { auto_show = true } },
    --
    --       -- Default list of enabled providers defined so that you can extend it
    --       -- elsewhere in your config, without redefining it, due to `opts_extend`
    --       sources = {
    --         default = { 'lsp', 'path', 'snippets', 'buffer' },
    --       },
    --
    --       -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    --       -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    --       -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --       --
    --       -- See the fuzzy documentation for more information
    --       fuzzy = { implementation = "prefer_rust_with_warning" }
    --     },
    --     opts_extend = { "sources.default" }
    --   }
}
