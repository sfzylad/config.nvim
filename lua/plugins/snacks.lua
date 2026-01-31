return {
    {
        "folke/snacks.nvim",
        ---@type snacks.Config
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            animate = { enabled = false },
            bigfile = { enabled = true },
            dashboard = {
                enabled = true,
                width = 60,
                preset = {
                    keys = {
                        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                        { icon = " ", key = "b", desc = "Browse files", action = "<cmd>:Ex<CR>" },
                        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                        { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                        { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                        { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                        { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                    },
                },
            },
            explorer = { enabled = false },
            files = { enabled = true, hidden = true },
            indent = { enabled = true },
            input = { enabled = true },
            picker = {
                enabled = true,
                layout = {
                    cycle = true,
                    preset = "default"
                },
                ui_select = true,
            },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = false },
            scroll = { enabled = false },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        },
        config = function(_, opts)
            require("snacks").setup(opts)

            vim.api.nvim_create_autocmd("ColorScheme", {
                callback = function()
                    local colors = {
                        bg_dark  = "#181818",
                        quartz   = "#95a99f",
                        niagara  = "#303540",
                        wisteria = "#9e95c7",
                    }

                    local hl = {
                        -- vim.api.nvim_set_hl(0, "SnacksPicker", { bg = "none", ctermbg = "none" })
                        -- vim.api.nvim_set_hl(0, "SnacksPickerBorder", { bg = "none", ctermbg = "none" })
                        -- vim.api.nvim_set_hl(0, "SnacksPickerInput", { bg = "none", ctermbg = "none" })

                        SnacksPicker            = { bg = "none", ctermbg = "none" },
                        SnacksPickerBorder      = { bg = "none", ctermbg = "none" },
                        SnacksPickerInput       = { bg = "none", ctermbg = "none" },
                        SnacksPickerTitle       = { fg = colors.wisteria, bg = colors.bg_dark, bold = true },
                        SnacksPickerPromptTitle = { fg = colors.bg_dark, bg = colors.wisteria, bold = true },
                        SnacksPickerMatch       = { fg = "#ffdd33", bold = true },
                        SnacksPickerSelected    = { bg = colors.niagara },
                        -- SnacksPickerSelected    = { bg = "#303540", fg = "#95a99f", bold = true },
                        SnacksPickerIcon        = { fg = "#95a99f" },
                        -- Dashboard specific colors
                        SnacksDashboardHeader   = { fg = colors.wisteria },
                        SnacksDashboardDesc     = { fg = colors.quartz },
                        SnacksDashboardKey      = { fg = "#ffdd33" },
                    }

                    for group, settings in pairs(hl) do
                        vim.api.nvim_set_hl(0, group, settings)
                    end
                end,
            })


            vim.api.nvim_set_hl(0, "SnacksPicker", { bg = "none", ctermbg = "none" })
            vim.api.nvim_set_hl(0, "SnacksPickerBorder", { bg = "none", ctermbg = "none" })
            vim.api.nvim_set_hl(0, "SnacksPickerInput", { bg = "none", ctermbg = "none" })
        end,
        priority = 1000,
        lazy = false,

        keys = {
            { "<C-p>",      function() Snacks.picker.files({ hidden = true }) end, desc = "Find Files" },
            { "gB",         function() Snacks.picker.buffers() end,                desc = "Buffers" },
            { "<leader>fg", function() Snacks.picker.grep() end,                   desc = "Grep" },
            { "<leader>fs", function() Snacks.picker.grep_word() end,              mode = { "n", "v" },   desc = "Grep Selection" },
            { "<leader>fh", function() Snacks.picker.help() end,                   desc = "Help" },
            { "<leader>fd", function() Snacks.picker.diagnostics() end,            desc = "Diagnostics" },
            { "<leader>fr", function() Snacks.picker.resume() end,                 desc = "Resume Picker" },
        },

    }
}
