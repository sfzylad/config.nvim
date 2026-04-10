require("go").setup({
   lsp_cfg = true,
   lsp_gofumpt = false, -- This disables gofmt/goimports on save
   lsp_on_save = false, -- This disables all LSP-based actions on save
   lsp_document_formatting = false,

   -- inlay hints are sometimes useful, most of the time annoying as they eat
   -- too much screen estate. Especially if somthing takes a lot of variables
   -- that line just looks like crap.
   lsp_inlay_hints = {
      enable = false,
   },
})

vim.api.nvim_command("au FileType go nmap <Leader><Leader>r :GoTestFunc")
