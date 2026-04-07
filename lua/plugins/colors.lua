--- Function for setting up themes
-- This function should be used across my entire config.
-- @param color string: Name of the theme to be set.
function ColorMyPencils(color)
   color = color or "gruber-darker"
   vim.cmd.colorscheme(color)

   if color == "gruber-darker" then
      vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#141414" })
      vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "#252525", underline = true })
      vim.api.nvim_set_hl(0, "Visual", { bg = "#2a2a2a", fg = "NONE" })
      vim.api.nvim_set_hl(0, "SpellBad", { bg = "#442222", fg = "NONE" })

      vim.api.nvim_set_hl(0, "Normal", { bg = "#101010" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "#181818" })
   end
end

return {
   {
      "folke/tokyonight.nvim",
      lazy = false,    -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
   },
   {
      "dracula/vim",
   },
   {
      "catppuccin/nvim",
      name = "catppuccin",
   },
   {
      "EdenEast/nightfox.nvim",
   },
   {
      "projekt0n/github-nvim-theme",
   },
   {
      "lifepillar/vim-solarized8",
      name = "solarized8"
   },
   {
      "sainnhe/sonokai",
   },
   {
      "tjdevries/colorbuddy.nvim",
   },
   {
      "ishan9299/nvim-solarized-lua",
   },
   {
      "nyoom-engineering/oxocarbon.nvim",
   },
   {
      "rebelot/kanagawa.nvim",
      name = 'kanagawa',
   },
   {
      "shaunsingh/nord.nvim",
      config = function()
         vim.g.nord_contrast = true
         vim.g.nord_borders = true
         vim.g.nord_disable_background = false
         vim.g.nord_italic = false
         vim.g.nord_uniform_diff_background = true

         -- ColorMyPencils('nord')
      end
   },
   {
      "rose-pine/neovim",
      name = 'rose-pine',
      config = function()
         require('rose-pine').setup({

            --- @usage 'auto'|'main'|'moon'|'dawn'
            variant = 'moon',
            --- @usage 'main'|'moon'|'dawn'
            dark_variant = 'moon',
            enable = {
               terminal = true,
               legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
               migrations = true,        -- Handle deprecated options automatically
            },
            styles = {
               bold = false,
               italic = false,
               transparency = true,
            },
            disable_background = true,
         })

         -- ColorMyPencils('rose-pine')
      end
   },
   {
      "aktersnurra/no-clown-fiesta.nvim",
      name = "no-clown-fiesta",
      config = function()
         local opts = {
            styles = {
               type = { bold = true },
               lsp = { underline = false },
               match_paren = { underline = true },
            },
         }

         local function config()
            local plugin = require "no-clown-fiesta"
            plugin.setup(opts)
            return plugin.load()
         end

         return {
            "aktersnurra/no-clown-fiesta.nvim",
            priority = 1000,
            config = config,
            lazy = false,
         }
      end
   },
   {
      "ramojus/mellifluous.nvim",
      config = function()
         require("mellifluous").setup({
            mellifluous = {
               neutral = true,
            },
            -- colorset = "mellifluous",
            -- neutral = false,
            styles = {
               main_keywords = {
                  bold = false,
                  italic = false,
               },
               comments = {
                  bold = false,
                  italic = false,
               },
            },
            transparent_background = {
               enabled = true,
               telescope = true,
               cursor_line = false,
               status_line = true
            },
         })
         --     -- ColorMyPencils('mellifluous')
      end
   },
   {
      "blazkowolf/gruber-darker.nvim",
      config = function()
         require("gruber-darker").setup({
            bold = false,
            invert = {
               signs = true,
               tabline = true,
               visual = true
            },
            italic = {
               strings = true,
               comments = true,
               operators = false,
               folds = false,
            },
            undercurl = false,
            underline = false,
         })
         -- ColorMyPencils('gruber-darker')
      end
   },
   {
      "zenbones-theme/zenbones.nvim",
      name = "zenbones",
      dependencies = "rktjmp/lush.nvim",
      lazy = false,
      priority = 1000,
      -- config = function()
      --     ColorMyPencils("zenbones")
      -- end
      -- you can set set configuration options here
      -- config = function()
      --     vim.g.zenbones_darken_comments = 45
      --     vim.cmd.colorscheme('zenbones')
      -- end
   },
   { 'p00f/alabaster.nvim' },
   {
      'datsfilipe/vesper.nvim',
      config = function()
         require('vesper').setup({
            transparent = false,  -- Boolean: Sets the background to transparent
            italics = {
               comments = false,  -- Boolean: Italicizes comments
               keywords = false,  -- Boolean: Italicizes keywords
               functions = false, -- Boolean: Italicizes functions
               strings = false,   -- Boolean: Italicizes strings
               variables = false, -- Boolean: Italicizes variables
            },
            overrides = {},       -- A dictionary of group names, can be a function returning a dictionary or a table.
            palette_overrides = {}
         })
      end
   },
}
