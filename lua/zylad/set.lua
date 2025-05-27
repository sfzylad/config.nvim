---@diagnostic disable: inject-field
-------------------
-- NeoVim config --
-------------------
vim.cmd([[
let g:vim_home_path = "~/.vim"
let g:indent_blankline_use_treesitter=v:true
]])

-- Disable coma to use it as leader.
-- keymap("", ",", "<Nop>", opts)
-- This is setup in the main init.lua file now.
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- vim.o.cursorcolumn = true
vim.o.colorcolumn = "80"

-- Windows.nvim
vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = false

vim.api.nvim_command("au FileType go nmap <Leader><Leader>r :GoTestFunc")


vim.o.encoding = 'utf-8'

vim.o.number = true
vim.o.relativenumber = true
-- vim.o.iskeyword = ',:,@,48-57,_,192-255'

vim.o.listchars = "tab:› ,eol:¬,trail:⋅" --- Set the characters for the invisibles
vim.o.list = false--- show white chars

vim.o.ruler = true
-- vim.o.t_Co = 256 -- use 256 colors
vim.o.showmatch = true -- highlight search
vim.o.showmode = true -- show the current mode on the opened buffer
vim.o.splitbelow = true -- split shows up below by default
vim.o.splitright = true -- split shows on the right by default
vim.o.visualbell = true -- use a visual bell
-- Customize session options. Namely, I don't want to save hidden and
-- unloaded buffers or empty windows.
vim.o.sessionoptions = "curdir,folds,help,options,tabpages,winsize"

vim.g.fugitive_git_executable = '/usr/bin/git'

vim.g.rustfmt_autosave = 1

-- vim.cmd([[
-- if exists('+termguicolors')
--   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
--   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
--   set termguicolors
-- endif
-- ]])

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

vim.o.smartindent = true
vim.o.wrap = false

-- Tab completions
vim.o.wildmode = "list:longest" -- Wildcard matches show a list, longest matched first
vim.o.wildignore = vim.o.wildignore .. ".git,.hg,.svn" -- ignore vcs
vim.o.wildignore = vim.o.wildignore .. ".6" -- ignore Go compiled files
vim.o.wildignore = vim.o.wildignore .. "*.pyc" -- ignore Python compiled files
vim.o.wildignore = vim.o.wildignore .. "*.swp" -- ignore vim backups

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
endif
]])



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

-- Run gofmt + goimport on save
-- vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

vim.api.nvim_exec2([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], {output = false})


vim.o.mouse = "a"

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

--- preserve paster register
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.g.netrw_banner = 1

vim.cmd([[
let g:python_host_prog = '/Users/dzyla/.pyenv/versions/neovim/bin/python'
let g:python3_host_prog = '/Users/dzyla/.pyenv/versions/neovim/bin/python'
]])

vim.api.nvim_create_autocmd({"Bufread"}, {
    pattern = {"*.sls"},
    command = "setlocal ts=2 sts=2 sw=2 expandtab"
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.md"},
    command = "set wm=2 tw=79"
})
