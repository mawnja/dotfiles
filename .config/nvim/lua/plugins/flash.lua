return {
    "folke/flash.nvim", 
    event = "VeryLazy", 
    opts = {
        modes = {
            char = {
                enabled = true,
                jump_labels = true,
            },
        },
    },
    keys = {
        --{ "/", mode = { "n", "x", "o"}, function() require("flash").jump({search = { forward = true, wrap = false, multi_window = false },}) end, desc = "Flash"},
        --{ "/", mode = {"n", "x", "o"}, function() require("flash").jump({search = {mode = function(str) return "\\<" .. str end},}) end, desc = "" },
        { "*", mode = {"n", "x", "o"}, function() require("flash").jump({search = { mode = "search", max_length = 0 }, label = { after = { 0, 0 } }, pattern = "^"}) end, desc = ""},
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<C-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        {
            "+",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    pattern = ".", -- initialize pattern with any char
                    search = {
                        mode = function(pattern)
                            -- remove leading dot
                            if pattern:sub(1, 1) == "." then
                                pattern = pattern:sub(2)
                            end
                            -- return word pattern and proper skip pattern
                            return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
                        end,
                    },
                    -- select the range
                    jump = { pos = "range" },
                })
            end,
            desc = "",
        },

    },
}
