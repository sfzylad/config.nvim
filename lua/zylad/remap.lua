vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>c", "<>terminal<cr>")


-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- remove current file from buffer
keymap('n', '<leader>d', '<Cmd>bd<CR>', opts)
keymap('n', '<leader>/', '<Nop>', opts)
keymap('n', '<leader>/', '<Cmd>nohlsearch<CR>', opts)

keymap('n', '<C-t>', '<Cmd>tabnew<CR>', opts)
keymap('n', '<C-t>p', '<Cmd>tabprevious<CR>', opts)
keymap('n', '<C-t>n', '<Cmd>tabnext<CR>', opts)

keymap('n', '<leader>s', '<cmd>:set spell!<CR>', opts)

-- keymap('n', '<leader>dd', "<cmd>lua ColorMyPencils('rose-pine-moon')<CR>", opts)
-- keymap('n', '<leader>dd', "<cmd>lua ColorMyPencils('nord')<CR>", opts)
-- keymap('n', '<leader>dl', "<cmd>lua ColorMyPencils('github_light')<CR>", opts)
-- keymap('n', '<leader>dl', "<cmd>lua ColorMyPencils('rose-pine-dawn')<CR>", opts)

keymap('n', '<leader>dd', "<cmd>set background=dark<CR>", opts)
keymap('n', '<leader>dl', "<cmd>set background=light<CR>", opts)

keymap('n', '<leader>ev', '<cmd>:e $MYVIMRC<CR>', opts)

local nnoremap = require('zylad.keymap').nnoremap

nnoremap('<leader>cd', '<Cmd>:cd %:h<CR>')
nnoremap('<leader>lcd', '<Cmd>:lcd %:h<CR>')
nnoremap('<BS>', '<C-W>h')

local map = require("zylad.keymap").map
map('j', 'gj')
map('k', 'gk')

vim.cmd([[
map <leader>y "+y
map <leader>p "+p
]])

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*.py" },
    callback = function(ev)
        vim.lsp.buf.format()
    end
})
