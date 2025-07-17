return {
    cmd = { "jsonnet-language-server", "-t" },
    filetypes = { 'jsonnet' },
    root_markers = { 'jsonnetfile.json', '.git' },
    settings = {
        ext_vars = {
            foo = 'bar',
        },
        formatting = {
            -- default values
            Indent              = 2,
            MaxBlankLines       = 2,
            StringStyle         = 'single',
            CommentStyle        = 'slash',
            PrettyFieldNames    = true,
            PadArrays           = false,
            PadObjects          = true,
            SortImports         = true,
            UseImplicitPlus     = true,
            StripEverything     = false,
            StripComments       = false,
            StripAllButComments = false,
        },
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
        },
        completion = {
            autoRequire = true,
            callSnippet = true,
        },
    },
}
