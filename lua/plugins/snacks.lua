return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
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
            },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = false },
            scroll = { enabled = false },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        },

        vim.keymap.set('n', '<C-p>', function()
            Snacks.picker.files({ hidden = true })
        end, { expr = false }),

        vim.keymap.set('n', 'gB', function()
            Snacks.picker.buffers()
        end, { expr = false }),

        vim.keymap.set('n', '<leader>fg', function()
            Snacks.picker.grep()
        end, { expr = false }),
        vim.keymap.set({ 'n', 'v' }, '<leader>fs', function()
            Snacks.picker.grep_word()
        end, { expr = false }),

        vim.keymap.set('n', '<leader>fh', function()
            Snacks.picker.help()
        end, { expr = false }),

        vim.keymap.set('n', '<leader>fd', function()
            Snacks.picker.diagnostics()
        end, { expr = false }),

        vim.keymap.set('n', '<leader>fD', function()
            Snacks.picker.diagnostics_buffer()
        end, { expr = false }),

        vim.keymap.set('n', '<leader>fr', function()
            Snacks.picker.resume()
        end, { expr = false }),
    }
}
