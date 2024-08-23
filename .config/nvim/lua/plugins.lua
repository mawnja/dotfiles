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
    { "maxmx03/solarized.nvim", name = "solarized", priority = 1000 },
    { "NLKNguyen/papercolor-theme" },

    -- file explorer
    { "nvim-tree/nvim-tree.lua", event = "VimEnter", dependencies = "nvim-tree/nvim-web-devicons" },

    -- bufferline
    { "akinsho/bufferline.nvim", version = "v2.*", dependencies = "nvim-tree/nvim-web-devicons" },

    { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

    { "nvim-telescope/telescope.nvim", 
        version = "0.1.6", 
        dependencies = {
            'nvim-lua/plenary.nvim',
            "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0",      
        },
        config = function()
            local telescope = require("telescope")
            -- first setup telescope
            telescope.setup({
                -- your config
            })
            -- then load the extension
            telescope.load_extension("live_grep_args")
        end
    },

    { "nvim-treesitter/nvim-treesitter" },
    { "nvim-treesitter/nvim-treesitter-context"},

    { "p00f/nvim-ts-rainbow" },

    { "neoclide/coc.nvim", branch = "release" },

    -- bookmark
    { "chentoast/marks.nvim", event = "VeryLazy" },

    -- terminal
    {"akinsho/toggleterm.nvim", version = 'v2.*', config = true},

    -- symbols outline
    { "simrat39/symbols-outline.nvim" },

    -- git diffview
    --{"sindrets/diffview.nvim", dependencies = 'nvim-lua/plenary.nvim' },

    --colorizer
    { "norcalli/nvim-colorizer.lua"},

    { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { "folke/flash.nvim", event = "VeryLazy", opts = {}, keys = {},},

    { "numToStr/Comment.nvim", event = "VeryLazy",}
    
    --{"preservim/vim-markdown", ft = "markdown",},
    --{"iamcco/markdown-preview.nvim"},
    --{"godlygeek/tabular"},

    --{ "mbbill/undotree"},
    --{ "gcmt/wildfire.vim" },

    --{ "folke/which-key.nvim"},

})


--## ::CocInstall coc-clangd  # C++环境插件
--## ::CocInstall coc-cmake  # Cmake 支持
--## ::CocInstall coc-emmet  
--## ::CocInstall coc-git    # git 支持
--## ::CocInstall coc-highlight  # 高亮支持
--## ::CocInstall coc-jedi   # jedi
--## ::CocInstall coc-json   # json 文件支持
--## ::CocInstall coc-python # python 环境支持
--## ::CocInstall coc-sh     # bash 环境支持
--## ::CocInstall coc-snippets # python提供 snippets
--#### ::CocInstall coc-vimlsp # lsp #与coc-jedi不能兼容
--## ::CocInstall coc-yaml   # yaml
--## ::CocInstall coc-syntax
--## ::CocInstall coc-pairs
