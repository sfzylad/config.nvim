------round-------
-- Helpers --
-------------
-- local feedkey = function(key, mode)
--   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
-- end


-- local navic = require("nvim-navic")

---------------------------------------------------------------------
-- LSP Clients
---------------------------------------------------------------------
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gv', '<Cmd>vsplit | lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
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
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_set_keymap("n", "<space>dw", "<cmd>lua require('diaglist').open_all_diagnostics()<CR>", opts)
  buf_set_keymap("n", "<space>d0", "<cmd>lua require('diaglist').open_buffer_diagnostics()<CR>", opts)

  if client.server_capabilities.documentSymbolProvider then
    local navic = require "nvim-navic"
    navic.attach(client, bufnr)
  end

  -- Run gofmt on save
  -- vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').gofmt() ]], false)
end

local border = {
      {"🭽", "FloatBorder"},

      {"▔", "FloatBorder"},
      {"🭾", "FloatBorder"},
      {"▕", "FloatBorder"},
      {"🭿", "FloatBorder"},
      {"▁", "FloatBorder"},
      {"🭼", "FloatBorder"},
      {"▏", "FloatBorder"},
}

local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}


-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "rust_analyzer", "gopls", "pylsp"}
for _, lsp in ipairs(servers) do
    if lsp == "pylsp" then
        nvim_lsp[lsp].setup {
            on_attach = on_attach,
            settings = {
                plugins = {
                    ignore = {'E111', 'E114'},
                    maxLineLength = 80,
                },
            },
            handlers = handlers,
        }
    else
        nvim_lsp[lsp].setup { on_attach = on_attach, handlers = handlers }
    end
end

-----------------------------------------------------------------------------
-- Set up nvim-cmp
-----------------------------------------------------------------------------
require("zylad.config.cmp").setup()

-----------------------------------------------------------------------------
-- harpoon
-----------------------------------------------------------------------------
require("harpoon").setup({
    global_settings = {
        -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
        tmux_autoclose_windows = false,
        -- filetypes that you want to prevent from adding to the harpoon list menu.
        excluded_filetypes = { "harpoon" },
        tmux_send_commands = true,
      },
})

vim.keymap.set('n', '<leader>ht', '<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>')
vim.keymap.set('n', '<leader>hm', '<Cmd>lua require("harpoon.mark").add_file()<CR>')
vim.keymap.set('n', '<leader>hn', '<Cmd>lua require("harpoon.ui").nav_next()<CR>')
vim.keymap.set('n', '<leader>hp', '<Cmd>lua require("harpoon.ui").nav_prev()<CR>')
vim.keymap.set('n', '<leader>hr', '<Cmd>lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>')


-----------------------------------------------------------------------------
-- git worktree
-----------------------------------------------------------------------------
require("git-worktree").setup({
    -- change_directory_command = <str> -- default: "cd",
    -- update_on_change = <boolean> -- default: true,
    -- update_on_change_command = <str> -- default: "e .",
    -- clearjumps_on_change = <boolean> -- default: true,
    -- autopush = <boolean> -- default: false,
})

----------------------------------------------------------------------------
-- gitsigns.nvim setup
----------------------------------------------------------------------------
require('gitsigns').setup()

----------------------------------------------------------------------------
-- indent indent_blankline setup
----------------------------------------------------------------------------
require("indent_blankline").setup {
  -- for example, context is off by default, use this to turn it on
  show_current_context = false,
  space_char_blankline = " ",
  show_current_context_start = false,
  -- show_current_context_start = true,
}

require("luasnip.loaders.from_vscode").lazy_load()
require("diaglist").init({
  -- optional settings
  -- below are defaults
  debug = false,

  -- increase for noisy servers
  debounce_ms = 150,
})

----------------------------------------------------------------------------
-- symbols outline
----------------------------------------------------------------------------
require("symbols-outline").setup()
vim.keymap.set('n', '<leader>p', '<Cmd>SymbolsOutline<CR>')


----------------------------------------------------------------------------
-- todo-comments.nvim
----------------------------------------------------------------------------
require("todo-comments").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}
require("nvim-autopairs").setup {
    fast_wrap = {},
}

