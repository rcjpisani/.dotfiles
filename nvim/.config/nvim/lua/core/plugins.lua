-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Colors
  -- use({ 'rose-pine/neovim', as = 'rose-pine', })
  use({ 'nanotech/jellybeans.vim' })
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-telescope/telescope-symbols.nvim' } -- emoji source for telescope

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'kyazdani42/nvim-web-devicons', opt = true },
      { 'nvim-treesitter' },
      { 'rinx/nvim-ripgrep' },
      { 'nvim-telescope/telescope-fzf-native.nvim' },
    }
  }

  -- Version control
  use('tpope/vim-fugitive') -- Git integration
  use 'mbbill/undotree'     -- visualize local undo tree

  -- visual aids
  use('airblade/vim-gitgutter')
  use 'Yggdroot/indentLine'
  use 'mrjones2014/nvim-ts-rainbow' -- use treesitter to color delimiter pairs

  -- string manipulation
  use 'AndrewRadev/splitjoin.vim' -- Split/Join ruby hashes, arglists, etc
  use 'AndrewRadev/switch.vim'    -- Automate common substitutions
  use 'AndrewRadev/tagalong.vim'  -- Change closing html-ish tags automatically
  use 'tpope/vim-commentary'      -- Commenting shortcuts gc
  use 'tpope/vim-surround'        -- change surrounding text object cs<char><new>


  use 'editorconfig/editorconfig-vim' -- Editorconfig support

  -- Languages
  use {
    'vim-ruby/vim-ruby',
    config = function()
      vim.cmd('runtime macros/matchit.vim')
    end,
  }
  use 'tpope/vim-rails'           -- Rails support
  use 'vim-test/vim-test'         -- run tests from vim
  use 'tpope/vim-bundler'
  use 'kana/vim-textobj-user'     -- requirement of vim-textobj-ruby
  use 'rhysd/vim-textobj-ruby'    -- make vim understand ruby blocks as motions
  use 'nelstrom/vim-textobj-rubyblock'
  use 'othree/html5.vim'

  use({
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup()
    end
  })

  -- Command line info
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use 'vimwiki/vimwiki'

  -- LSP Zero
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  -- Lua
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use { "RRethy/vim-illuminate" }

  -- embedded debugger
  use { 'mfussenegger/nvim-dap' }
  use { 'suketa/nvim-dap-ruby' }
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use { 'theHamsta/nvim-dap-virtual-text' }
  use { 'nvim-telescope/telescope-dap.nvim' }

  use 'RRethy/nvim-base16'
  use 'folke/lsp-colors.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end,

config = { display = { open_fn = require('packer.util').float, } }

})

