

-- make test commands execute using dispatch.vim
vim.g['test#strategy'] = "neovim"

vim.keymap.set("n", "<leader>tn", vim.cmd.TestNearest, { desc = '[T]est [N]earest' })
vim.keymap.set("n", "<leader>tf", vim.cmd.TestFile, { desc = '[T]est [F]ile' })
vim.keymap.set("n", "<leader>ts", vim.cmd.TestSuite, { desc = '[T]est [S]uite' })
vim.keymap.set("n", "<leader>tl", vim.cmd.TestLast, { desc = '[T]est [L]ast' })
vim.keymap.set("n", "<leader>tv", vim.cmd.TestVisit, { desc = '[T]est [V]isit' })
