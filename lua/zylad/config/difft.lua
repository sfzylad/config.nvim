require("difft").setup({
   -- command = "GIT_EXTERNAL_DIFF='difft --color=always' git diff", -- or "jj diff --no-pager"
   command = "jj diff --no-pager", -- or "jj diff --no-pager"
   layout = "ivy_taller", -- nil (buffer), "float", or "ivy_taller"
   header = {
      content = function(filename, step, language)
         if step then
            return string.format("[%d/%d] %s (%s)", step.current, step.of, filename, language)
         end
         return string.format("%s (%s)", filename, language)
      end,
      highlight = {
         link = "FloatTitle",
         full_width = true,
      },
   },
})

vim.keymap.set("n", "<leader>gd", function()
   if Difft.is_visible() then
      Difft.hide()
   else
      Difft.diff()
   end
end, { desc = "Toggle Difft" })
