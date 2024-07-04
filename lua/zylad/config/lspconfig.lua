
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

  local gs = require("gitsigns")

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
  buf_set_keymap('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<CR>', opts)
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
  buf_set_keymap("n", '<Leader>k', "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

  local function map(mode, l, r, desc)
    vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
  end

  map("n", "]h", gs.next_hunk, "Next Hunk")
  map("n", "[h", gs.prev_hunk, "Prev Hunk")
  map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
  map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
  map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
  map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
  map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
  map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
  map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
  map("n", "<leader>ghd", gs.diffthis, "Diff This")
  map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
  map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")

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

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end


-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "rust_analyzer", "gopls", "pylsp", "jsonls", "clangd", "nil_ls"}
for _, lsp in ipairs(servers) do
    if lsp == "pylsp" then
        nvim_lsp[lsp].setup {
            inlay_hints = { enabled = true },
            on_attach = on_attach,
            settings = {
                pylsp = {
                    plugins = {
                        -- formatter options
                        black = { enabled = true, executable = "black" },
                        autopep8 = { enabled = false },
                        yapf = { enabled = false },
                        -- formatter options
                        pylint = { enabled = true, executable = "pylint" },
                        pyflakes = { enabled = false },
                        pycodestyle = { enabled = false },
                        -- type checker
                        pylsp_mypy = { enabled = true },
                        -- import sorting
                        pyls_isort = { enabled = true },
                        -- other stuff
                        ignore = {'E111', 'E114'},
                        maxLineLength = 80,
                    },
                },
            },
            handlers = handlers,
        }
    elseif lsp == "rust_analyzer" then
        nvim_lsp[lsp].setup {
            handlers = handlers,
            on_attach = on_attach,
            cmd = {
                "rustup", "run", "stable", "rust-analyzer"
            },
        }
    elseif lsp == "jsonls" then
        nvim_lsp[lsp].setup {
            settings = {
                json = {
                    schemas = require('schemastore').json.schemas(),
                    validate = { enable = true },
                },
            },
        }
    else
        nvim_lsp[lsp].setup {
            inlay_hints = { enabled = true },
            on_attach = on_attach,
            handlers = handlers
        }
    end
end


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

require("rust-tools").setup{
    server = {
        -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
        reload_workspace_from_cargo_toml = true,
        on_attach = on_attach,
    }
}

local util = require 'lspconfig.util'

require'lspconfig'.jsonnet_ls.setup{
    cmd = {"jsonnet-language-server", "-t"},
    root_dir = util.root_pattern("jsonnetfile.json"),
    on_attach = on_attach,
	settings = {
		ext_vars = {
			foo = 'bar',
		},
		formatting = {
			-- default values
			Indent              = 2,
			MaxBlankLines       = 2,
			StringStyle         = 'single',
			CommentStyle        = 'slash',
			PrettyFieldNames    = true,
			PadArrays           = false,
			PadObjects          = true,
			SortImports         = true,
			UseImplicitPlus     = true,
			StripEverything     = false,
			StripComments       = false,
			StripAllButComments = false,
		},
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      completion = {
        autoRequire = true,
        callSnippet = true,
      },
	},
}

require'lspconfig'.ruff.setup{}
