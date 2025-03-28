local M = {}

function M.setup()
  require('rose-pine').setup({
    --- @usage 'auto'|'main'|'moon'|'dawn'
    variant = 'moon',
    --- @usage 'main'|'moon'|'dawn'
    dark_variant = 'moon',
    enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options automatically
    },
    styles = {
        bold = false,
        italic = false,
        transparency = true,
    },
    disable_background = true,

    --- @usage string hex value or named color from rosepinetheme.com/palette
    groups = {
      background = 'base',
      background_nc = '_experimental_nc',
      panel = 'surface',
      panel_nc = 'base',
      border = 'highlight_med',
      comment = 'muted',
      link = 'iris',
      punctuation = 'subtle',

      error = 'love',
      hint = 'iris',
      info = 'foam',
      warn = 'gold',

      -- headings = {
      --   h1 = 'iris',
      --   h2 = 'foam',
      --   h3 = 'rose',
      --   h4 = 'gold',
      --   h5 = 'pine',
      --   h6 = 'foam',
      -- }
      -- or set all headings at once
      headings = 'subtle',
    },

    -- Change specific vim highlight groups
    -- https://github.com/rose-pine/neovim/wiki/Recipes
    highlight_groups = {
      -- ColorColumn = { bg = 'rose' },

      -- Blend colours against the "base" background
      CursorLine = { bg = 'foam', blend = 10 },
      StatusLine = { fg = 'love', bg = 'love', blend = 10 },
    }
  })

  for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
  end
end

return M
