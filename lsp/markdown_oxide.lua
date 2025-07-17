return {
    require("lspconfig").markdown_oxide.setup({
        -- Ensure that dynamicRegistration is enabled! This allows the LS to take into account actions like the
        -- Create Unresolved File code action, resolving completions for unindexed code blocks, ...
        filetypes = { 'markdown' },
        capabilities = vim.tbl_deep_extend(
            'force',
            require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
            {
                workspace = {
                    didChangeWatchedFiles = {
                        dynamicRegistration = true,
                    },
                },
            }
        ),
    })
}
