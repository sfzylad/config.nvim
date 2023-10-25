vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
    {silent=true, noremap=true}
)

vim.keymap.set("n", "<leader>tr", "<cmd>TroubleToggle lsp_references<cr>")
vim.keymap.set("n", "<leader>td", "<cmd>TroubleToggle lsp_type_definitions<cr>")
vim.keymap.set("n", "<leader>ti", "<cmd>TroubleToggle lsp_implementations<cr>")
vim.keymap.set("n", "<leader>ti", "<cmd>TroubleToggle lsp_implementations<cr>")
vim.keymap.set("n", "<leader>tq", "<cmd>TroubleToggle document_diagnostics<cr>")

