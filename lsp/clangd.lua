return {
    cmd = { 'clangd', '--background-index', '--clang-tidy', '--log=verbose' },
    filetypes = { "c", "cpp" },
    init_options = {
        fallbackFlags = { '-std=c++17' },
    },
}
