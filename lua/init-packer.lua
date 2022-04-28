local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Load my plugin
  local vscode = "vim.fn.exists('g:vscode') ~= 0"
  local term = "vim.fn.exists('g:vscode') == 0"

  use {'easymotion/vim-easymotion', cond=term}
  use {'asvetliakov/vim-easymotion', cond=vscode, as='vsc-easymotion'}
  use {'ur4ltz/surround.nvim', config=function() require'surround'.setup{mappings_style='sandwich'} end}
  use {'sainnhe/gruvbox-material', cond=term, config=function() vim.cmd[[colorscheme gruvbox-material]] end }
  use {'nvim-treesitter/nvim-treesitter', cond=term, run=':TSUpdate', config=function()
    require'nvim-treesitter.configs'.setup {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true
      }
    }
  end}


  if packer_bootstrap then
    require('packer').sync()
  end
end)
