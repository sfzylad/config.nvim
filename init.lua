function R(name)
    require("plenary.reload").reload_module(name)
end

-- require("zylad.packer")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("config.lazy")
require("zylad.set")
require("zylad.plugins")
require("zylad.remap")
