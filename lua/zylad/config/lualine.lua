local M = {}

local lualine = require "lualine"

local gruber_colors = {
    bg       = '#181818', -- The main background
    quartz   = '#95a99f', -- Soft grey-green (text)
    niagara  = '#303540', -- Subtle blue-grey (active section)
    wisteria = '#9e95c7', -- Purple (accents)
    yellow   = '#ffdd33', -- Warning/Notice
}

local function get_short_mode()
    local mode_code = vim.api.nvim_get_mode().mode
    local modes = {
        ['n'] = 'N',
        ['i'] = 'I',
        ['v'] = 'V',
        ['V'] = 'VL',
        [''] = 'VB',
        ['c'] = 'C',
        ['R'] = 'R',
    }
    return modes[mode_code] or mode_code:upper()
end

local config = {
    options = {
        icons_enabled = false,
        theme = {
            normal = {
                a = { fg = gruber_colors.bg, bg = gruber_colors.quartz, gui = 'bold' },
                b = { fg = gruber_colors.quartz, bg = gruber_colors.niagara },
                c = { fg = gruber_colors.quartz, bg = gruber_colors.bg },
            },
            insert = {
                a = { fg = gruber_colors.bg, bg = gruber_colors.wisteria, gui = 'bold' },
            },
            visual = {
                a = { fg = gruber_colors.bg, bg = gruber_colors.yellow, gui = 'bold' },
            },
        },
        -- theme = 'iceberg_dark',
        -- theme = 'auto',

        -- Fancy separators most likely I will never want
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        --
        -- component_separators = '|',
        -- section_separators = { left = '', right = '' },

        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },

        disabled_filetypes = {
            statusline = {},
            winbar = {
                "help",
                "startify",
                "dashboard",
                "packer",
                "neogitstatus",
                "NvimTree",
                "Trouble",
                "alpha",
                "lir",
                "Outline",
                "spectre_panel",
                "toggleterm",
                "dap-repl",
                "dapui_console",
                "dapui_watches",
                "dapui_stacks",
                "dapui_breakpoints",
                "dapui_scopes",
            },
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
            statusline = 500,
            tabline = 100,
            winbar = 100,
        }
    },
    sections = {
        -- lualine_a = { 'mode' },
        lualine_a = { get_short_mode },
        -- lualine_a = {},
        -- lualine_b = { 'branch' },
        lualine_b = {},
        lualine_c = { { 'filename', path = 3 }, 'diff', { 'diagnostics', update_in_insert = false, source = { 'nvim_diagnostic' } }, "lsp_progress" },
        -- lualine_x = { "lsp_progress", "vim.fn['zoom#statusline']()", 'encoding', 'fileformat', 'filetype', },
        lualine_x = { 'filetype', },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },

    inactive_sections = {
        -- lualine_a = { 'mode' },
        lualine_a = { get_short_mode },
        lualine_b = {},
        lualine_c = { { 'filename', path = 3 } },
        -- lualine_x = { 'location' },

        -- lualine_x = { "vim.fn['zoom#statusline']()", 'encoding', 'fileformat', 'filetype' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}

        -- lualine_y = { 'progress' },
        -- lualine_z = { 'location' }
        -- lualine_z = {'filetype'},
        -- lualine_z = {},
    },
    tabline = {
        lualine_a = { 'buffers' },
        lualine_b = { 'lsp_progress' },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'tabs' },
    },
    extensions = { "nvim-tree", "toggleterm", "quickfix", "trouble", "symbols-outline", "nvim-dap-ui" },
}

function M.setup()
    lualine.setup(config)
end

return M
