require("init-packer")

if vim.fn.exists('g:vscode') == 0 then
  vim.o.number = true
  vim.o.tabstop = 4
  vim.o.shiftwidth = 4
  vim.o.expandtab = true
  vim.o.list = true
  vim.o.listchars = "tab:> ,space:."
  vim.o.cursorline = true
end

vim.g.mapleader = ' '
