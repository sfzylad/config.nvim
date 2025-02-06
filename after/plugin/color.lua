--require("rose-pine").setup({
--    disable_background = false,
--})

function ColorMyPencils(color)
    color = color or "kanagawa-dragon"
    if color == "rose-pine" then
        require("zylad.config.ui").setup()
    end
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
end

ColorMyPencils('rose-pine-moon')
