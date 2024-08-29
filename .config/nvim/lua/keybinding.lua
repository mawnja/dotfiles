vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = { noremap = true, silent = true }
local keymap = vim.keymap

--##basic
-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'ggVG', opt)


--##bufferline##
keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)

keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opt)
keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opt)
keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opt)
keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opt)
keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opt)
keymap.set("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opt)
keymap.set("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opt)
keymap.set("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opt)
keymap.set("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", opt)

--##nvim-tree##
keymap.set("n", "<A-m>", ":NvimTreeToggle<CR>", opt) -- Open or close the tree
keymap.set("n", "<A-n>", ":NvimTreeFocus<CR>", opt) -- focus on the tree
keymap.set("n", "<A-f>", ":NvimTreeFindFile<CR>", opt)
keymap.set("n", "<A-b>", ":NvimTreeCollapse<CR>", opt) -- 折叠

--##Telescop##
keymap.set("n", "<C-p>", ":Telescope find_files<CR>", opt) -- 查找文件
--keymap.set("n", "<C-g>", ":Telescope live_grep<CR>", opt) -- 全局搜索
keymap.set("n", "<C-g>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
--keymap.set("n", "<C-b>", ":Telescope buffers<CR>", opt)
--keymap.set("n", "<C-h>", ":Telescope help_tags<CR>", opt)
--keymap.set("n", "<C-m>", ":Telescope marks<CR>", opt)
--file-browser
--keymap.set("n", "<C-b>", ":Telescope file_browser<CR>")
-- open file_browser with the path of the current buffer
keymap.set("n", "<C-b>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
-- Alternatively, using lua API
--keymap.set("n", "<space>fb", function()
--	require("telescope").extensions.file_browser.file_browser()
--end)
--frecency
keymap.set("n", "<C-f>", ":Telescope frecency workspace=CWD<CR>", opt)

--##coc-nvim
-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", opt)
keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", opt)

-- GoTo code navigation
keymap.set("n", "gd", "<Plug>(coc-definition)", opt)
keymap.set("n", "gy", "<Plug>(coc-type-definition)", opt)
keymap.set("n", "gi", "<Plug>(coc-implementation)", opt)
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
keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

-- Symbol renaming
keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

-- Formatting selected code
keymap.set("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
keymap.set("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})

-- 使用 <TAB> 键进行代码补全
keymap.set("i", "<TAB>", 'pumvisible() ? "<C-n>" : "<TAB>"', { noremap = true, expr = true })
keymap.set("i", "<S-TAB>", 'pumvisible() ? "<C-p>" : "<C-h>"', { noremap = true, expr = true })

-- 使用 <CR> 键确认补全
keymap.set("i", "<CR>", 'pumvisible() ? coc#_select_confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"', { noremap = true, expr = true })

--coc-git
--keymap.set('n', '<leader>gb', ':CocCommand git.chunkInfo<CR>', opt)
--keymap.set('n', '<leader>gh', ':CocCommand git.showCommit<CR>', opt)
--keymap.set('n', '<leader>gl', ':CocCommand git.showBlameDoc<CR>', opt)
--keymap.set('n', '<leader>gd', ':CocCommand git.diffCached<CR>', opt)

-- ##gv.vim
keymap.set('n', '<leader>gv', ':GV<CR>', opt)
keymap.set('n', '<leader>gV', ':GV!<CR>', opt)

-- ##vim-fold-cycle
keymap.set("n", "<C-Right>", "<Plug>(FoldCycleToggle)")
keymap.set("n", "<C-Left>", "<Plug>(FoldCycleToggle)")

-- ##toggleterm
keymap.set('n', '<c-t>', '<Cmd>exe v:count1 . "ToggleTerm"<CR>', opt)
keymap.set('i', '<c-t>', '<Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>', opt)
--keymap.set('t', '<esc>', [[<C-\><C-n>]], opt)
--keymap.set('t', 'jk', [[<C-\><C-n>]], opt)
--keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opt)
--keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opt)
--keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opt)
--keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opt)

-- vim.api.nvim_command('autocmd! TermEnter term://*toggleterm#* tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>')

-- ##todo-comments
keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- You can also specify a list of valid jump keywords
keymap.set("n", "]t", function()
  require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
end, { desc = "Next error/warning todo comment" })


