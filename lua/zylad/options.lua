-------------------
-- NeoVim config --
-------------------
local nnoremap = require('zylad.keymap').nnoremap
local map = require("zylad.keymap").map

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

vim.cmd([[
let g:vim_home_path = "~/.vim"
let g:indent_blankline_use_treesitter=v:true
]])

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- Disable coma to use it as leader.
-- keymap("", ",", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


vim.cmd([[
set colorcolumn=80
]])
-- vim.o.cursorcolumn = true
vim.o.colorcolumn = "80"

-- Windows.nvim
vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = false

vim.api.nvim_command("au FileType go nmap <Leader><Leader>r :GoTestFunc")

-- vim.o.smartindent = true

vim.o.encoding = 'utf-8'
vim.o.relativenumber = true
-- vim.o.iskeyword = ',:,@,48-57,_,192-255'
vim.o.listchars = "tab:› ,eol:¬,trail:⋅" --- Set the characters for the invisibles
vim.o.list = true --- show white chars
vim.o.number = true
vim.o.ruler = true
vim.o.t_Co = 256 -- use 256 colors
-- vim.o.scrolloff = 999 -- keep the cursor centered on the screen_w
vim.o.showmatch = true -- highlight search
vim.o.showmode = true -- show the current mode on the opened buffer
vim.o.splitbelow = true -- split shows up below by default
vim.o.splitright = true -- split shows on the right by default
vim.o.visualbell = true -- use a visual bell
-- Customize session options. Namely, I don't want to save hidden and
-- unloaded buffers or empty windows.
vim.o.sessionoptions = "curdir,folds,help,options,tabpages,winsize"

-- vim.o.completeopt = "menu,menuone,noselect"

vim.g.fugitive_git_executable = '/usr/local/bin/git'

vim.o.termguicolors = true

vim.cmd([[
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
]])

vim.cmd([[
if has("autocmd")
    filetype plugin indent on
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
endif " has("autocmd")
]])

vim.cmd("syntax on")
-- vim.cmd("colorscheme tokyonight")
-- vim.cmd("colorscheme duskfox")
-- vim.cmd("colorscheme nightfox")
-- vim.cmd("colorscheme catppuccin")
-- vim.cmd("colorscheme solarized")
-- vim.cmd("colorscheme catppuccin-macchiato")
--
-- vim.cmd("colorscheme github_dark")

vim.cmd("colorscheme rose-pine")
vim.o.termguicolors = true -- for modern terminals - force 24bit colors

vim.cmd([[
" Backup settings
execute "set directory=" . g:vim_home_path . "/swap"
execute "set backupdir=" . g:vim_home_path . "/backup"
execute "set undodir=" . g:vim_home_path . "/undo"
]])
vim.o.backup = true
vim.o.undofile = true
vim.o.writebackup = true

-- Search settings
vim.o.hlsearch = true -- highlight results
vim.o.ignorecase = true -- ignores casing of searches
vim.o.incsearch = true -- start showing results while typing
vim.o.smartcase = true

-- Tab settings
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Tab completions
vim.o.wildmode = "list:longest" -- Wildcard matches show a list, longest matched first
vim.o.wildignore = vim.o.wildignore .. ".git,.hg,.svn" -- ignore vcs
vim.o.wildignore = vim.o.wildignore .. ".6" -- ignore Go compiled files
vim.o.wildignore = vim.o.wildignore .. "*.pyc" -- ignore Python compiled files
vim.o.wildignore = vim.o.wildignore .. "*.swp" -- ignore vim backups

-- keymap('i', 'jj', '<Nop>', opts)
-- keymap('i', 'jJ', '<Nop>', opts)
-- keymap('i', 'Jj', '<Nop>', opts)
-- keymap('i', 'JJ', '<Nop>', opts)
-- keymap('i', 'jk', '<Nop>', opts)
-- keymap('i', 'jK', '<Nop>', opts)
-- keymap('i', 'Jk', '<Nop>', opts)
-- keymap('i', 'JK', '<Nop>', opts)

vim.cmd([[
" Terminal mode
if has("nvim")
    tnoremap <esc> <C-\><C-n>
    tnoremap jj <C-\><C-n>
    tnoremap jJ <C-\><C-n>
    tnoremap Jj <C-\><C-n>
    tnoremap JJ <C-\><C-n>
    tnoremap jk <C-\><C-n>
    tnoremap jK <C-\><C-n>
    tnoremap Jk <C-\><C-n>
    tnoremap JK <C-\><C-n>
    nnoremap <Leader>c :terminal <CR>
endif
]])

map('j', 'gj')
map('k', 'gk')

nnoremap('<leader>cd', '<Cmd>:cd %:h<CR>')
nnoremap('<leader>lcd', '<Cmd>:lcd %:h<CR>')
nnoremap('<BS>', '<C-W>h')

-- remove current file from buffer
keymap('n', '<leader>d', '<Cmd>bd<CR>', opts)
keymap('n', '<leader>/', '<Nop>', opts)
keymap('n', '<leader>/', '<Cmd>nohlsearch<CR>', opts)

keymap('n', '<C-t>', '<Cmd>tabnew<CR>', opts)
keymap('n', '<C-t>p', '<Cmd>tabprevious<CR>', opts)
keymap('n', '<C-t>n', '<Cmd>tabnext<CR>', opts)

vim.cmd([[
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWinEnter * set foldlevel=999999
]])

-- spell checking
vim.cmd([[
set spelllang=en_gb

autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.asciidoc setlocal spell
autocmd FileType gitcommit setlocal spell
]])

keymap('n', '<leader>s', '<cmd>:set spell!<CR>', opts)

-- cursor settings
vim.o.cursorline = true


vim.g.indent_blankline_context_patterns = {
  'class',
  'function',
  'method',
  '^if',
  '^while',
  '^typedef',
  '^for',
  '^object',
  '^table',
  'block',
  'arguments',
  'typedef',
  'while',
  '^public',
  'return',
  'if_statement',
  'else_clause',
  'jsx_element',
  'jsx_self_closing_element',
  'try_statement',
  'catch_clause',
  'import_statement',
  'labeled_statement'
}

-- keymap('n', '<leader>dd', '<cmd>colorscheme tokyonight<CR>', opts)
-- keymap('n', '<leader>dl', '<cmd>colorscheme tokyonight-day<CR>', opts)

-- keymap('n', '<leader>dd', '<cmd>colorscheme duskfox<CR>', opts)
-- keymap('n', '<leader>dl', '<cmd>colorscheme dawnfox<CR>', opts)

-- keymap('n', '<leader>dd', '<cmd>colorscheme nightfox<CR>', opts)
-- keymap('n', '<leader>dl', '<cmd>colorscheme dayfox<CR>', opts)

-- keymap('n', '<leader>dd', '<cmd>colorscheme github_dark<CR>', opts)
-- keymap('n', '<leader>dl', '<cmd>colorscheme github_light<CR>', opts)

keymap('n', '<leader>dd', '<cmd>set background=dark<CR>', opts)
keymap('n', '<leader>dl', '<cmd>set background=light<CR>', opts)

vim.cmd([[
map <leader>y "+y
map <leader>p "+p
]])

-- Run gofmt + goimport on save
-- vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
vim.api.nvim_exec2([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], {output = false})

-- keymap('n', '<leader>gl', "<cmd>:lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", opts)
keymap('n', '<leader>gn', "<cmd>:lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", opts)

vim.o.mouse = ""

-- on hover diagnostics
-- vim.o.updatetime = 250
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
vim.diagnostic.config({
    float = {
        source = "always",
        show_header = true,
        border = "rounded",
        focusable = true,
    },
    enabled = true,
})

vim.api.nvim_set_keymap(
   "n",
   "<leader>fb",
   "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
   {noremap = true}
)

-- local opt = vim.opt
-- opt.winbar = "%{%v:lua.require'zylad.winbar'.get_winbar()%}"


keymap('n', '<leader>ev', '<cmd>:e $MYVIMRC<CR>', opts)

vim.api.nvim_create_user_command('Rg', function(cmd_opts)
    require('zylad.utils.rg').rg(cmd_opts.args)
    vim.cmd("copen 15")
end, {nargs = '*'})


vim.o.updatetime = 750

-- fat cursor on insert
vim.o.guicursor = ""

-- don't scroll to the top or bottom
vim.o.scrolloff = 8
-- vim.o.scrolloff = 999 -- keep the cursor centered on the screen_w
