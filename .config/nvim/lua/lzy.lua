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

    require("plugins.bufferline"),

    require("plugins.lualine"),

    require("plugins.telescope"),

    require("plugins.treesitter"),

    -- bookmark
    require("plugins.marks"),

    -- terminal
    require("plugins.toggleterm"),

    { "p00f/nvim-ts-rainbow" },

    require("plugins.coc"),

    -- symbols outline
    require("plugins.symbols-outline"),

    --colorizer
    require("plugins.colorizer"),

    require("plugins.todo"),

    require("plugins.flash"),

    require("plugins.comment"),

    require("plugins.ibl"),

    require("plugins.gv")

    -- git diffview
    --{"sindrets/diffview.nvim", dependencies = 'nvim-lua/plenary.nvim' },

    --{"preservim/vim-markdown", ft = "markdown",},
    --{"iamcco/markdown-preview.nvim"},
    --{"godlygeek/tabular"},

    --{ "mbbill/undotree"},
    --{ "gcmt/wildfire.vim" },

    --{ "folke/which-key.nvim"},

    --{"kassio/neoterm"}

})
