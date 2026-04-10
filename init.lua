require("bootstrap")

function R(name)
   require("plenary.reload").reload_module(name)
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- FIXME: Clean this up along with the lazy configuration.
-- require("config.lazy")
require("zylad.set")
require("zylad.plugins")

-- Ensures the menu appears even for a single match and uses the native popup window.
vim.opt.completeopt = "menu,menuone,noinsert,popup"
vim.opt.pumheight = 10 -- Keep the menu short and clean
vim.opt.pumblend = 5 -- Slight transparency

vim.lsp.enable({
   "clangd",
   "gopls",
   "jsonls",
   "lua_ls",
   "markdown_oxide",
   "nil_ls",
   "pyright",
   "ruff",
   "typescript-language-server",
   -- 'rust-analyzer',
})

vim.api.nvim_create_autocmd("FileType", {
   pattern = {
      -- golang
      "go",
      "gowork",
      "gomod",
      "rust",
      "python",
      -- typescript
      "typescript",
      "typescriptreact",
      -- zig
      "zig",
      "zir",
      -- C
      "c",
      "cpp",
      "json",
      "yaml",
      "markdown",
      "nix",
      "flake",
      "make",
      "cmake",
   },
   callback = function()
      vim.treesitter.start()
   end,
})

vim.api.nvim_create_autocmd("LspAttach", {
   group = vim.api.nvim_create_augroup("my.lsp", {}),
   callback = function(args)
      -- local border = {
      --    { "🭽", "FloatBorder" },
      --
      --    { "▔", "FloatBorder" },
      --    { "🭾", "FloatBorder" },
      --    { "▕", "FloatBorder" },
      --    { "🭿", "FloatBorder" },
      --    { "▁", "FloatBorder" },
      --    { "🭼", "FloatBorder" },
      --    { "▏", "FloatBorder" },
      -- }
      local border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" }

      local function map(mode, l, r, desc)
         vim.keymap.set(mode, l, r, { buffer = args.buf, desc = desc })
      end

      -- Hover setup
      local hover_opts = {
         width = 90,
         max_width = 90,
         wrap_at = 80,
         border = border,
      }

      local on_hover = function()
         vim.lsp.buf.hover(hover_opts)
      end

      local function buf_set_keymap(...)
         vim.api.nvim_buf_set_keymap(args.buf, ...)
      end
      local opts = { noremap = true, silent = true }
      local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
      if client:supports_method("textDocument/implementation") then
         -- Create a keymap for vim.lsp.buf.implementation ...
         -- print("textDocument/implementation encountered")
      end
      -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
      if client:supports_method("textDocument/completion") then
         -- Optional: trigger autocompletion on EVERY keypress. May be slow!
         -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
         -- client.server_capabilities.completionProvider.triggerCharacters = chars
         vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
      end
      if client:supports_method("textDocument/hover") then
         vim.lsp.with(vim.lsp.handlers.hover, {
            border = border,
            max_height = 25,
            max_width = 120,
         })
      end

      if client.name == "markdown_oxide" then
         vim.api.nvim_create_user_command("Daily", function(args)
            local input = args.args

            client:exec_cmd({ title = "Open daily note", command = "jump", arguments = { input } })
         end, { desc = "Open daily note", nargs = "*" })
         vim.api.nvim_create_user_command("Today", function(args)
            client:exec_cmd({ title = "Open daily note", command = "jump", arguments = { "today" } })
         end, { desc = "Open daily note", nargs = "*" })
      end

      vim.diagnostic.config({
         signs = true,
         underline = true,
         virtual_text = true,
         virtual_lines = false,
         update_in_insert = true,
         float = {
            -- border = 'rounded',
            border = border,
            focusable = true,
         },
         jump = { float = true },
      })

      -- keymaps I want everywhere
      buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
      buf_set_keymap("n", "gv", "<Cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts)
      buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
      buf_set_keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
      buf_set_keymap("n", "<space>gc", "<cmd>lua vim.lsp.buf.incoming_calls()<CR>", opts)
      buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
      buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
      buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
      buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
      buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
      buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
      buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
      buf_set_keymap("n", "<Leader>e", "<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<CR>", opts)
      buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
      buf_set_keymap("n", "<space>dw", "<cmd>lua require('diaglist').open_all_diagnostics()<CR>", opts)
      buf_set_keymap("n", "<space>d0", "<cmd>lua require('diaglist').open_buffer_diagnostics()<CR>", opts)

      buf_set_keymap("n", "<F5>", "<cmd>lua  require('dap').continue()<CR>", opts)
      buf_set_keymap("n", "<F10>", "<cmd>lua require('dap').step_over()<CR>", opts)
      buf_set_keymap("n", "<F11>", "<cmd>lua require('dap').step_into()<CR>", opts)
      buf_set_keymap("n", "<F12>", "<cmd>lua require('dap').step_out()<CR>", opts)
      buf_set_keymap("n", "<Leader>b", "<cmd>lua require('dap').toggle_breakpoint()<CR>", opts)
      buf_set_keymap(
         "n",
         "<Leader>B",
         "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
         opts
      )
      buf_set_keymap(
         "n",
         "<Leader>lp",
         "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
         opts
      )
      buf_set_keymap("n", "<Leader>dr", "<cmd>lua require('dap').repl_open()<CR>", opts)
      buf_set_keymap("n", "<Leader><Leader>dl", "<cmd>lua function() require('dap').repl_open()<CR>", opts)
      buf_set_keymap("n", "<Leader>dt", "<cmd>lua require('dap-go').debug_test()<CR>", opts)
      buf_set_keymap("n", "<Leader>k", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

      map("n", "K", on_hover, "Information about the symbol under the cursor")
   end,
})
