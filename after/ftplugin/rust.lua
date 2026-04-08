local bufnr = vim.api.nvim_get_current_buf()

vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

vim.api.nvim_create_autocmd('FileType', {
   pattern = { 'rust' },
   callback = function() vim.treesitter.start() end,
})

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
   "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
   function()
      vim.cmd.RustLsp({ 'hover', 'actions' })
   end,
   { silent = true, buffer = bufnr }
)

vim.keymap.set(
   "n",
   "<leader>rd",
   function()
      vim.cmd.RustLsp({ 'renderDiagnostic', 'current' })
   end,
   { silent = true, buffer = bufnr }
)

vim.keymap.set(
   "n",
   "<leader>re",
   function()
      vim.cmd.RustLsp('explainError')
   end,
   { silent = true, buffer = bufnr }
)

vim.keymap.set(
   'n',
   "gd",
   function()
      vim.lsp.buf.definition()
   end,
   { silent = true, buffer = bufnr }

)
vim.keymap.set(
   'n',
   "gD",
   function()
      vim.lsp.buf.definition()
   end,
   { silent = true, buffer = bufnr }

)
vim.keymap.set(
   'n',
   "gv",
   function()
      vim.cmd("vsplit")
      vim.lsp.buf.definition()
   end,
   { silent = true, buffer = bufnr }

)
vim.keymap.set(
   'n',
   "gi",
   function()
      vim.lsp.buf.implementation()
   end,
   { silent = true, buffer = bufnr }

)
vim.keymap.set(
   'n',
   "<leader>D",
   function()
      vim.lsp.buf.type_definition()
   end,
   { silent = true, buffer = bufnr }

)
vim.keymap.set(
   'n',
   "<leader>rn",
   function()
      vim.lsp.buf.rename()
   end,
   { silent = true, buffer = bufnr }

)
vim.keymap.set(
   'n',
   "gr",
   function()
      vim.lsp.buf.references()
   end,
   { silent = true, buffer = bufnr }

)

vim.keymap.set(
   'n',
   "<leader>th",
   function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
   end,
   { silent = true, buffer = bufnr }

)
vim.keymap.set(
   'n',
   "<F5>",
   function()
      require('dap').continue()
   end,
   { silent = true, buffer = bufnr }

)
vim.keymap.set(
   'n',
   "<F10>",
   function()
      require('dap').step_over()
   end,
   { silent = true, buffer = bufnr }

)
vim.keymap.set(
   'n',
   "<F11>",
   function()
      require('dap').step_into()
   end,
   { silent = true, buffer = bufnr }

)
vim.keymap.set(
   'n',
   "<F12>",
   function()
      require('dap').step_out()
   end,
   { silent = true, buffer = bufnr }

)
vim.keymap.set(
   'n',
   "<leader>b",
   function()
      require('dap').toggle_breakpoint()
   end,
   { silent = true, buffer = bufnr }

)
vim.keymap.set(
   'n',
   "<leader>B",
   function()
      require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
   end,
   { silent = true, buffer = bufnr }

)
vim.keymap.set(
   'n',
   "<leader>lp",
   function()
      require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
   end,
   { silent = true, buffer = bufnr }

)
vim.keymap.set(
   'n',
   "<leader>dr",
   function()
      require('dap').repl_open()
   end,
   { silent = true, buffer = bufnr }

)

function Tprint(tbl, indent)
   if not indent then indent = 0 end
   local toprint = string.rep(" ", indent) .. "{\r\n"
   indent = indent + 2
   for k, v in pairs(tbl) do
      toprint = toprint .. string.rep(" ", indent)
      if (type(k) == "number") then
         toprint = toprint .. "[" .. k .. "] = "
      elseif (type(k) == "string") then
         toprint = toprint .. k .. "= "
      end
      if (type(v) == "number") then
         toprint = toprint .. v .. ",\r\n"
      elseif (type(v) == "string") then
         toprint = toprint .. "\"" .. v .. "\",\r\n"
      elseif (type(v) == "table") then
         toprint = toprint .. Tprint(v, indent + 2) .. ",\r\n"
      else
         toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n"
      end
   end
   toprint = toprint .. string.rep(" ", indent - 2) .. "}"
   return toprint
end
