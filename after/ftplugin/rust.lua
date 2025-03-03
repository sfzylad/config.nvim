local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n",
  "<leader>a",
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)
vim.keymap.set(
  "n",
  "<leader>ca",
  function()
      vim.lsp.buf.code_action()
  end,
  { silent = true, buffer = bufnr }
)
vim.keymap.set(
  "n",
  "K",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({'hover', 'actions'})
  end,
  { silent = true, buffer = bufnr }
)

vim.keymap.set(
    "n",
    "<leader>rd",
    function ()
        vim.cmd.RustLsp({ 'renderDiagnostic', 'current' })
    end,
    { silent = true, buffer = bufnr }
)

vim.keymap.set(
    "n",
    "<leader>re",
    function ()
        vim.cmd.RustLsp('explainError')
    end,
    { silent = true, buffer = bufnr }
)

vim.keymap.set(
    'n',
    "gd",
    function ()
        vim.lsp.buf.definition()
    end,
    { silent = true, buffer = bufnr }

)
vim.keymap.set(
    'n',
    "gD",
    function ()
        vim.lsp.buf.definition()
    end,
    { silent = true, buffer = bufnr }

)
vim.keymap.set(
    'n',
    "gv",
    function ()
        vim.cmd("vsplit")
        vim.lsp.buf.definition()
    end,
    { silent = true, buffer = bufnr }

)
vim.keymap.set(
    'n',
    "gi",
    function ()
        vim.lsp.buf.implementation()
    end,
    { silent = true, buffer = bufnr }

)
vim.keymap.set(
    'n',
    "<leader>D",
    function ()
        vim.lsp.buf.type_definition()
    end,
    { silent = true, buffer = bufnr }

)
vim.keymap.set(
    'n',
    "<leader>rn",
    function ()
        vim.lsp.buf.rename()
    end,
    { silent = true, buffer = bufnr }

)

vim.keymap.set(
    'n',
    "<leader>th",
    function ()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end,
    { silent = true, buffer = bufnr }

)

local on_attach = function(client, bufnr)
    print("ON ATTACH")
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
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>Trouble diagnostics<CR>', opts)

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

vim.g.rustaceanvim = {
    server = {
        cmd = {'rustup', 'run', 'stable', 'rust-analyzer'},
        on_attach = on_attach,
        status_notify_level = 'info',
    }
}

function tprint (tbl, indent)
  if not indent then indent = 0 end
  local toprint = string.rep(" ", indent) .. "{\r\n"
  indent = indent + 2
  for k, v in pairs(tbl) do
    toprint = toprint .. string.rep(" ", indent)
    if (type(k) == "number") then
      toprint = toprint .. "[" .. k .. "] = "
    elseif (type(k) == "string") then
      toprint = toprint  .. k ..  "= "
    end
    if (type(v) == "number") then
      toprint = toprint .. v .. ",\r\n"
    elseif (type(v) == "string") then
      toprint = toprint .. "\"" .. v .. "\",\r\n"
    elseif (type(v) == "table") then
      toprint = toprint .. tprint(v, indent + 2) .. ",\r\n"
    else
      toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n"
    end
  end
  toprint = toprint .. string.rep(" ", indent-2) .. "}"
  return toprint
end

