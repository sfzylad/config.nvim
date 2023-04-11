local M = {}

function M.setup()
    require("alpha").setup(
        require'alpha.themes.theta'.config
    )
end

return M
