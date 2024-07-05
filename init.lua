function R(name)
    require("plenary.reload").reload_module(name)
end

-- require("zylad.packer")
require("config.lazy")
require("zylad.set")
require("zylad.plugins")
require("zylad.remap")
