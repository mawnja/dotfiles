vim.g.python_version = 3.8
vim.g.python3_host_prog = "~/.local/bin/python3.8"

vim.g.loaded_perl_provider = 0

-- 编码方式 utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"

-- jkhl 移动时光标周围保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.wo.number = true --显示行号
vim.wo.relativenumber = true --使用相对行号
vim.wo.numberwidth = 4

-- 高亮所在行
vim.wo.cursorline = true
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 右侧参考线
vim.wo.colorcolumn = "160"
-- 缩进字符
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true

-- >> << 时移动长度
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
-- 空格替代
vim.o.expandtab = true
vim.bo.expandtab = true
-- 新行对齐当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 搜索不要高亮
vim.o.hlsearch = true
vim.o.incsearch = true

-- 命令模式行高
vim.o.cmdheight = 2
-- 自动加载外部修改
vim.o.autoread = true
vim.bo.autoread = true

-- 禁止折行
vim.wo.wrap = false
-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.o.whichwrap = "<,>,[,]"
-- 允许隐藏被修改过的buffer
vim.o.hidden = true
-- 鼠标支持
vim.o.mouse = "a"
-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- smaller updatetime
vim.o.updatetime = 100
 
vim.o.timeoutlen = 500
 
vim.o.splitbelow = true
vim.o.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- disable netrw at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 样式
vim.o.background = "light"
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.list = false
vim.o.listchars = "space:·,tab:>-"
 
vim.o.wildmenu = true
 
vim.o.shortmess = vim.o.shortmess .. "c"
-- 补全显示10行
vim.o.pumheight = 10
vim.o.clipboard = "unnamedplus"

vim.o.showtabline = 2

--#vim.wo.foldmethod = "expr" --"marker" --"expr"
--vim.wo.foldmarker = "{{{,}}}"
--#vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
--#vim.o.foldtext = [[getline(v:foldstart) . ' ' . (v:foldend - v:foldstart + 1) . ' lines ' . (v:folddashes ? '+' : '-')]]
--vim.o.foldtext = [[substitute(getline(v:foldstart),'{{{','-','') . ' ' . (v:foldend - v:foldstart + 1) . ' lines ']]

vim.o.modifiable = true

vim.g.bufferline_show_bufnr = 1

--vim.cmd("filetype plugin indent on")
--autocmd FileType apache setlocal commentstring=#\ %s

--##
-- 定义自定义高亮组
--vim.cmd([[ highlight CocHighlightText guifg=#ffffff guibg=#ff0000 gui=underline]])
-- 配置 Coc 插件使用自定义高亮组
--vim.g.coc_default_semantic_highlight_groups = 0
-- 设置自动命令
--vim.api.nvim_command('autocmd! CursorHold * silent call CocActionAsync("highlight")')

--自定义函数，用于将上一行内容拷贝到当前行
function YankPreviousLine()
  -- 移动到上一行并复制内容
  vim.cmd('normal! kyy')
  -- 移动回当前行并粘贴
  vim.cmd('normal! jP')
end

-- 将上一行内容拷贝到当前行
vim.keymap.set('n', '<C-P>', ':lua YankPreviousLine()<CR>', opt)

vim.cmd([[
    :hi      NvimTreeExecFile    guifg=#ffa0a0
    :hi      NvimTreeSpecialFile guifg=#ff80ff gui=underline
    :hi      NvimTreeSymlink     guifg=Yellow  gui=italic
    :hi link NvimTreeImageFile   Title
]])
