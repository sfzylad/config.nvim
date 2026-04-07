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
            win = {
               list = {
                  wo = {
                     winhighlight = "Normal:SnacksPicker,FloatBorder:SnacksPickerBorder",
                     winblend = 0,
                  },
               },
            },
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
