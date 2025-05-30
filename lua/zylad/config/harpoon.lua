-----------------------------------------------------------------------------
-- harpoon
-----------------------------------------------------------------------------
local harpoon = require("harpoon")
local harpoon_extensions = require("harpoon.extensions")

-- REQUIRED
harpoon:setup()
harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
-- REQUIRED

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<M-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<M-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<M-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<M-4>", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<M-5>", function() harpoon:list():select(5) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end)
