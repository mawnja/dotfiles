local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- if don't have lazy.nvim, auto-install it
if not vim.loop.fs_stat(lazypath) then
    PACK_BOOTSTRAP = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- lastest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- add package
require("lazy").setup({
    -- colorschemes
    require("plugins.theme"),

    -- file explorer
    require("plugins.nvim-tree"),
    -- buffer显示和管理
    require("plugins.bufferline"),
    -- 显示状态栏
    require("plugins.lualine"),
    -- 强大的模糊查找插件
    require("plugins.telescope"),
    -- 语法高亮和语法解析插件
    require("plugins.treesitter"),

    -- bookmark
    require("plugins.marks"),

    -- 显示代码符号大纲
    require("plugins.symbols-outline"),

    -- 实时高亮显示颜色代码
    require("plugins.colorizer"),
    -- 高亮显示和管理TODO、FIXME、NOTE等注释的插件
    require("plugins.todo"),
    -- 快速导航和操作的插件
    require("plugins.flash"),
    -- 快速注释和取消注释
    require("plugins.comment"),
    -- 显示缩进线
    require("plugins.ibl"),
    -- 查看和操作Git提交历史的插件
    require("plugins.gv"),
    -- 显示Git状态
    require("plugins.gitsigns"),
    -- 高亮显示当前光标下单词
    require("plugins.cursorword"),

    -- terminal
    require("plugins.terminal"),
    -- 提示代码补全功能
    require("plugins.cmp"),
    -- 配置和管理LSP
    require("plugins.lspconfig"),
    -- 统计和分析插件启动时间
    require("plugins.profile")

    -- git diffview
    --require("plugins.diffview"),

    --{"preservim/vim-markdown", ft = "markdown",},
    --{"iamcco/markdown-preview.nvim"},
    --{"godlygeek/tabular"},

    --{ "mbbill/undotree"},
    --{ "gcmt/wildfire.vim" },

    --{ "folke/which-key.nvim"},

    --{"kassio/neoterm"}
})
