local floaterm = {
    "voldikss/vim-floaterm",
    config = function()
        -- 配置选项
        vim.g.floaterm_width = 0.99
        vim.g.floaterm_height = 0.5
        vim.g.floaterm_position = "bottom"
        vim.g.floaterm_autoclose = 1
        vim.g.floaterm_title = 'Terminal $1/$2'

        -- 设置快捷键
        --vim.api.nvim_set_keymap('n', '<F1>', ':FloatermNew<CR>', { noremap = true, silent = true })
        --vim.api.nvim_set_keymap('n', '<F2>', ':FloatermPrev<CR>', { noremap = true, silent = true })
        --vim.api.nvim_set_keymap('n', '<F3>', ':FloatermNext<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<F4>', ':FloatermToggle<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<F5>', ':FloatermKill<CR>', { noremap = true, silent = true })
    end
}

return {
    floaterm
}
