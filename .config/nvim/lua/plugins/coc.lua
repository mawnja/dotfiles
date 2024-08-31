return {
    "neoclide/coc.nvim", 
    branch = "release",
    config = function()
        -- 启用鼠标支持
        vim.o.mouse = 'a'
        -- 定义高亮组
        vim.cmd([[
            hi CocHighlightText ctermbg=Yellow guibg=Yellow
        ]])
        -- 设置 coc.nvim 高亮
        vim.g.coc_enable_locationlist = 0
        vim.g.coc_global_extensions = { 'coc-highlight' }

        -- 自动命令，用于在鼠标悬停时高亮字符
        vim.cmd([[
            augroup CocHighlight
                autocmd!
                autocmd CursorHold * silent call CocActionAsync('highlight')
            augroup end
        ]])
    end
}
-- ::CocInstall coc-clangd  # C++环境插件
-- ::CocInstall coc-cmake  # Cmake 支持
-- ::CocInstall coc-emmet  
-- ::CocInstall coc-git    # git 支持
-- ::CocInstall coc-highlight  # 高亮支持
-- ::CocInstall coc-jedi   # jedi
-- ::CocInstall coc-json   # json 文件支持
-- ::CocInstall coc-python # python 环境支持
-- ::CocInstall coc-sh     # bash 环境支持
-- ::CocInstall coc-snippets # python提供 snippets
---- ::CocInstall coc-vimlsp # lsp #与coc-jedi不能兼容
-- ::CocInstall coc-yaml   # yaml
-- ::CocInstall coc-syntax
-- ::CocInstall coc-pairs
