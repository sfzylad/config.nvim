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

  buf_set_keymap("n", '<F5>', "<cmd>lua  require('dap').continue()<CR>", opts)
  buf_set_keymap("n", '<F10>', "<cmd>lua require('dap').step_over()<CR>", opts)
  buf_set_keymap("n", '<F11>', "<cmd>lua require('dap').step_into()<CR>", opts)
  buf_set_keymap("n", '<F12>', "<cmd>lua require('dap').step_out()<CR>", opts)
  buf_set_keymap("n", '<Leader>b', "<cmd>lua require('dap').toggle_breakpoint()<CR>", opts)
  buf_set_keymap("n", '<Leader>B', "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
  buf_set_keymap("n", '<Leader>lp', "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
  buf_set_keymap("n", '<Leader>dr', "<cmd>lua require('dap').repl_open()<CR>", opts)
  buf_set_keymap("n", '<Leader><Leader>dl', "<cmd>lua function() require('dap').repl_open()<CR>", opts)
  buf_set_keymap("n", '<Leader>dt', "<cmd>lua require('dap-go').debug_test()<CR>", opts)

  if client.server_capabilities.documentSymbolProvider then
    local navic = require "nvim-navic"
    navic.attach(client, bufnr)
  end

  require "lsp_signature".on_attach({
      bind = true,
      hint_enable = false,
      handler_opts = {
          border = "rounded"
      },
      toggle_key = '<M-x>'
  })

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
-- require("zylad.config.bufferline").setup()

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
  extensions = {
      file_browser = {
          hidden = false,
          respect_gitignore = false,
          hide_parent_dir = false,
          hijack_netrw = true,
          git_status = true,
      },
  },
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
require("telescope").load_extension "file_browser"

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
-- require'lspconfig'.sumneko_lua.setup {
require'lspconfig'.lua_ls.setup {
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

require('dap-go').setup()
require('dapui').setup({
    	layouts = {
		{
			elements = {
				{ id = "scopes", size = 0.25 },
				{ id = "breakpoints", size = 0.25 },
				{ id = "stacks", size = 0.25 },
				{ id = "watches", size = 0.25 },
			},
			size = 40,
			position = "left",
		},
		{
			elements = {},
			size = 10,
			position = "bottom",
		},
	},
})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function ()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function ()
    dapui.close()
end

dap.listeners.before.event_exit["dapui_config"] = function ()
    dapui.close()
end
--
----------------------------------------------------------------------------
-- tabline
----------------------------------------------------------------------------
require('tabline').setup({
    enable = true,
    options = {
        -- section_separators = {'', ''},
        -- component_separators = {'', ''},
        modified_icon = "[+] ",
        show_devicons = true,
    }
})


require('rose-pine').setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = 'auto',
	--- @usage 'main'|'moon'|'dawn'
	dark_variant = 'main',
	bold_vert_split = true,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = 'base',
		background_nc = '_experimental_nc',
		panel = 'surface',
		panel_nc = 'base',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- Change specific vim highlight groups
	-- https://github.com/rose-pine/neovim/wiki/Recipes
	highlight_groups = {
		ColorColumn = { bg = 'rose' },
        Cursor = { guifg = 'love', guibg = 'iris'  },

		-- Blend colours against the "base" background
		CursorLine = { bg = 'foam', blend = 10 },
		StatusLine = { fg = 'love', bg = 'love', blend = 10 },
	}
})

for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
  vim.api.nvim_set_hl(0, group, {})
end
