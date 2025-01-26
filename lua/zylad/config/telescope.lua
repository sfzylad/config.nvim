----------------------------------------------------------------------------
-- Telescope setup
----------------------------------------------------------------------------
local M = {}

function M.setup()
    local action_layout = require "telescope.actions.layout"
  require('telescope').setup{
    extensions = {
        file_browser = {
            hidden = false,
            respect_gitignore = false,
            hide_parent_dir = false,
            hijack_netrw = false,
            git_status = true,
            theme = "ivy",
            layout_config = {
              height = 50,
              width = 50,
              preview_cutoff = 10,
            },
        },
        git_worktrees = {
            theme = "ivy",
        }
    },
      pickers = {
        find_files = {
            theme = "ivy",
        },
        diagnostics = {
            theme = "ivy",
        },
        help_tags = {
            theme = "ivy",
        },
        git_files = {
            theme = "ivy",
        },
        git_commits = {
            theme = "ivy",
        },
        live_grep = {
            theme = "ivy",
        },
        buffers = {
            theme = "ivy",
        },
      },
    defaults = {
      -- layout_strategy = "vertical",
      -- layout_config = {
      --     vertical = {
      --       height = 0.9,
      --       width = 0.8,
      --       prompt_position = "bottom",
      --       preview_cutoff = 40,
      --     },
      --     prompt_position = "bottom",
      --     height = 0.9,
      --     -- preview_height = 0.5,
      -- },
      -- Default configuration for telescope goes here:
      -- config_key = value,
      mappings = {
        n = {
      	  ['<c-d>'] = require('telescope.actions').delete_buffer,
          ["<M-p>"] = action_layout.toggle_preview,
        }, -- n
        i = {
          ["<C-h>"] = "which_key",
          ['<c-d>'] = require('telescope.actions').delete_buffer
        } -- i
      } -- mappings
    }, -- defaults
  } -- telescope setup
  require("telescope").load_extension "file_browser"

  local theme_opts = {
      layout_config = {
        height = 50,
        width = 50,
        preview_cutoff = 10,
      },
  }
  local builtin = require('telescope.builtin')
  local themes = require('telescope.themes')


  -- vim.keymap.set('n', '<leader>fB', '<Cmd>Telescope buffers<CR>')
  vim.keymap.set('n', 'gB', function()
    builtin.buffers(themes.get_ivy(theme_opts))
  end, {expr = false})
  -- vim.keymap.set('n', '<leader>fB', function()
  --   builtin.buffers(themes.get_ivy(theme_opts))
  -- end, {expr = false})


  -- vim.keymap.set('n', '<C-p>', '<Cmd>lua Telescope find_files<CR>')
  vim.keymap.set('n', '<C-p>', function()
    builtin.find_files(themes.get_ivy(theme_opts))
  end, {expr = false})

  vim.keymap.set('n', '<leader>fg', function()
    builtin.live_grep(themes.get_ivy(theme_opts))
  end, {expr = false})

  vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({themes.get_ivy(theme_opts), search = vim.fn.input("Grep > ") })
  end, {expr = false})

  vim.keymap.set('n', '<leader>fh', function()
    builtin.help_tags(themes.get_ivy(theme_opts))
  end, {expr = false})

  vim.keymap.set('n', '<leader>fo', function()
    builtin.oldfiles(themes.get_ivy(theme_opts))
  end, {expr = false})

  vim.keymap.set('n', '<leader>fd', function()
    builtin.diagnostics(themes.get_ivy(theme_opts))
  end, {expr = false})

  vim.keymap.set('n', '<leader>gl', function()
    require('telescope').extensions.git_worktree.git_worktrees(theme_opts)
  end, {expr = false})

  vim.keymap.set('n', '<leader>fr', '<Cmd>Telescope resume<CR>')
end

return M
