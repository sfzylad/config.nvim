return {
    cmd = { "gopls" },
    filetypes = { "go", "gotempl", "gowork", "gomod" },
    -- root_markers = { { 'go.mod', 'go.sum' }, '.git' },
    root_markers = { ".git", "go.mod", "go.work", '.git' },
    -- inlay_hints = { enabled = true },
    capabilities = {
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true,
                },
            },
        },
    },
    -- on_attach = on_attach,
    -- handlers = handlers,
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            },
            ["ui.inlayhint.hints"] = {
                compositeLiteralFields = true,
                constantValues = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
        },
    },
    -- settings = {
    --     gopls = {
    --         analyses = {
    --             unusedparams = true,
    --         },
    --         hints = {
    --             assignVariableTypes = true,
    --             compositeLiteralFields = true,
    --             compositeLiteralTypes = true,
    --             constantValues = true,
    --             functionTypeParameters = true,
    --             parameterNames = true,
    --             rangeVariableTypes = true,
    --         },
    --         staticcheck = true,
    --         gofumpt = true,
    --     }
    -- }
}
