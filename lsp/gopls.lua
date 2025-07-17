return {
    filetypes = { 'go', 'gomod' },
    root_markers = { { 'go.mod', 'go.sum' }, '.git' },
    inlay_hints = { enabled = true },
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
            analyses = {
                unusedparams = true,
            },
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
            staticcheck = true,
            gofumpt = true,
        }
    }
}
