return {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { "typescript" },
    root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
}
