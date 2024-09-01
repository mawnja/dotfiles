return { 
    "nvim-telescope/telescope.nvim", 
    version = "0.1.6", 
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-frecency.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0",      
    },
    opts = {},
    config = function()
        local fb_actions = require("telescope").extensions.file_browser.actions
	    local lga_actions = require("telescope-live-grep-args.actions")
        local telescope = require("telescope")
        local tlp_actions = require('telescope.actions')
        local tlp_state = require('telescope.actions.state')
        telescope.setup({
            defaults = {
                history = {
                    path = '~/.local/share/nvim/telescope_history',
                    limit = 100,
                },
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
                        preview_height = 0.3,
                        prompt_position = "bottom",
                    },
                },
                mappings = {
                    i = {
                        ["<C-p>"] = function()
                            local clipboard_content = vim.fn.getreg('+'):gsub("\n", "")
                            if clipboard_content ~= "" then
                                local prompt_bufnr = tlp_state.get_current_picker(vim.api.nvim_get_current_buf()).prompt_bufnr
                                local prompt_text = tlp_state.get_current_line()
                                local new_text = prompt_text .. clipboard_content
                                local cursor_pos = vim.api.nvim_win_get_cursor(0)
                                local row = cursor_pos[1] - 1
                                local col = cursor_pos[2]
                                vim.api.nvim_buf_set_text(prompt_bufnr, row, col, row, col, { new_text })
                            end
                        end,
                        ["<C-u>"] = function()
                            local prompt_bufnr = tlp_state.get_current_picker(vim.api.nvim_get_current_buf()).prompt_bufnr
                            vim.api.nvim_buf_set_lines(prompt_bufnr, 0, -1, false, { "" })
                        end,
                    },
                    n = {
                        ["<C-p>"] = function()
                            local clipboard_content = vim.fn.getreg('+'):gsub("\n", "")
                            if clipboard_content ~= "" then
                                local prompt_bufnr = tlp_state.get_current_picker(vim.api.nvim_get_current_buf()).prompt_bufnr
                                local prompt_text = tlp_state.get_current_line()
                                local new_text = prompt_text .. clipboard_content
                                local cursor_pos = vim.api.nvim_win_get_cursor(0)
                                local row = cursor_pos[1] - 1
                                local col = cursor_pos[2]
                                vim.api.nvim_buf_set_text(prompt_bufnr, row, col, row, col, { new_text })
                            end
                        end,
                        ["<C-u>"] = function()
                            local prompt_bufnr = tlp_state.get_current_picker(vim.api.nvim_get_current_buf()).prompt_bufnr
                            vim.api.nvim_buf_set_lines(prompt_bufnr, 0, -1, false, { "" })
                        end,
                    }
                }
            },
            pickers = {
                find_files = {

                },
                live_grep = {
                    -- 启用历史记录
                    history = true,
                    theme = "dropdown",
                    layout_strategy = "vertical",
                    dynamic_preview_title = true,
                    --path_display = {"shorten"}, 
                    path_display = {"truncate"},
                    layout_config = {
                        width = {padding = 0},
                        height = {padding = 0},
                        preview_height = 0.4,
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
                        preview_width = 0.5,
                    },
                },
                live_grep_args = {
                    -- 启用历史记录
                    history = true,
                    auto_quoting = true, -- enable/disable auto-quoting
                    mappings = { -- extend mappings
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --glob " }),
                            -- freeze the current list and start a fuzzy search in the frozen list
                            -- ["<C-space>"] = lga_actions.to_fuzzy_refine,
                            ["<C-Up>"] = lga_actions.cycle_history_prev,
                            ["<C-Down>"] = lga_actions.cycle_history_next,
                        },
                        n = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --glob " }),
                            -- freeze the current list and start a fuzzy search in the frozen list
                            -- ["<C-space>"] = lga_actions.to_fuzzy_refine,
                            ["<C-Up>"] = lga_actions.cycle_history_prev,
                            ["<C-Down>"] = lga_actions.cycle_history_next,
                        },
                    },
                    theme = "dropdown",
                    layout_strategy = "vertical",
                    layout_config = { 
                        width = {padding = 0},
                        height = {padding = 0},
                        preview_height = 0.4,
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
