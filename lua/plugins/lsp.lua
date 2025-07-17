return {
    {
        "neovim/nvim-lspconfig",
    },
    {
        "saadparwaiz1/cmp_luasnip",
    },
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "hrsh7th/cmp-buffer",
    },
    {
        "hrsh7th/cmp-path",
    },
    {
        "hrsh7th/cmp-cmdline",
    },
    {
        "hrsh7th/nvim-cmp",
    },
    {
        "windwp/nvim-autopairs",
    },
    {
        "lukas-reineke/cmp-rg",
    },
    {
        "onsails/lspkind.nvim",
    },

    {
        "onsails/diaglist.nvim",
    },
    {
        "nvim-lualine/lualine.nvim",
    },
    {
        "mfussenegger/nvim-dap",
    },
    {
        "rcarriga/nvim-dap-ui",
    },
    {
        "leoluz/nvim-dap-go",
    },
    {
        "mfussenegger/nvim-dap-python",
    },
    {
        'theHamsta/nvim-dap-virtual-text',
    },
    {
        "google/vim-jsonnet",
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false,   -- This plugin is already lazy
    },
    {
        "chrisgrieser/nvim-lsp-endhints",
        event = "LspAttach",
        opts = {}, -- required, even if empty
    },
}
