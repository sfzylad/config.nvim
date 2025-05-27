local M = {}

local icons = require "zylad.icons"
local lualine = require "lualine"
local colors = require "zylad.colors"
local winbar = require("zylad.winbar")


local function separator()
  return "%="
end

local function tab_stop()
  return icons.ui.Tab .. " " .. vim.bo.shiftwidth
end

local function show_macro_recording()
  local rec_reg = vim.fn.reg_recording()
  if rec_reg == "" then
    return ""
  else
    return "recording @" .. rec_reg
  end
end

local config = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      -- component_separators = { left = '', right = ''},
      -- section_separators = { left = '', right = ''},

      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},

      -- component_separators = '|',
      -- section_separators = { left = '', right = '' },


      disabled_filetypes = {
        statusline = {},
        winbar = {
            "help",
            "startify",
            "dashboard",
            "packer",
            "neogitstatus",
            "NvimTree",
            "Trouble",
            "alpha",
            "lir",
            "Outline",
            "spectre_panel",
            "toggleterm",
            "dap-repl",
            "dapui_console",
            "dapui_watches",
            "dapui_stacks",
            "dapui_breakpoints",
            "dapui_scopes",
        },
      },
      ignore_focus = {},
      always_divide_middle = true,
      always_show_tabline = true,
      globalstatus = false,
      refresh = {
        statusline = 100,
        tabline = 100,
        winbar = 100,
      }
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch'},
      lualine_c = {'filename', 'diff', {'diagnostics', update_in_insert = false,  source = {'nvim_diagnostic'}},
    },
      lualine_x = {"lsp_progress", "vim.fn['zoom#statusline']()", 'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },

    inactive_sections = {
      -- lualine_a = {'mode'},
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      -- lualine_z = {'filetype'},
      lualine_z = {},
    },
    tabline = {
      lualine_a = {'buffers'},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {'tabs'},
    },
    extensions = { "nvim-tree", "toggleterm", "quickfix" },
}

function M.setup()
  lualine.setup(config)
end


return M
