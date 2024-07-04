require("trouble").setup {
  icons = false,
  opts = {},
  cmd = "Trouble",
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
  -- modes = {
  --     test = {
  --         mode = "diagnostics",
  --         preview = {
  --           type = "split",
  --           relative = "win",
  --           position = "right",
  --           size = 0.3,
  --         },
  --    },
  -- },
}
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
    {silent=true, noremap=true}
)

vim.keymap.set("n", "<leader>tr", "<cmd>TroubleToggle lsp_references<cr>")
vim.keymap.set("n", "<leader>td", "<cmd>TroubleToggle lsp_type_definitions<cr>")
vim.keymap.set("n", "<leader>ti", "<cmd>TroubleToggle lsp_implementations<cr>")
vim.keymap.set("n", "<leader>ti", "<cmd>TroubleToggle lsp_implementations<cr>")
vim.keymap.set("n", "<leader>tq", "<cmd>TroubleToggle document_diagnostics<cr>")

