vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = { noremap = true, silent = true }

--##bufferline##
vim.keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
vim.keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)

vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opt)
vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opt)
vim.keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opt)
vim.keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opt)
vim.keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opt)
vim.keymap.set("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opt)
vim.keymap.set("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opt)
vim.keymap.set("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opt)
vim.keymap.set("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", opt)

--##nvim-tree##
vim.keymap.set("n", "<A-m>", ":NvimTreeToggle<CR>", opt) -- Open or close the tree
vim.keymap.set("n", "<A-n>", ":NvimTreeFocus<CR>", opt) -- focus on the tree
vim.keymap.set("n", "<A-f>", ":NvimTreeFindFile<CR>", opt)
vim.keymap.set("n", "<A-b>", ":NvimTreeCollapse<CR>", opt) -- 折叠

--##Telescop##
vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", opt) -- 查找文件
--vim.keymap.set("n", "<C-g>", ":Telescope live_grep<CR>", opt) -- 全局搜索
vim.keymap.set("n", "<C-g>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set("n", "<C-b>", ":Telescope buffers<CR>", opt)
--vim.keymap.set("n", "<C-h>", ":Telescope help_tags<CR>", opt)
--vim.keymap.set("n", "<C-m>", ":Telescope marks<CR>", opt)

--##coc-nvim
-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", opt)
vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", opt)

-- GoTo code navigation
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", opt)
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", opt)
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", opt)
-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
vim.keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

-- Symbol renaming
vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

-- Formatting selected code
vim.keymap.set("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
vim.keymap.set("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})

-- 使用 <TAB> 键进行代码补全
vim.api.nvim_set_keymap("i", "<TAB>", 'pumvisible() ? "<C-n>" : "<TAB>"', { noremap = true, expr = true })
vim.api.nvim_set_keymap("i", "<S-TAB>", 'pumvisible() ? "<C-p>" : "<C-h>"', { noremap = true, expr = true })

-- 使用 <CR> 键确认补全
vim.api.nvim_set_keymap("i", "<CR>", 'pumvisible() ? coc#_select_confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"', { noremap = true, expr = true })

-- ##vim-fold-cycle
vim.keymap.set("n", "<C-Right>", "<Plug>(FoldCycleToggle)")
vim.keymap.set("n", "<C-Left>", "<Plug>(FoldCycleToggle)")

-- ##toggleterm
vim.keymap.set('n', '<c-t>', '<Cmd>exe v:count1 . "ToggleTerm"<CR>', opts)
vim.keymap.set('i', '<c-t>', '<Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>', opts)
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
-- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)

-- vim.api.nvim_command('autocmd! TermEnter term://*toggleterm#* tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>')

-- ##todo-comments
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- You can also specify a list of valid jump keywords
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
end, { desc = "Next error/warning todo comment" })


