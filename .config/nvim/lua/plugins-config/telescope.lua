local status_ok, telescope = pcall(require, 'telescope')

if not status_ok then
    vim.notify("telescope plugin is not exists")
    return
end

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fm', builtin.marks, {})

local actions = require('telescope-live-grep-args.actions')

telescope.setup {
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
}

-- load the extension
telescope.load_extension("live_grep_args")

vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
