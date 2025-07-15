return {
    inlay_hints = { enabled = true },
    inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = false,
    },

    settings = {
        pylsp = {
            -- Using Ruff's import organizer
            plugins = {
                -- ruff = {
                --     enabled = true,
                --     executable = "/opt/homebrew/bin/ruff",
                --     formatEnabled = true,
                --     lineLength = 80,
                -- },
                -- formatter options
                black = { enabled = false, executable = "black" },
                autopep8 = { enabled = false },
                yapf = { enabled = false },
                -- formatter options
                pylint = { enabled = false, executable = "pylint" },
                pyflakes = { enabled = false },
                pycodestyle = { enabled = false },
                -- -- type checker
                pylsp_mypy = { enabled = false },
                -- -- import sorting
                pyls_isort = { enabled = false },
                -- other stuff
                ignore = { 'E111', 'E114' },
                maxLineLength = 80,
            },
        },
        python = {
            analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                ignore = { '*' },
            },
        },
    },
}
