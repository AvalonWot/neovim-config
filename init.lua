require("init-packer")
local api = vim.api

if vim.fn.exists('g:vscode') == 0 then
  vim.o.number = true
  vim.o.tabstop = 4
  vim.o.shiftwidth = 4
  vim.o.expandtab = true
  vim.o.list = true
  vim.o.listchars = "tab:> ,space:."
  vim.o.cursorline = true
  vim.o.termguicolors = true
  vim.o.background = 'dark'
else
  --au BufRead,BufNewFile * startinsert
  api.nvim_create_autocmd(
    { "BufEnter", "BufRead", "BufNewFile"},
    {pattern="*", command="startinsert"}
  )
end

vim.g.mapleader = ' '
