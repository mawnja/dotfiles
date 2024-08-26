return { 
    "nvim-telescope/telescope.nvim", 
    version = "0.1.6", 
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-frecency.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0",      
    },
    config = function()
        local fb_actions = require("telescope").extensions.file_browser.actions
	    local lga_actions = require("telescope-live-grep-args.actions")
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                layout_strategy = "vertical",
                dynamic_preview_title = true,
                --path_display = {"shorten"}, 
                path_display = {"truncate"},
                layout_config = {
                    width = {padding = 0},
                    height = {padding = 0},
                    horizontal = {
                        preview_cutoff = 30,
                        preview_width = 0.5,
                        prompt_position = "bottom",
                    },
                    vertical = {
                        preview_cutoff = 20,
                        preview_height = 0.5,
                        prompt_position = "bottom",
                    },
                },
            },
            pickers = {
                live_grep = {
                    theme = "dropdown",
                    layout_strategy = "vertical",
                    dynamic_preview_title = true,
                    --path_display = {"shorten"}, 
                    path_display = {"truncate"},
                    layout_config = {
                        width = {padding = 0},
                        height = {padding = 0},
                        preview_height = 0.6,
                        prompt_position = "bottom",
                    },
                    glob_pattern = "!*.{sh,txt,md,js,ts,go,json,xml,m4,sub,lock,Makefile}",
                },
            },
            extensions = {
                frecency = {

                },
                file_browser = {
                    theme = "ivy",
                    -- disables netrw and use telescope-file-browser in its place
                    hijack_netrw = true,
                    mappings = {
                        ["i"] = {
                            ["<A-w>"] = fb_actions.goto_cwd,
                            ["<A-p>"] = fb_actions.goto_parent_dir,
                            ["<A-h>"] = fb_actions.goto_home_dir,
                        },
                        ["n"] = {
                            -- your custom normal mode mappings
                        },
                    },
                    layout_strategy = "horizontal",
                    dynamic_preview_title = true,
                    layout_config = { 
                        width = {padding = 0},
                        height = {padding = 0},
                        preview_width = 0.6,
                    },
                },
                live_grep_args = {
                    auto_quoting = true, -- enable/disable auto-quoting
                    mappings = { -- extend mappings
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --glob " }),
                            -- freeze the current list and start a fuzzy search in the frozen list
                            -- ["<C-space>"] = lga_actions.to_fuzzy_refine,
                        },
                        n = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --glob " }),
                            -- freeze the current list and start a fuzzy search in the frozen list
                            -- ["<C-space>"] = lga_actions.to_fuzzy_refine,
                        },
                    },
                    theme = "dropdown",
                    layout_strategy = "vertical",
                    layout_config = { 
                        width = {padding = 0},
                        height = {padding = 0},
                        preview_height = 0.6,
                    },
                }
            }
        })
        --extension
        telescope.load_extension("frecency")
        telescope.load_extension("file_browser")
        telescope.load_extension("live_grep_args")
    end
}
