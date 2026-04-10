require("zylad.config.luasnip")
require("zylad.config.harpoon")
require("zylad.config.lualine").setup()
-- require("zylad.config.lspconfig")
require("zylad.config.dap").setup()
-- require("zylad.config.treesitter").setup()
require("zylad.config.treesitter-context").setup()
require("zylad.config.smart-split").setup()
require("zylad.config.remap")
require("zylad.config.snacks")
require("zylad.config.trouble")
require("zylad.config.dashboard")
require("zylad.config.cmp")
-- require("zylad.config.none-ls")
require("zylad.config.formatting")
require("zylad.config.go")
require("zylad.config.git")
require("zylad.config.todo")
require("zylad.config.trouble")
require("zylad.config.whichkey")
require("zylad.config.difft")
require("zylad.config.auto-session")

require("luasnip.loaders.from_vscode").lazy_load()
require("diaglist").init({
   -- optional settings
   -- below are defaults
   debug = false,

   -- increase for noisy servers
   debounce_ms = 150,
})

require("todo-comments").setup({
   -- your configuration comes here
   -- or leave it empty to use the default settings
   -- refer to the configuration section below
   highlight = {
      pattern = {
         [[.*<(KEYWORDS)[()a-zA-Z_]+:]],
         [[.*<(KEYWORDS)\s*:]],
      },
   },
})

require("nvim-autopairs").setup({
   fast_wrap = {},
})

require("lint").linters_by_ft = {
   sls = { "saltlint" },
}
