
function RTags()
  vim.cmd [[!ctags -f .tags --languages=ruby --exclude=.git -R .]]
end

vim.keymap.set("n", "rT", RTags)
