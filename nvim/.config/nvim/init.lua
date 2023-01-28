--
-- init.lua
--
require("core.options")
require("core.mappings")
require("core.plugins")
-- plugin configs read automatically from: after/plugin/*.lua

-- Auto reload plugins every time the plugins file is saved
-- insiration taken from https://www.youtube.com/watch?v=9gUatBHuXE0
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("AutoReloadPlugins", { clear = true }),
  pattern = "plugins.lua",
  callback = function()
    vim.cmd("source %")
    vim.cmd('PackerSync')
    
  end,
})
