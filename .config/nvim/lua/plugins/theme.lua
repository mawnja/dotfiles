return {
    { 
        "maxmx03/solarized.nvim",
        name = "solarized",
        priority = 1000,
        opts = {},
        config = function()
            --require("solarized").setup{}
            --vim.cmd("colorscheme solarized")
        end
    },
    { 
        "NLKNguyen/papercolor-theme",
        opts = {},
        config = function()
            vim.cmd("colorscheme PaperColor")
        end
    }
    --{
        --"svrana/neosolarized.nvim",
        --dependencies = { "tjdevries/colorbuddy.nvim" },
        --opts = {},
        --config = function()
            --require("neosolarized").setup{ comment_italics = true, background_set = true, theme_style = "dark"}
            --vim.cmd("colorscheme neosolarized")
        --end
    --}
}
