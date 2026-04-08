-- Theme to be used. Themes that I liked so far: alabaster, vesper,
-- zenbones (neobones variant), mellifluous, kanagawa (dragon variant), rose-pine
local THEME = require("zylad.config.theme").current()

if THEME == "zenbones" then
   require("zylad.config.zenbones")
end

-- Whether or not to make any changes to the default highlights that are coming
-- with the theme. Better not to sat it.
local CUSTOM_HIGHLIGHTS = false

-- Display borders in floating windoes when using alabaster theme.
vim.g.alabaster_floatborder = true

-- By default I want dard background.
vim.opt.background = "dark"

-- This function sets the theme.
ColorMyPencils(THEME)

-- Default DiffText highlights in vesper theme are really bad, so I overwrite them.
if THEME == "vesper" then
   vim.api.nvim_set_hl(0, "DiffText", { fg = "NvimLightGreen" })
end

if CUSTOM_HIGHLIGHTS then
   vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#192830" })

   vim.api.nvim_set_hl(0, "SnacksPicker", { bg = "#1C1C1C" })
   vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = "#B2B2B2", bg = "#1C1C1C" })
   vim.api.nvim_set_hl(0, "SnacksPickerInput", { bg = "#262626" })
end
