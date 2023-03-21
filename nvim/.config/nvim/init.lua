--
-- init.lua
--
require("core.options")
require("core.remap")
require("core.plugins")

-- plugin configs read automatically from: after/plugin/*.lua
local augroup = vim.api.nvim_create_augroup
local CoreGroup = augroup('CoreGroup', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = CoreGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

--
-- Auto reload plugins every time the plugins file is saved
-- inspiration taken from https://www.youtube.com/watch?v=9gUatBHuXE0
--
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("AutoReloadPlugins", { clear = true }),
  pattern = "plugins.lua",
  callback = function()
    vim.cmd("source %")
    vim.cmd('PackerSync')
    
  end,
})
