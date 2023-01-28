--
-- OPTIONS
--

-- o.background = 'dark'

-- Do not save when switching buffers
vim.opt.hidden = true

-- sensible defaults from https://www.youtube.com/watch?v=J9yqSdvAKXY
vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true -- save the file before leaving if changed
vim.opt.autoread = true -- auto load file changes occured outside vim
-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true -- round indent to sw compatible
vim.opt.expandtab = true


-- Decrease update time
vim.opt.timeoutlen = 500
vim.opt.updatetime = 50 -- primeagen value

-- Number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 8

-- Better editor UI
vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes:2'
vim.opt.cursorline = true
vim.opt.colorcolumn = '80'

-- Better editing experience
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.cindent = true
vim.opt.autoindent = true
vim.opt.wrap = true
vim.opt.textwidth = 300
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.softtabstop = -1 -- If negative, shiftwidth value is used
vim.opt.list = false
vim.opt.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂,eol:⁋'
-- vim.opt.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
vim.opt.formatoptions = 'qrn1'

-- Makes neovim and host OS clipboard play nicely with each other
vim.opt.clipboard = 'unnamedplus'

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- vim.opt.hlsearch = true

-- Undo and backup options
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.directory = vim.fn.stdpath('data') .. 'tmp'
vim.opt.undodir = vim.fn.stdpath('data') .. 'undo'

-- Remember 1000 items in commandline history
vim.opt.history = 1000

-- Better buffer splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preserve view while jumping
-- vim.opt.jumpoptions = 'view'

-- (Exuberant/Universal) Ctags
vim.opt.tags = '.tags'

-- mouse mode
vim.opt.mouse = 'a'

if vim.fn.has('macunix') == 1 then
  vim.opt.guifont = "Fira Mono:h15:l"
end

if vim.fn.has('linux') == 1 then
  vim.opt.guifont = "Fira Mono:h11"
end
