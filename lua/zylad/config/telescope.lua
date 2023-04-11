----------------------------------------------------------------------------
-- Telescope setup
----------------------------------------------------------------------------
local M = {}

function M.setup()
  require('telescope').setup{
    extensions = {
        file_browser = {
            hidden = false,
            respect_gitignore = false,
            hide_parent_dir = false,
            hijack_netrw = true,
            git_status = true,
        },
    },
    defaults = {
      extensions = {
          file_browser = {
              hijack_netrw = true,
          },
      },
      -- Default configuration for telescope goes here:
      -- config_key = value,
      mappings = {
        n = {
      	  ['<c-d>'] = require('telescope.actions').delete_buffer,
        }, -- n
        i = {
          ["<C-h>"] = "which_key",
          ['<c-d>'] = require('telescope.actions').delete_buffer
        } -- i
      } -- mappings
    }, -- defaults
  } -- telescope setup
  require("telescope").load_extension "file_browser"

  vim.keymap.set('n', '<C-b>', '<Cmd>Telescope buffers<CR>')
  vim.keymap.set('n', '<C-p>', '<Cmd>Telescope find_files<CR>')
end

return M
