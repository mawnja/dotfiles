return {
    "nvim-lualine/lualine.nvim", 
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {},
    config = function()
        local lualine = require("lualine")
        lualine.setup({
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {},
                always_divide_middle = true,
                globalstatus = false,
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = { {'filename', path = 1} },  -- display the file path, 1, relative path, 2, absolute path
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { {'filename', path = 1} },  -- display the file path, 1, relative path, 2, absolute path
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            extensions = {} 
        })
    end
}
