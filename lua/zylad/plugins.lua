-----------------------------------------------------------------------------
-- Set up plugins
-----------------------------------------------------------------------------
require("zylad.config.cmp").setup()
require("zylad.config.luasnip")
require("zylad.config.harpoon")
require("zylad.config.lualine").setup()
-- require("zylad.config.lspconfig")
require("zylad.config.dap").setup()
require("zylad.config.treesitter").setup()
require("zylad.config.treesitter-context").setup()
require("zylad.config.smart-split").setup()
require("zylad.config.remap")


-----------------------------------------------------------------------------
-- git worktree
-----------------------------------------------------------------------------
require("git-worktree").setup({})

----------------------------------------------------------------------------
-- gitsigns.nvim setup
----------------------------------------------------------------------------
require('gitsigns').setup()

require("luasnip.loaders.from_vscode").lazy_load()
require("diaglist").init({
  -- optional settings
  -- below are defaults
  debug = false,

  -- increase for noisy servers
  debounce_ms = 150,
})

----------------------------------------------------------------------------
-- todo-comments.nvim
----------------------------------------------------------------------------
require("todo-comments").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
  highlight = {
    pattern = {
        [[.*<(KEYWORDS)[()a-zA-Z_]+:]],
        [[.*<(KEYWORDS)\s*:]]
    },
  }
}
require("nvim-autopairs").setup {
    fast_wrap = {},
}

----------------------------------------------------------------------------
-- go setup
----------------------------------------------------------------------------
require('go').setup({
    lsp_inlay_hints = {
        enable = true,
        show_variable_name = true,
        -- prefix for parameter hints
        parameter_hints_prefix = "󰊕 ",
        show_parameter_hints = true,
        -- prefix for all the other hints (type, chaining)
        other_hints_prefix = "=> ",
        highlight = "Comment",
    }
})



require('lint').linters_by_ft = {
  sls = {'saltlint'},
}

