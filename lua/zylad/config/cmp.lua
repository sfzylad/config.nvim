local M = {}


local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- vim.o.completeopt = "menu,menuone,noselect"

function M.setup()
  -----------------------------------------------------------------------------
  -- Set up nvim-cmp
  -----------------------------------------------------------------------------
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  -- local luasnip = require("luasnip")
  local cmp = require'cmp'
  local lspkind = require('lspkind')

  cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
  )

  cmp.setup({
    -- completion = {
    --     autocomplete = true,
    -- },
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    preselect = cmp.PreselectMode.Item,
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
      -- completion = {
      --   -- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      --   col_offset = -3,
      --   side_padding = 0,
      -- },
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      -- ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false }), -- Accept currently selected item. Set `select` to `false`
      ['<CR>'] = cmp.mapping.confirm({  select = true }), -- Accept currently selected item. Set `select` to `false`

    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp', group_index = 1 },
      { name = 'luasnip', group_index = 2 }, -- For luasnip users.
      { name = 'buffer', group_index = 3 },
      { name = "path", group_index = 4 },
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
