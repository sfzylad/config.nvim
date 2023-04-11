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
end

return M