require("rust-tools").setup{
    server = {
      on_attach = on_attach,
    }
}

----------------------------------------------------------------------------
-- rust_analyzer setup
----------------------------------------------------------------------------
require'lspconfig'.rust_analyzer.setup{}


----------------------------------------------------------------------------
-- bufferline setup
----------------------------------------------------------------------------
require("zylad.config.bufferline").setup()

----------------------------------------------------------------------------
-- treesitter-context setup
----------------------------------------------------------------------------
require("zylad.config.treesitter-context").setup()

----------------------------------------------------------------------------
-- go setup
----------------------------------------------------------------------------
require('go').setup()


----------------------------------------------------------------------------
-- Telescope setup
----------------------------------------------------------------------------
require('telescope').setup{
  defaults = {
    extensions = {
        file_browser = {
            hijack_netrw = true,
        },
    },
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      n = {
    	  ['<c-d>'] = require('telescope.actions').delete_buffer,
      }, -- n
      i = {
        ["<C-h>"] = "which_key",
        ['<c-d>'] = require('telescope.actions').delete_buffer
      } -- i
    } -- mappings
  }, -- defaults
} -- telescope setup

vim.keymap.set('n', '<C-b>', '<Cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<C-p>', '<Cmd>Telescope find_files<CR>')

----------------------------------------------------------------------------
-- Lualine - replacement for airline
----------------------------------------------------------------------------
require("zylad.config.lualine").setup()

----------------------------------------------------------------------------
-- treesitter
----------------------------------------------------------------------------
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
      enable = true,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
  }
}

----------------------------------------------------------------------------
-- lua language server
----------------------------------------------------------------------------
require'lspconfig'.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'Lua 5.1',
        path = {
            '?.lua',
            '?/init.lua',
            vim.fn.expand'~/.luarocks/share/lua/5.3/?.lua',
            vim.fn.expand'~/.luarocks/share/lua/5.3/?/init.lua',
             '/usr/share/5.1/?.lua',
             '/usr/share/lua/5.1/?/init.lua',
             '/usr/local/Cellar/lua/5.4.4_1/?.lua',
             '/usr/local/Cellar/lua/5.4.4_1/?/init.lua',
        },
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
      completion = {
        autoRequire = true,
        callSnippet = true,
      },
    },
  },
}

----------------------------------------------------------------------------
-- DAP virtual text
----------------------------------------------------------------------------
require("nvim-dap-virtual-text").setup({})

----------------------------------------------------------------------------
-- start dashboard
----------------------------------------------------------------------------
-- require("zylad.config.dashboard").setup()

----------------------------------------------------------------------------
-- Windows.nvim setup
----------------------------------------------------------------------------
-- require('windows').setup(),
-- vim.keymap.set('n', '<C-w>m', '<Cmd>WindowsMaximize<CR>'),
-- vim.keymap.set('n', '<C-w>t', '<Cmd>WindowsToggleAutowidth<CR>'),
-- vim.keymap.set('n', '<C-w>e', '<Cmd>WindowsEnableAutowidth<CR>'),
-- vim.keymap.set('n', '<C-w>z', '<Cmd>WindowsDisableAutowidth<CR>'),


----------------------------------------------------------------------------
-- nvim-tree setup
----------------------------------------------------------------------------
-- require("nvim-tree").setup {
--     sort_by = "case_sensitive",
--     open_on_setup = false,
--     open_on_setup_file = false,
--     hijack_unnamed_buffer_when_opening = false,
--     view = {
--         adaptive_size = true,
--         signcolumn = "yes",
--         float = {
--             enable = true,
--             quit_on_focus_loss = true,
--             open_win_config = {
--                 relative = "editor",
--                 border = "rounded",
--                 width = 30,
--                 height = 50,
--                 row = 1,
--                 col = 1,
--             },
--         },
--     },
--     renderer = {
--         group_empty = true,
--         highlight_git = true,
--     },
--
-- },
-- vim.keymap.set('n', '<leader>t', '<Cmd>NvimTreeToggle<CR>'),
