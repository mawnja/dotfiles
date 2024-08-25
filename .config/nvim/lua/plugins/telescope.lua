return { 
    "nvim-telescope/telescope.nvim", 
    version = "0.1.6", 
    dependencies = {
        'nvim-lua/plenary.nvim',
        "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0",      
    },
    config = function()
	    local actions = require("telescope-live-grep-args.actions")
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
                live_grep_args = {
                    auto_quoting = true, -- enable/disable auto-quoting
                    mappings = { -- extend mappings
                        i = {
                            ["<C-k>"] = actions.quote_prompt(),
                            ["<C-i>"] = actions.quote_prompt({ postfix = " --glob " }),
                            -- freeze the current list and start a fuzzy search in the frozen list
                            -- ["<C-space>"] = actions.to_fuzzy_refine,
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
        telescope.load_extension("live_grep_args")
    end
}
