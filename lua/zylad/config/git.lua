require("gitsigns").setup()

require("vcsigns").setup({
   target_commit = 0, -- Nice default for jj with new+squash flow.
})

local function map(mode, lhs, rhs, desc, opts)
   local options = { noremap = true, silent = true, desc = desc }
   if opts then
      options = vim.tbl_extend("force", options, opts)
   end
   vim.keymap.set(mode, lhs, rhs, options)
end

map("n", "[c", "<Cmd>lua require('vcsigns').actions.hunk_prev(0, vim.v.count1)<CR>", "Go to previous hunk")
map("n", "]c", "<Cmd>lua require('vcsigns').actions.hunk_next(0, vim.v.count1)<CR>", "Go to next hunk")
map("n", "[C", function()
   require("vcsigns").actions.hunk_prev(0, 9999)
end, "Go to first hunk")
map("n", "]C", function()
   require("vcsigns").actions.hunk_next(0, 9999)
end, "Go to last hunk")
map("n", "<leader>su", function()
   require("vcsigns").actions.hunk_undo(0)
end, "Undo the hunk under the cursor")
map("n", "<leader>sd", function()
   require("vcsigns").actions.toggle_hunk_diff(0)
end, "Show diff of hunk under the cursor")
map("n", "<leader>sf", function()
   require("vcsigns.fold").toggle(0)
end, "Fold outside hunks")
