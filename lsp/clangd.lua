return {
   cmd = {
      'clangd',
      '--background-index',
      '--clang-tidy',
      '--log=verbose',
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--completion-style=detailed",
      "--function-arg-placeholders",
      "--fallback-style=llvm",
   },
   filetypes = { "c", "cpp" },
   init_options = {
      init_options = {
         usePlaceholders = true,
         completeUnimported = true,
         clangdFileStatus = true,
         -- fallbackFlags = { '-std=c++17' },
      },
   },
}
