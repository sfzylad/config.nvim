return {
    -- {
    --     "ray-x/go.nvim",
    --     lazy = true,
    -- },
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
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
        config = function()
            local null_ls = require("null-ls")
            local methods = require("null-ls.methods")
            local helpers = require("null-ls.helpers")

            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

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
            local function gofumpt()
                local FORMATTING = methods.internal.FORMATTING
                return helpers.make_builtin({
                    name = "gofumpt",
                    meta = {
                        url = "https://github.com/mvdan/gofumpt",
                        description =
                        "Enforce a stricter format than gofmt, while being backwards compatible. That is, gofumpt is happy with a subset of the formats that gofmt is happy with.",
                    },
                    method = FORMATTING,
                    filetypes = { "go" },
                    generator_opts = {
                        command = "gofumpt",
                        to_stdin = true,
                    },
                    factory = helpers.formatter_factory,
                })
            end

            null_ls.setup({
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                                -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                                vim.lsp.buf.format({ async = false })
                            end,
                        })
                    end
                end,

                sources = {
                    -- null_ls doesn't work if I enumerate the files from the plugin
                    -- hence I use my own functions
                    ruff_fix,
                    gofumpt,
                    -- golangci_lint,
                    null_ls.builtins.diagnostics.ruff,
                    null_ls.builtins.formatting.gofumpt,
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
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
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
    -- {
    --     'Glench/Vim-Jinja2-Syntax',
    -- },
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
        "nvim-lualine/lualine.nvim",
        dependencies = {
            { 'hoob3rt/lualine.nvim',         opt = true },
            { 'kyazdani42/nvim-web-devicons', opt = true }
        },
    },
    {
        'arkav/lualine-lsp-progress',
        dependencies = {
            { 'hoob3rt/lualine.nvim', opt = true },
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
            { "gb", function() require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu" }
        },
        opts = {}
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "ggandor/leap.nvim",
        config = function()
            require('leap').create_default_mappings()
            -- Define equivalence classes for brackets and quotes, in addition to
            -- the default whitespace group:
            require('leap').opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }
        end
    },
    {
        "lukas-reineke/headlines.nvim",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true, -- or `opts = {}`
    },
    {
        'rafikdraoui/jj-diffconflicts',
    },
    {
        'avm99963/vim-jjdescription',
    },
    {
        'algmyr/vcsigns.nvim',
        config = function()
            require('vcsigns').setup {
                target_commit = 0, -- Nice default for jj with new+squash flow.
            }

            local function map(mode, lhs, rhs, desc, opts)
                local options = { noremap = true, silent = true, desc = desc }
                if opts then options = vim.tbl_extend('force', options, opts) end
                vim.keymap.set(mode, lhs, rhs, options)
            end

            -- map('n', '[r', function() require('vcsigns').actions.target_older_commit(0, vim.v.count1) end, 'Move diff target back')
            -- map('n', ']r', function() require('vcsigns').actions.target_newer_commit(0, vim.v.count1) end, 'Move diff target forward')
            map('n', '[c', "<Cmd>lua require('vcsigns').actions.hunk_prev(0, vim.v.count1)<CR>", 'Go to previous hunk')
            map('n', ']c', "<Cmd>lua require('vcsigns').actions.hunk_next(0, vim.v.count1)<CR>", 'Go to next hunk')
            map('n', '[C', function() require('vcsigns').actions.hunk_prev(0, 9999) end, 'Go to first hunk')
            map('n', ']C', function() require('vcsigns').actions.hunk_next(0, 9999) end, 'Go to last hunk')
            map('n', '<leader>su', function() require('vcsigns').actions.hunk_undo(0) end,
                'Undo the hunk under the cursor')
            map('n', '<leader>sd', function() require('vcsigns').actions.toggle_hunk_diff(0) end,
                'Show diff of hunk under the cursor')
        end,
    },
    {
        "benomahony/uv.nvim",
        opts = {
            picker_integration = true,
        },
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            animate = { enabled = false },
            bigfile = { enabled = true },
            dashboard = { enabled = true },
            explorer = { enabled = false },
            indent = { enabled = true },
            input = { enabled = true },
            picker = { enabled = true },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = false },
            scroll = { enabled = false },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        },
    }
}
