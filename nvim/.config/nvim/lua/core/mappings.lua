--
-- Mappings
--

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- open config file
vim.keymap.set('n', '<leader>i', '<ESC>:e $MYVIMRC<cr>', { desc = 'Go to [I]nit.lua'})

-- Indent whole file and jump back to last edit position
vim.keymap.set("n", "<leader>=", "ggVG=`.", { desc = '[=] Reindent file' })

-- Previous and next buffer
vim.keymap.set('n', '<leader>n', '<esc>:bn<cr>', { desc = '[N]ext buffer' })
vim.keymap.set('n', '<leader>N', '<esc>:bp<cr>', { desc = '[P]previous buffer' })

-- Open explorer
vim.keymap.set("n", "-", vim.cmd.Explore)

-- Toggle cursor crosshair
vim.keymap.set("n", "<leader>+", function()
  -- vim.opt.cursorline = not vim.opt.cursorline
  -- vim.opt.cursorcolumn = not vim.opt.cursorcolumn
  -- Halp! i can't even Lua properly
  vim.cmd [[
  set cursorline!
  set cursorcolumn!
  ]]
end,{ desc = '[+] Show cursor line and column' })

-- Remove last search term highlight
vim.keymap.set("n", "<leader>h", vim.cmd.noh, { desc = 'Hide search [H]ighlighs'})
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- goto definition (ctags) -- moved to telescope
-- vim.keymap.set('n', 'gt', '<ESC>g]')

-- "" Region indent/outdent
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<S-Tab>', '<gv')
vim.keymap.set('v', '<Tab>', '>gv')

-- "" Select text after paste
-- nnoremap gp `[v`]
vim.keymap.set('n', 'gp', '`[v`]')

-- Move cursor across soft wraps
vim.keymap.set('v', '<Right>', 'l', { silent = true })
vim.keymap.set('v', '<Left>', 'h', { silent = true })
vim.keymap.set('v', '<Up>', 'gk', { silent = true })
vim.keymap.set('v', '<Down>', 'gj', { silent = true })
vim.keymap.set('n', '<Right>', 'l', { silent = true })
vim.keymap.set('n', '<Left>', 'h', { silent = true })
vim.keymap.set('n', '<Up>', 'gk', { silent = true })
vim.keymap.set('n', '<Down>', 'gj', { silent = true })
vim.keymap.set('i', '<Up>', '<C-o>gk', { silent = true })
vim.keymap.set('i', '<Down>', '<C-o>gj', { silent = true })

-- "" Bubbling Text
-- " Bubble single lines
vim.keymap.set('n', '<C-Up>', 'ddkP')
vim.keymap.set('n', '<C-Down>', 'ddp')
vim.keymap.set('n', '<C-k>', 'ddkP')
vim.keymap.set('n', '<C-j>', 'ddp')
-- " Bubble multiple lines
vim.keymap.set('v', '<C-Up>', 'xkP`[V`]=gv')
vim.keymap.set('v', '<C-Down>', 'xp`[V`]=gv')
vim.keymap.set('v', '<C-k>', 'xkP`[V`]=gv')
vim.keymap.set('v', '<C-j>', 'xp`[V`]=gv')

-- " Ctrl-C, Ctrl-V option for copy/paste
vim.keymap.set('v', '<C-c>', '"+yi')
vim.keymap.set('v', '<C-x>', '"+c')
vim.keymap.set('v', '<C-v>', 'c<ESC>"+p')
vim.keymap.set('i', '<C-v>', '<ESC>"+pa')

-- " Shift arrows to select
vim.keymap.set('i', '<S-Down>', '<ESC>lvj')
vim.keymap.set('v', '<S-Down>', 'j')
vim.keymap.set('n', '<S-Down>', 'vj')

vim.keymap.set('i', '<S-Up>', '<ESC>vk')
vim.keymap.set('v', '<S-Up>', 'k')
vim.keymap.set('n', '<S-Up>', 'vk')

vim.keymap.set('i', '<S-Right>', '<ESC>vl')
vim.keymap.set('v', '<S-Right>', 'l')
vim.keymap.set('n', '<S-Right>', 'vl')

vim.keymap.set('i', '<S-Left>', '<ESC>vh')
vim.keymap.set('v', '<S-Left>', 'h')
vim.keymap.set('n', '<S-Left>', 'vh')

-- " <F12> " Invisible characters and colors
vim.keymap.set('n', '<F12>', ':set list!<CR>')
vim.keymap.set('v', '<F12>', '<ESC>:set list!<CR>gv')
vim.keymap.set('i', '<F12>', '<ESC>:set list!<CR>i')

vim.keymap.set('n', 'Q', '<nop>')
