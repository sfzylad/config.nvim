return {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { "typescript" },
    root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
    settings = {
        formatting = {
            -- default values
            Indent           = 2,
            MaxBlankLines    = 2,
            StringStyle      = 'single',
            CommentStyle     = 'slash',
            PrettyFieldNames = true,
        },
        completion = {
            autoRequire = true,
            callSnippet = true,
        },
    },
}
