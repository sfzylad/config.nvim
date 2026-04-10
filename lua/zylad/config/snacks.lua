require("snacks").setup({
   animate = { enabled = false },
   bigfile = { enabled = true },
   dashboard = {
      enabled = false,
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
})

vim.keymap.set("n", "<C-p>", function()
   Snacks.picker.files({ hidden = true })
end, { desc = "File picker" })

vim.keymap.set("n", "gB", function()
   Snacks.picker.buffers()
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>fg", function()
   Snacks.picker.grep()
end, { desc = "Grep" })

vim.keymap.set("n", "<leader>fh", function()
   Snacks.picker.help()
end, { desc = "Help" })

vim.keymap.set("n", "<leader>fr", function()
   Snacks.picker.resume()
end, { desc = "Last search" })

vim.keymap.set("n", "<leader>fd", function()
   Snacks.picker.diagnostics()
end, { desc = "Diagnostics" })
