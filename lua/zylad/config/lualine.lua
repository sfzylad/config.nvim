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

      component_separators = {},
      section_separators = {},

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
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', {'diagnostics', source = {'nvim_lsp'}}},
      lualine_c = {'filename'},
      -- lualine_c = { 'filename',
      --     { navic.get_location, cond = navic.is_available },
      -- },
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },

    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {'filetype'},
    },
    -- tabline = {
    --   lualine_a = {'buffers'},
    --   lualine_z = {'tabs'}
    --
    -- },
    -- tabline = {},
    -- winbar = {
    --     lualine_a = {
    --         {
    --             "diagnostics",
    --             sources = { "nvim_diagnostic" },
    --             diagnostics_color = {
    --                 error = "DiagnosticError",
    --                 warn = "DiagnosticWarn",
    --                 info = "DiagnosticInfo",
    --                 hint = "DiagnosticHint",
    --             },
    --             colored = true,
    --         },
    --     },
    --     lualine_c = {},
    --     lualine_x = {
    --         {
    --             winbar.get_winbar,
    --             color = { fg = colors.violet, gui = "bold" },
    --         },
    --     },
    --     lualine_y = {},
    --     lualine_z = {},
    -- },
    -- inactive_winbar = {
    --     lualine_a = {},
    --     lualine_b = {},
    --     lualine_c = {},
    --     lualine_x = {
    --         {
    --             winbar.get_winbar,
    --             color = { fg = colors.green, gui = "bold" },
    --         },
    --     },
    --     lualine_y = {},
    --     lualine_z = {},
    -- },
    -- extensions = {}
    extensions = { "nvim-tree", "toggleterm", "quickfix" },
}

function M.setup()
  lualine.setup(config)
end


return M
