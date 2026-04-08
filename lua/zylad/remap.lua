vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>c", "<>terminal<cr>")

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local function light_theme()
   local THEME = require('zylad.config.theme').current()
   ColorMyPencils(THEME)
   vim.opt.background = "light"
end

local function dark_theme()
   local THEME = require('zylad.config.theme').current()
   vim.opt.background = "dark"
   ColorMyPencils(THEME)
end

-- cycling between dark and light themes.
vim.keymap.set('n', '<leader>dd', dark_theme, { desc = "Change theme to dark" })
vim.keymap.set('n', '<leader>dl', light_theme, { desc = "Change theme to light" })

-- remove current file from buffer
keymap('n', '<leader>d', '<Cmd>bd<CR>', opts)

-- reset the search hightlight
keymap('n', '<leader>/', '<Nop>', opts)
keymap('n', '<leader>/', '<Cmd>nohlsearch<CR>', opts)

-- tab specific mappings
keymap('n', '<C-t>', '<Cmd>tabnew<CR>', opts)
keymap('n', '<C-t>p', '<Cmd>tabprevious<CR>', opts)
keymap('n', '<C-t>n', '<Cmd>tabnext<CR>', opts)

-- toggle spelling
keymap('n', '<leader>s', '<cmd>:set spell!<CR>', opts)

-- edit configuration
keymap('n', '<leader>ev', '<cmd>:e $MYVIMRC<CR>', opts)

local map = require("zylad.keymap").map
map('j', 'gj')
map('k', 'gk')

-- yank to system clipboard
vim.cmd([[
map <leader>y "+y
map <leader>p "+p
]])

-- FIXME: This is probably not needed.
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
   pattern = { "*.py" },
   callback = function(_)
      vim.lsp.buf.format()
   end
})
