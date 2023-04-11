-----------------------------------------------------------------------------
-- Set up plugins
-----------------------------------------------------------------------------
require("zylad.config.cmp").setup()
require("zylad.config.luasnip")
require("zylad.config.dashboard").setup()
require("zylad.config.harpoon").setup()
require("zylad.config.lualine").setup()
require("zylad.config.lspconfig")
require("zylad.config.dap").setup()
require("zylad.config.treesitter").setup()
require("zylad.config.treesitter-context").setup()
require("zylad.config.telescope").setup()

-----------------------------------------------------------------------------
-- git worktree
-----------------------------------------------------------------------------
require("git-worktree").setup({
    -- change_directory_command = <str> -- default: "cd",
    -- update_on_change = <boolean> -- default: true,
    -- update_on_change_command = <str> -- default: "e .",
    -- clearjumps_on_change = <boolean> -- default: true,
    -- autopush = <boolean> -- default: false,
})

----------------------------------------------------------------------------
-- gitsigns.nvim setup
----------------------------------------------------------------------------
require('gitsigns').setup()

----------------------------------------------------------------------------
-- indent indent_blankline setup
----------------------------------------------------------------------------
require("indent_blankline").setup {
  -- for example, context is off by default, use this to turn it on
  show_current_context = false,
  space_char_blankline = " ",
  show_current_context_start = false,
  -- show_current_context_start = true,
}

require("luasnip.loaders.from_vscode").lazy_load()
require("diaglist").init({
  -- optional settings
  -- below are defaults
  debug = false,

  -- increase for noisy servers
  debounce_ms = 150,
})

----------------------------------------------------------------------------
-- symbols outline
----------------------------------------------------------------------------
require("symbols-outline").setup()
vim.keymap.set('n', '<leader>p', '<Cmd>SymbolsOutline<CR>')


----------------------------------------------------------------------------
-- todo-comments.nvim
----------------------------------------------------------------------------
require("todo-comments").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}
require("nvim-autopairs").setup {
    fast_wrap = {},
}

----------------------------------------------------------------------------
-- rust_analyzer setup
----------------------------------------------------------------------------
require'lspconfig'.rust_analyzer.setup{}

----------------------------------------------------------------------------
-- go setup
----------------------------------------------------------------------------
require('go').setup()



----------------------------------------------------------------------------
-- tabline
----------------------------------------------------------------------------
require('tabline').setup({
    enable = true,
    options = {
        -- section_separators = {'', ''},
        -- component_separators = {'', ''},
        modified_icon = "[+] ",
        show_devicons = true,
    }
})

-- NOTE: This has to go at the end
require("zylad.config.ui").setup()
