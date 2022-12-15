local M = {}

function M.setup()
  require("bufferline").setup {
    options = {
      numbers = "none",
      diagnostics = "nvim_lsp",
      separator_style = "thick",
      show_tab_indicators = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      left_mouse_command = "buffer %d",
      right_mouse_command = "bdelete! %d",
      always_show_bufferline = false,
    },
  }
end

return M
