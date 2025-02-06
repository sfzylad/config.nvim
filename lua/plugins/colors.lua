function ColorMyPencils(color)
    color = color or "kanagawa-dragon"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
end

return {
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        -- config = function()
        --   -- load the colorscheme here
        --   vim.cmd([[colorscheme tokyonight]])
        -- end,
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
    },
    {
        "rose-pine/neovim",
        name = 'rose-pine',
        config = function ()
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
            })

            ColorMyPencils('rose-pine')
        end
    }
}
