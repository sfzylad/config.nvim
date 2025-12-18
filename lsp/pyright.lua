return {
    settings = {
        capabilities = {
            textDocument = {
                completion = {
                    completionItem = {
                        snippetSupport = true,
                    },
                },
            },
            offsetEncoding = { 'utrf-8', 'utf-16' },
        },
        pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                -- ignore = { '*' },
                autoImportCompletions = true,
            },
        },
    },
}
