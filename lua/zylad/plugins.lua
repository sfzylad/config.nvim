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
require("zylad.config.smart-split").setup()
require("zylad.config.undotree")
require("zylad.config.fugitive")
require("zylad.config.remap")

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
-- local highlight = {
--     "RainbowRed",
--     "RainbowYellow",
--     "RainbowBlue",
--     "RainbowOrange",
--     "RainbowGreen",
--     "RainbowViolet",
--     "RainbowCyan",
-- }
--
-- local hooks = require "ibl.hooks"
-- -- create the highlight groups in the highlight setup hook, so they are reset
-- -- every time the colorscheme changes
-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--     vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
--     vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
--     vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
--     vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
--     vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
--     vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
--     vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
-- end)
--
-- require("ibl").setup { indent = { highlight = highlight } }

-- local highlight = {
--     "CursorColumn",
--     "Whitespace",
-- }
-- require("ibl").setup {
--     indent = { highlight = highlight, char = "" },
--     whitespace = {
--         highlight = highlight,
--         remove_blankline_trail = false,
--     },
--     scope = { enabled = false },
-- }

require "ibl".setup({
    scope = { enabled = true },
})

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
-- require'lspconfig'.rust_analyzer.setup{}

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
--
----------------------------------------------------------------------------
-- leap
----------------------------------------------------------------------------
-- require('leap').add_default_mappings()

-- NOTE: This has to go at the end
require("zylad.config.ui").setup()
