local conform = require("conform")

conform.setup({
   formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      lua = { "stylua" },
      python = { "ruff" },
      go = { "goimports", "gofmt" },
      rust = { "rustfmt", lsp_format = "fallback" },
      sh = { "beautysh" },
      bash = { "beautysh" },
   },
   format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
   },
})

vim.api.nvim_create_autocmd("BufWritePre", {
   pattern = "*",
   callback = function(args)
      require("conform").format({ bufnr = args.buf })
   end,
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
   conform.format({
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
   })
end, { desc = "Format file or range (in visual mode)" })
