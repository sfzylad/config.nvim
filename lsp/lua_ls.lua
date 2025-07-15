return {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'Lua 5.1',
        path = {
            '?.lua',
            '?/init.lua',
            vim.fn.expand'~/.luarocks/share/lua/5.3/?.lua',
            vim.fn.expand'~/.luarocks/share/lua/5.3/?/init.lua',
             '/usr/share/5.1/?.lua',
             '/usr/share/lua/5.1/?/init.lua',
             '/usr/local/Cellar/lua/5.4.4_1/?.lua',
             '/usr/local/Cellar/lua/5.4.4_1/?/init.lua',
        },
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
      completion = {
        autoRequire = true,
        callSnippet = true,
      },
    },
  },

}
