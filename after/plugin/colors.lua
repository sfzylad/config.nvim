local THEME = "zenbones"
vim.g.zenbones_darkness = "stark"
vim.g.zenbones_lightness = "dim"
vim.g.zenbones_solid_vert_split = true
vim.g.zenbones_solid_line_nr = true
vim.g.zenbones_solid_float_border = true
vim.g.zenbones_darken_noncurrent_window = true
vim.g.zenbones_lighten_noncurrent_window = true
vim.g.zenbones_lighten_comments = 50
vim.g.zenbones_lighten_line_nr = 40
vim.g.zenbones_lighten_cursor_line = 10

vim.opt.background = "dark"
ColorMyPencils(THEME)

vim.api.nvim_set_hl(0, "SnacksPicker", { bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, "SnacksPickerBorder", { bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, "SnacksPickerInput", { bg = "none", ctermbg = "none" })
