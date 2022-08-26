require('packer').init({
  git = {
    default_url_format = 'git@github.com:%s'
  }
})

require('configs')
require('keymapping')

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons'
    },
    tag = 'nightly'
  }
  use 'dstein64/vim-startuptime'
  use 'neovim/nvim-lspconfig'
  use {
    'akinsho/bufferline.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'moll/vim-bbye'
    }
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons'
    }
  }
  use 'arkav/lualine-lsp-progress'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
end)
