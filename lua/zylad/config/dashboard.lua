local M = {}

function M.setup()
    local startify = require'alpha.themes.startify'
    startify.section.mru.val = { { type = "padding", val = 0 } }

    local theta =  require'alpha.themes.theta'.config

    local dashboard = require'alpha.themes.dashboard'
    dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", "<cmd>ene <CR>"),
        dashboard.button("SPC g l", "  Open Git Workspace"),
        dashboard.button("SPC f o", "  Recently opened files"),
        dashboard.button("SPC f g", "  Find word"),
        dashboard.button("spc h t", "  jump to bookmarks"),
        dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
    }
    require("alpha").setup(
        dashboard.config

        -- startify.config
        -- require'alpha.themes.theta'.config
        -- require'alpha.themes.startify'.config,
    )
end

return M
