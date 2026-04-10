local null_ls = require("null-ls")
local methods = require("null-ls.methods")
local helpers = require("null-ls.helpers")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local function prettierd()
   local cmd_resolver = require("null-ls.helpers.command_resolver")
   local u = require("null-ls.utils")
   local FORMATTING = methods.internal.FORMATTING
   local RANGE_FORMATTING = methods.internal.RANGE_FORMATTING
   return helpers.make_builtin({
      name = "prettierd",
      meta = {
         url = "https://github.com/fsouza/prettierd",
         description = "prettier, as a daemon, for ludicrous formatting speed.",
      },
      method = { FORMATTING, RANGE_FORMATTING },
      filetypes = {
         "javascript",
         "javascriptreact",
         "typescript",
         "typescriptreact",
         "vue",
         "css",
         "scss",
         "less",
         "html",
         "json",
         "jsonc",
         "yaml",
         "markdown",
         "markdown.mdx",
         "graphql",
         "handlebars",
         "svelte",
         "astro",
         "htmlangular",
      },
      generator_opts = {
         command = "prettierd",
         args = function(params)
            if params.method == FORMATTING then
               return { "$FILENAME" }
            end

            local row, end_row = params.range.row - 1, params.range.end_row - 1
            local col, end_col = params.range.col - 1, params.range.end_col - 1
            local start_offset = vim.api.nvim_buf_get_offset(params.bufnr, row) + col
            local end_offset = vim.api.nvim_buf_get_offset(params.bufnr, end_row) + end_col

            return { "$FILENAME", "--range-start=" .. start_offset, "--range-end=" .. end_offset }
         end,
         dynamic_command = cmd_resolver.from_node_modules(),
         to_stdin = true,
         cwd = helpers.cache.by_bufnr(function(params)
            return u.cosmiconfig("prettier")(params.bufname)
         end),
      },
      factory = helpers.formatter_factory,
   })
end

local function gofumpt()
   local FORMATTING = methods.internal.FORMATTING
   return helpers.make_builtin({
      name = "gofumpt",
      meta = {
         url = "https://github.com/mvdan/gofumpt",
         description = "Enforce a stricter format than gofmt, while being backwards compatible. That is, gofumpt is happy with a subset of the formats that gofmt is happy with.",
      },
      method = FORMATTING,
      filetypes = { "go" },
      generator_opts = {
         command = "gofumpt",
         to_stdin = true,
      },
      factory = helpers.formatter_factory,
   })
end

null_ls.setup({

   sources = {
      -- null_ls doesn't work if I enumerate the files from the plugin
      -- hence I use my own functions
      -- ruff_fix,
      -- gofumpt,
      prettierd,
      -- null_ls.builtins.diagnostics.ruff,
      -- null_ls.builtins.formatting.gofumpt,
      null_ls.builtins.formatting.yamlfmt,
   },
})
