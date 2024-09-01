-- #FFFF00 黄色
-- #90EE90 浅绿色
-- #D2B48C 土黄色
return {
    "norcalli/nvim-colorizer.lua",
    opts = {},
    config = function()
        local colorizer = require("colorizer")
        colorizer.setup({
            '*', --高亮所有文件类型
            },{
            RGB = true,
            RRGGBB = true,
            names = false, -- 不使用颜色名称
            RRGGBBAA = true,
            rgb_fn = true,
            hsl_fn = true,
            css = true,
            css_fn = true,
            mode = 'background',
            tailwind = true, -- 支持 Tailwind CSS 颜色
            sass = { enable = true, parsers = { 'css' } }, -- 支持 Sass 颜色
            virtualtext = '■', -- 使用虚拟文本显示颜色
        })
    end
}
