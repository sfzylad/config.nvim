local gh = function(x)
   return "https://github.com/" .. x
end
local cb = function(x)
   return "https://codeberg.org/" .. x
end

vim.pack.add({
   { src = gh("nvim-lua/plenary.nvim") },
   { src = gh("neovim/nvim-lspconfig.git") },
   { src = gh("ray-x/guihua.lua.git") },
   { src = gh("ray-x/go.nvim.git") },
   {
      src = gh("nvim-treesitter/nvim-treesitter"),
      version = "c82bf96f0a773d85304feeb695e1e23b2207ac35",
   },
   { src = gh("ray-x/lsp_signature.nvim") },
   { src = gh("lewis6991/gitsigns.nvim") },
   { src = gh("folke/todo-comments.nvim") },
   { src = gh("folke/trouble.nvim") },
   { src = gh("tpope/vim-fugitive") },
   { src = gh("nvim-tree/nvim-web-devicons") },
   { src = gh("nvim-neotest/nvim-nio") },
   { src = gh("vim-test/vim-test") },
   -- { src = gh("nvimtools/none-ls.nvim") },
   { src = gh("numToStr/Comment.nvim") },
   { src = gh("editorconfig/editorconfig-vim") },
   { src = gh("mrjones2014/smart-splits.nvim") },
   { src = gh("nvim-treesitter/nvim-treesitter-context") },
   {
      src = gh("ThePrimeagen/harpoon"),
      version = "harpoon2",
   },
   { src = gh("mbbill/undotree") },
   { src = gh("vmware-archive/salt-vim") },
   { src = gh("mfussenegger/nvim-lint") },
   { src = gh("dhruvasagar/vim-zoom") },
   { src = gh("will133/vim-dirdiff") },
   { src = gh("b0o/schemastore.nvim") },
   { src = gh("p00f/clangd_extensions.nvim") },
   { src = gh("pmizio/typescript-tools.nvim") },
   { src = gh("nvim-tree/nvim-web-devicons") },
   { src = gh("nvim-lualine/lualine.nvim") },
   { src = gh("arkav/lualine-lsp-progress") },
   { src = gh("leath-dub/snipe.nvim") },
   { src = cb("andyg/leap.nvim") },
   { src = gh("lukas-reineke/headlines.nvim") },
   { src = gh("rafikdraoui/jj-diffconflicts") },
   { src = gh("avm99963/vim-jjdescription") },
   { src = gh("benomahony/uv.nvim") },
   { src = gh("ahkohd/difft.nvim") },

   { src = gh("folke/tokyonight.nvim") },
   { src = gh("dracula/vim") },
   {
      src = gh("catppuccin/nvim"),
      name = "catppuccin",
   },
   { src = gh("projekt0n/github-nvim-theme") },
   {
      src = gh("lifepillar/vim-solarized8"),
      name = "solarized8",
   },
   { src = gh("ishan9299/nvim-solarized-lua") },
   { src = gh("nyoom-engineering/oxocarbon.nvim") },
   { src = gh("rebelot/kanagawa.nvim") },
   {
      src = gh("rose-pine/neovim"),
      name = "rose-pine",
   },
   { src = gh("ramojus/mellifluous.nvim") },
   { src = gh("blazkowolf/gruber-darker.nvim") },
   {
      src = gh("zenbones-theme/zenbones.nvim"),
      name = "zenbones",
   },
   { src = gh("rktjmp/lush.nvim") },
   { src = gh("p00f/alabaster.nvim") },
   { src = gh("datsfilipe/vesper.nvim") },

   { src = gh("hrsh7th/cmp-nvim-lsp") },
   { src = gh("hrsh7th/cmp-buffer") },
   { src = gh("hrsh7th/cmp-path") },
   { src = gh("hrsh7th/cmp-cmdline") },
   { src = gh("hrsh7th/nvim-cmp") },
   { src = gh("L3MON4D3/LuaSnip") },
   { src = gh("mireq/luasnip-snippets") },
   { src = gh("saadparwaiz1/cmp_luasnip") },
   { src = gh("rafamadriz/friendly-snippets") },
   { src = gh("windwp/nvim-autopairs") },
   { src = gh("lukas-reineke/cmp-rg") },
   { src = gh("onsails/lspkind.nvim") },
   { src = gh("onsails/diaglist.nvim") },
   { src = gh("mfussenegger/nvim-dap") },
   { src = gh("rcarriga/nvim-dap-ui") },
   { src = gh("leoluz/nvim-dap-go") },
   { src = gh("mfussenegger/nvim-dap-python") },
   { src = gh("theHamsta/nvim-dap-virtual-text") },
   { src = gh("google/vim-jsonnet") },
   {
      src = gh("mrcjkb/rustaceanvim"),
      version = vim.version.range("^9"),
   },
   { src = gh("chrisgrieser/nvim-lsp-endhints") },

   { src = gh("folke/snacks.nvim") },
   { src = gh("goolord/alpha-nvim") },
   { src = gh("rmagatti/auto-session") },
   { src = gh("stevearc/conform.nvim") },

   { src = gh("algmyr/vcsigns.nvim") },
   { src = gh("algmyr/vclib.nvim") },
   { src = gh("lewis6991/async.nvim") },

   { src = gh("NickvanDyke/opencode.nvim") },
   { src = gh("folke/which-key.nvim") },
})

--- Function for setting up themes
-- This function should be used across my entire config.
-- @param color string: Name of the theme to be set.
function ColorMyPencils(color)
   color = color or "gruber-darker"
   vim.cmd.colorscheme(color)

   if color == "gruber-darker" then
      vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#141414" })
      vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "#252525", underline = true })
      vim.api.nvim_set_hl(0, "Visual", { bg = "#2a2a2a", fg = "NONE" })
      vim.api.nvim_set_hl(0, "SpellBad", { bg = "#442222", fg = "NONE" })

      vim.api.nvim_set_hl(0, "Normal", { bg = "#101010" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "#181818" })
   end
end
