-----------------------------------------------------------------------------
-- harpoon
-----------------------------------------------------------------------------
local M = {}

function M.setup()
  require("harpoon").setup({
      global_settings = {
          -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
          tmux_autoclose_windows = false,
          -- filetypes that you want to prevent from adding to the harpoon list menu.
          excluded_filetypes = { "harpoon" },
          tmux_send_commands = true,
        },
  })

  vim.keymap.set('n', '<leader>ht', '<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>')
  vim.keymap.set('n', '<leader>hm', '<Cmd>lua require("harpoon.mark").add_file()<CR>')
  vim.keymap.set('n', '<leader>hn', '<Cmd>lua require("harpoon.ui").nav_next()<CR>')
  vim.keymap.set('n', '<leader>hp', '<Cmd>lua require("harpoon.ui").nav_prev()<CR>')
  vim.keymap.set('n', '<leader>hr', '<Cmd>lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>')

  local mark = require("harpoon.mark")
  local ui = require("harpoon.ui")

  vim.keymap.set("n", "<leader>a", mark.add_file)
  vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

  vim.keymap.set("n", "<M-1>", function() ui.nav_file(1) end)
  vim.keymap.set("n", "<M-2>", function() ui.nav_file(2) end)
  vim.keymap.set("n", "<M-3>", function() ui.nav_file(3) end)
  vim.keymap.set("n", "<M-4>", function() ui.nav_file(4) end)
  vim.keymap.set("n", "<M-5>", function() ui.nav_file(5) end)

end

return M
