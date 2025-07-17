function R(name)
    require("plenary.reload").reload_module(name)
end

-- require("zylad.packer")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("config.lazy")
require("zylad.set")
require("zylad.plugins")
require("zylad.remap")

vim.lsp.enable({
    'clangd',
    'gopls',
    'jsonls',
    'jsonnet_ls',
    'lua_ls',
    'markdown_oxide',
    'nil_ls',
    'perlpls',
    -- 'pylsp',
    'pyright',
    'ruff',
    'ts_ls',
})

-- vim.opt.winborder = "rounded"

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        local border = {
            { "🭽", "FloatBorder" },

            { "▔", "FloatBorder" },
            { "🭾", "FloatBorder" },
            { "▕", "FloatBorder" },
            { "🭿", "FloatBorder" },
            { "▁", "FloatBorder" },
            { "🭼", "FloatBorder" },
            { "▏", "FloatBorder" },
        }

        local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = args.buf, desc = desc })
        end

        -- Hover setup
        local hover_opts = {
            width = 90,
            max_width = 90,
            wrap_at = 80,
            border = "rounded",
        }

        local on_hover = function()
            vim.lsp.buf.hover(hover_opts)
        end

        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(args.buf, ...) end
        local opts = { noremap = true, silent = true }
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/implementation') then
            -- Create a keymap for vim.lsp.buf.implementation ...
        end
        -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
        if client:supports_method('textDocument/completion') then
            -- Optional: trigger autocompletion on EVERY keypress. May be slow!
            -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
            -- client.server_capabilities.completionProvider.triggerCharacters = chars
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
        end
        -- Auto-format ("lint") on save.
        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                end,
            })
        end
        if client:supports_method('textDocument/hover') then
            vim.lsp.with(vim.lsp.handlers.hover, { border = border })
        end

        -- keymaps I want everywhere
        buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'gv', '<Cmd>vsplit | lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<space>gc', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)
        buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<CR>', opts)
        buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap('n', '<space>q', '<cmd>Trouble diagnostics<CR>', opts)
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        buf_set_keymap("n", "<space>dw", "<cmd>lua require('diaglist').open_all_diagnostics()<CR>", opts)
        buf_set_keymap("n", "<space>d0", "<cmd>lua require('diaglist').open_buffer_diagnostics()<CR>", opts)

        buf_set_keymap("n", '<F5>', "<cmd>lua  require('dap').continue()<CR>", opts)
        buf_set_keymap("n", '<F10>', "<cmd>lua require('dap').step_over()<CR>", opts)
        buf_set_keymap("n", '<F11>', "<cmd>lua require('dap').step_into()<CR>", opts)
        buf_set_keymap("n", '<F12>', "<cmd>lua require('dap').step_out()<CR>", opts)
        buf_set_keymap("n", '<Leader>b', "<cmd>lua require('dap').toggle_breakpoint()<CR>", opts)
        buf_set_keymap("n", '<Leader>B',
            "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
        buf_set_keymap("n", '<Leader>lp',
            "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
        buf_set_keymap("n", '<Leader>dr', "<cmd>lua require('dap').repl_open()<CR>", opts)
        buf_set_keymap("n", '<Leader><Leader>dl', "<cmd>lua function() require('dap').repl_open()<CR>", opts)
        buf_set_keymap("n", '<Leader>dt', "<cmd>lua require('dap-go').debug_test()<CR>", opts)
        buf_set_keymap("n", '<Leader>k', "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

        map("n", "K", on_hover, "Information about the symbol under the cursor")
    end,
})
