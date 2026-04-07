return {
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
        "folke/todo-comments.nvim",
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
        "nvim-tree/nvim-web-devicons",
    },
    --  A library for asynchronous IO in Neovim
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

            local function prettierd()
                local cmd_resolver = require("null-ls.helpers.command_resolver")
                local u = require("null-ls.utils")
                local FORMATTING = methods.internal.FORMATTING
                local RANGE_FORMATTING = methods.internal.RANGE_FORMATTING
                return helpers.make_builtin({
                    name = "prettierd",
                    meta = {
                        url = "https://github.com/fsouza/prettierd",
                        description = "prettier, as a daemon, for ludicrous formatting speed.",
                    },
                    method = { FORMATTING, RANGE_FORMATTING },
                    filetypes = {
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                        "vue",
                        "css",
                        "scss",
                        "less",
                        "html",
                        "json",
                        "jsonc",
                        "yaml",
                        "markdown",
                        "markdown.mdx",
                        "graphql",
                        "handlebars",
                        "svelte",
                        "astro",
                        "htmlangular",
                    },
                    generator_opts = {
                        command = "prettierd",
                        args = function(params)
                            if params.method == FORMATTING then
                                return { "$FILENAME" }
                            end

                            local row, end_row = params.range.row - 1, params.range.end_row - 1
                            local col, end_col = params.range.col - 1, params.range.end_col - 1
                            local start_offset = vim.api.nvim_buf_get_offset(params.bufnr, row) + col
                            local end_offset = vim.api.nvim_buf_get_offset(params.bufnr, end_row) + end_col

                            return { "$FILENAME", "--range-start=" .. start_offset, "--range-end=" .. end_offset }
                        end,
                        dynamic_command = cmd_resolver.from_node_modules(),
                        to_stdin = true,
                        cwd = helpers.cache.by_bufnr(function(params)
                            return u.cosmiconfig("prettier")(params.bufname)
                        end),
                    },
                    factory = helpers.formatter_factory,
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
                    -- ruff_fix,
                    gofumpt,
                    prettierd,
                    -- golangci_lint,
                    -- null_ls.builtins.diagnostics.ruff,
                    null_ls.builtins.formatting.gofumpt,
                    null_ls.builtins.formatting.yamlfmt,
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
        branch = "main",
        commit = "c82bf96f0a773d85304feeb695e1e23b2207ac35",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require('nvim-treesitter').install {
                'go',
                'bash',
                'rust',
                'javascript',
                'typescript',
                'yaml',
                'json',
                'zig'
            }
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
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

    -- {
    --     "SmiteshP/nvim-navic",
    --     dependencies = "neovim/nvim-lspconfig",
    -- },
    {
        "mbbill/undotree",
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
    -- used with the 'gB' keymap
    {
        "leath-dub/snipe.nvim",
        keys = {
            { "gb", function() require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu" }
        },
        opts = {}
    },
    {
        "ggandor/leap.nvim",
        url = "ssh://git@codeberg.org/andyg/leap.nvim.git",
        config = function()
            -- Highly recommended: define a preview filter to reduce visual noise
            -- and the blinking effect after the first keypress.
            -- For example, define word boundaries as the common case, that is, skip
            -- preview for matches starting with whitespace or an alphabetic
            -- mid-word character: foobar[baaz] = quux
            --                     *    ***  ** * *  *
            require('leap').opts.preview = function(ch0, ch1, ch2)
                return not (
                    ch1:match('%s')
                    or (ch0:match('%a') and ch1:match('%a') and ch2:match('%a'))
                )
            end

            -- Enable the traversal keys to repeat the previous search without
            -- explicitly invoking Leap (`<cr><cr>...` instead of `s<cr><cr>...`):
            do
                local clever = require('leap.user').with_traversal_keys
                -- For relative directions, set the `backward` flags according to:
                -- local prev_backward = require('leap').state['repeat'].backward
                vim.keymap.set({ 'n', 'x', 'o' }, '<cr>', function()
                    require('leap').leap {
                        ['repeat'] = true, opts = clever('<cr>', '<bs>'),
                    }
                end)
                vim.keymap.set({ 'n', 'x', 'o' }, '<bs>', function()
                    require('leap').leap {
                        ['repeat'] = true, opts = clever('<bs>', '<cr>'), backward = true,
                    }
                end)
            end

            -- Set automatic paste after remote yank operations:
            vim.api.nvim_create_autocmd('User', {
                pattern = 'RemoteOperationDone',
                group = vim.api.nvim_create_augroup('LeapRemote', {}),
                callback = function(event)
                    if vim.v.operator == 'y' and event.data.register == '"' then
                        vim.cmd('normal! p')
                    end
                end,
            })

            vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
            vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
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
        'Exafunction/windsurf.vim',
        event = 'BufEnter',
        config = function()
            local function map(mode, lhs, rhs, desc, opts)
                local options = { noremap = true, silent = true, desc = desc }
                if opts then options = vim.tbl_extend('force', options, opts) end
                vim.keymap.set(mode, lhs, rhs, options)
            end
            vim.g.codeium_workspace_root_hints = { '.bzr', '.git', '.hg', '.jj', '.svn', '_FOSSIL_', 'package.json' }
            vim.g.codeium_enabled = false
            map('n', '<leader>ct', function()
                vim.api.nvim_call_function("CodeiumToggle", {})
            end, "Toggle Windsurf")
            map('i', '<M-;>', function()
                vim.api.nvim_call_function("CodeiumToggle", {})
            end, "Toggle Windsurf")
        end,
    },
}
