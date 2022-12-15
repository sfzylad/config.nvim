local M = {}


local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

vim.o.completeopt = "menu,menuone,noselect"

function M.setup()
  -----------------------------------------------------------------------------
  -- Set up nvim-cmp
  -----------------------------------------------------------------------------
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local luasnip = require("luasnip")
  local cmp = require'cmp'
  local lspkind = require('lspkind')


  -- local winbar = require('zylad.winbar')
  -- local colors = require('zylad.colors')

  cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
  )

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
      completion = {
        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        col_offset = -3,
        side_padding = 0,
      },
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false`

      ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
              cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
          elseif has_words_before() then
              cmp.complete()
          else
              fallback()
          end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
              cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
          else
              fallback()
          end
      end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'treesitter' },
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'buffer' },
      -- { name = "rg",
      --   -- Try it when you feel cmp performance is poor
      --   -- keyword_length = 3
      -- },
      { name = "path" },
    }),

    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = lspkind.cmp_format({
          mode = "symbol_text",
          preset = "codicons",
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
      -- format = function(entry, vim_item)
      --   local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      --   local strings = vim.split(kind.kind, "%s", { trimempty = true })
      --   kind.kind = " " .. strings[1] .. " "
      --   kind.menu = "    (" .. strings[2] .. ")"
      --
      --   return kind
      -- end,
    },

  })

end


return M
