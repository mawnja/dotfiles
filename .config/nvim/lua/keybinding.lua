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

-- 使用 <TAB> 键进行代码补全
vim.api.nvim_set_keymap("i", "<TAB>", 'pumvisible() ? "<C-n>" : "<TAB>"', { noremap = true, expr = true })
vim.api.nvim_set_keymap("i", "<S-TAB>", 'pumvisible() ? "<C-p>" : "<C-h>"', { noremap = true, expr = true })

-- 使用 <CR> 键确认补全
vim.api.nvim_set_keymap("i", "<CR>", 'pumvisible() ? coc#_select_confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"', { noremap = true, expr = true })

-- ##vim-fold-cycle
vim.keymap.set("n", "<C-Right>", "<Plug>(FoldCycleToggle)")
vim.keymap.set("n", "<C-Left>", "<Plug>(FoldCycleToggle)")

-- ##flash.nvim
vim.keymap.set("n", "<C-s>", "<cmd>lua require('flash').jump()<cr>", opt)

