return {
    "sindrets/diffview.nvim", 
    dependencies = "nvim-lua/plenary.nvim",
    opts = {},
    config = function()
        require("diffview").setup{}
    end
}
