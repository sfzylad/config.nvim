local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require 'cmp'
local lspkind = require('lspkind')

cmp.event:on(
   'confirm_done',
   cmp_autopairs.on_confirm_done()
)
cmp.setup({
   view = {
      docs = {
         auto_open = true
      }
   },
   snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
         require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
   },
   preselect = cmp.PreselectMode.Item,
   window = {
      -- completion = cmp.config.window.bordered(),
      completion = {
         border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
      },
      -- documentation = cmp.config.window.bordered(),
      documentation = {
         border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
      },
   },
   mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false`
      ['<C-g>'] = function()
         if cmp.visible_docs() then
            cmp.close_docs()
         else
            cmp.open_docs()
         end
      end,

   }),
   sources = cmp.config.sources({
      {
         name = 'nvim_lsp',
         group_index = 1,
         options = {
            markdown_oxide = {
               keyword_pattern = [[\(\k\| \|\/\|#\)\+]]
            }
         }
      },
      { name = 'luasnip', group_index = 2 }, -- For luasnip users.
      { name = 'buffer',  group_index = 3 },
      { name = "path",    group_index = 4 },
   }),

   fomatting = {
      fields = { "abbr", "kind", "menu" },
      -- fields = { "abbr", "kind" },
      format = lspkind.cmp_format({
         mode = "symbol_text",
         -- mode = "text",
         -- preset = "codicons",
         -- preset = "default",
         maxwidth = 50,
         menu = {
            buffer = "[BUF]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[API]",
            rg = "[RG]",
            treesitter = "[TRS]",
            path = "[PATH]",
            luasnip = "[SNIP]",
         },
      }),
   },

})
