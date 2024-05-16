--require("rose-pine").setup({
--    disable_background = false,
--})

function ColorMyPencils(color)
    color = color or "kanagawa-dragon"
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    require("zylad.config.ui").setup()
end

ColorMyPencils('kanagawa-dragon')
