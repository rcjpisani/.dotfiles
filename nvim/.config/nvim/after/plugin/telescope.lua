local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>p', builtin.find_files,      { desc = 'Find [P]ath (telescope)' })
vim.keymap.set('n', '<C-p>',     builtin.git_files,       { desc = 'Find [P]ath (telescope)' })

vim.keymap.set('n', '<leader>f', builtin.live_grep,       { desc = '[F]ind (telescope)' })
vim.keymap.set('n', '<C-f>',     builtin.live_grep,       { desc = '[F]ind (telescope)' })

vim.keymap.set('n', '<leader>b', builtin.buffers,         { desc = '[B]uffers (telescope)' })
vim.keymap.set('n', 'gb',        builtin.buffers,         { desc = '[B]uffers (telescope)' })

vim.keymap.set('n', '<leader>o', builtin.oldfiles,        { desc = 'Recently [O]pened files (telescope)' })

vim.keymap.set('n', '<leader>h', builtin.help_tags,       { desc = '[G]o [H]elp (telescope)'})
vim.keymap.set('n', 'gh',        builtin.help_tags,       { desc = '[G]o [H]elp (telescope)'})

vim.keymap.set('n', '<leader>r', builtin.grep_string,     { desc = '[A]ppearances (telescope)', noremap = true })
vim.keymap.set('n', 'gr',        builtin.grep_string,     { desc = '[G]rep [R]eferences (telescope)', noremap = true })

vim.keymap.set('n', '<leader>k', builtin.keymaps,         { desc = '[K]eymaps (telescope)', noremap = true })
vim.keymap.set('n', '<leader>:', builtin.command_history, { desc = '[C]ommand history (telescope)', noremap = true })
vim.keymap.set('n', '<leader>c', builtin.colorscheme,     { desc = '[C]olorchemes (telescope)', noremap = true })
vim.keymap.set('n', 'gt',        builtin.tags,            { desc = '[G]o to C[T]ags (telescope)', noremap = true })

vim.keymap.set('n', '<leader>e', function()
  builtin.symbols({ sources = {'emoji'} })
end,         { desc = '[E]mojis (telescope)',noremap = true })

-- vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer]' })
-- E5108: Error executing lua: ...r/start/telescope.nvim/lua/telescope/builtin/__files.lua:413: attempt to call method '_get_hl_from_capture' (a nil value) 

-- Emulate fzf's Ag:
vim.keymap.set('n', '<leader>s', function()
  builtin.grep_string({ search = "", only_sort_text = true });
end, { desc = '[S]earch (path and content) (telescope)', noremap = true })

-- make telescope layout appropiate to window aspect ratio
require("telescope").setup{
    defaults = {
        layout_strategy = "flex",
        layout_config = {
            flex = {
                flip_columns = 120,
            },
        },
    },
}
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

