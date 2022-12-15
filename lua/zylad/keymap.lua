local M = {}

local function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

local function unbind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.del(op, lhs, opts)
    end
end

M.nmap = bind('n', {noremap = true})
M.map = bind({'n', 'v', 's', 'o'}, {noremap = true})
M.nnoremap = bind('n')
M.vnoremap = bind('v')
M.xnoremap = bind('x')
M.inoremap = bind('i', {noremap=true, silent=false})

M.iunmap = unbind('i', {noremap = true})
M.nunmap = unbind('n', {noremap = true})

return M
