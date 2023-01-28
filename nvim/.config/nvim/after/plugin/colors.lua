--
-- COLORS --
--

vim.opt.termguicolors = true
local theme = "base16-tomorrow-night"

function SetColor(color)
  color = color or theme
  vim.cmd.colorscheme(color)
end

SetColor(theme)
