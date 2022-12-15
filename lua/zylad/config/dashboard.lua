local M = {}

function M.setup()
    require("alpha").setup(
        require'alpha.themes.startify'.config
    )
end

return M
