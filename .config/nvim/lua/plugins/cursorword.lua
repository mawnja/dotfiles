local illuminate = {
    "RRethy/vim-illuminate",
    opts = {},
    config = function()
        -- 启用 vim-illuminate
        require('illuminate').configure({
            -- 配置选项，例如延迟时间
            delay = 100,
            -- 高亮颜色
            under_cursor = true,
            -- 高亮相同字符
            providers = {
                'lsp',
                'treesitter',
                'regex',
            },
            -- 高亮组
            highlight_group = 'IlluminatedWord',
        })
        -- 定义高亮颜色
        vim.cmd([[
            hi CocHighlightText ctermbg=Yellow guibg=Yellow
        ]])
        -- 定义高亮组
        vim.cmd([[
            hi link IlluminatedWordText CocHighlightText
            hi link IlluminatedWordRead CocHighlightText
            hi link IlluminatedWordWrite CocHighlightText
        ]]) 
    end
}

return {
    illuminate
}
