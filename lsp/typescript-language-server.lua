return {
   cmd = { 'typescript-language-server', '--stdio' },
   filetypes = { "typescript", "typescriptreact" },
   root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
   settings = {
      javascript = {
         format = {
            -- default values
            Indent           = 2,
            MaxBlankLines    = 2,
            StringStyle      = 'single',
            CommentStyle     = 'slash',
            PrettyFieldNames = true,
         },
      },
      typescript = {
         format = {
            -- default values
            Indent           = 2,
            MaxBlankLines    = 2,
            StringStyle      = 'single',
            CommentStyle     = 'slash',
            PrettyFieldNames = true,
         },
      },

      completion = {
         autoRequire = true,
         callSnippet = true,
      },
   },
}
