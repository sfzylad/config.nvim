return {
    cmd = { "gopls" },
    filetypes = { "go", "gotempl", "gowork", "gomod" },
    root_markers = { ".git", "go.mod", "go.work", '.git' },
    capabilities = {
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true,
                },
            },
        },
    },
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
}
