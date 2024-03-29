local M = {}

local colors = require "zylad.colors"
local navic = require "nvim-navic"
local utils = require "zylad.utils"
local icons = require "zylad.icons"

vim.api.nvim_set_hl(0, "WinBarSeparator", { fg = colors.grey })
vim.api.nvim_set_hl(0, "WinBarFilename", { fg = colors.green, bg = colors.grey })
vim.api.nvim_set_hl(0, "WinBarContext", { fg = colors.green, bg = colors.grey })

M.winbar_filetype_exclude = {
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
}


local excludes = function()
  if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
    vim.opt_local.winbar = nil
    return true
  end
  return false
end

local function get_modified()
  local file_name = vim.fn.expand "%:t"
  local extension = vim.fn.expand "%:e"

  if file_name then
    local file_icon, file_icon_color =
      require("nvim-web-devicons").get_icon_color(file_name, extension, { default = true })
    local hl_group = "FileIconColor" .. extension
    vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })
    if not file_icon then
      file_icon = icons.winbar.FileIcon
    end

    if utils.get_buf_option "mod" then
      local mod = icons.git.Mod
      return mod .. " " .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. file_name
    end
    return "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. file_name
  end
end

local function get_location()
  local location = navic.get_location()
  if not utils.is_empty(location) then
    return " " .. icons.ui.ChevronRight .. " " .. location
  end
  return ""
end

local function get_relative_line_num(ctx_node_line_num)
  local cursor_line_num = vim.fn.line "."
  local num_folded_lines = 0

  -- Find all folds between the context node and the cursor
  local current_line = ctx_node_line_num
  while current_line < cursor_line_num do
    local fold_end = vim.fn.foldclosedend(current_line)
    if fold_end == -1 then
      current_line = current_line + 1
    else
      num_folded_lines = num_folded_lines + fold_end - current_line
      current_line = fold_end + 1
    end
  end
  return cursor_line_num - ctx_node_line_num - num_folded_lines
end

local function get_custom_location()
  local data = navic.get_data() or {}
  local context = {}
  for _, d in ipairs(data) do
    local line_num = d.scope["start"].line
    if vim.o.relativenumber then
      line_num = get_relative_line_num(line_num)
    end
    table.insert(context, d.icon .. d.name .. "[" .. line_num .. "]")
  end
  if vim.tbl_count(context) > 0 then
    return " " .. icons.ui.ChevronRight .. " " .. table.concat(context, " " .. icons.ui.ChevronRight .. " ")
  end
  return ""
end

function M.get_winbar()
  if navic.is_available() then
    -- return get_modified() .. get_location()
    return get_modified() .. get_custom_location()
  else
    return get_modified()
  end
end


-- function M.get_winbar()
--   if excludes() then
--     return ""
--   end
--   if navic.is_available() then
--     return "%#WinBarSeparator#"
--       .. "%="
--       .. ""
--       .. "%*"
--       .. get_modified()
--       .. get_location()
--       .. "%#WinBarSeparator#"
--       .. ""
--       .. "%*"
--   else
--     return "%#WinBarSeparator#" .. "%=" .. "" .. "%*" .. get_modified() .. "%#WinBarSeparator#" .. "" .. "%*"
--   end
-- end

return M
