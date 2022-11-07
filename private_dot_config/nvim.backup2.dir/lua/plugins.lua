-- Bootstraping
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

-- Plugins
return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- Packer sync
  if packer_init then
    require("packer").sync()
  end

  use({ "neoclide/coc.nvim", branch = "release" })

  -- Highly extendable fuzzy finder over lists
  use({
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  })

  -- Smart and Powerful commenting plugin for neovim 
  use({
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  })

  -- Provide a simple and easy way to use the interface for tree-sitter in Neovim and to provide some basic functionality such as highlighting based on it:
  use({
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
  })

  -- A File Explorer For Neovim Written In Lua
  use({
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  })

  use("vim-airline/vim-airline")
  use("majutsushi/tagbar")
  use("tpope/vim-fugitive")

  -- Lua fork of vim-devicons
  -- use("ryanoasis/vim-devicons")
  use("nvim-tree/nvim-web-devicons")
  
  -- use("tpope/vim-commentary")
  -- use("ctrlpvim/ctrlp.vim")

  -- use "vhdirk/vim-cmake"
  -- use("skywind3000/asyncrun.vim")

  use("ronakg/quickr-cscope.vim")
  -- use "xolox/vim-easytags"

  -- https://github.com/rcarriga/nvim-notify
  use("rcarriga/nvim-notify")

  use("tpope/vim-surround")

  use({
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  })

  use({
    "folke/tokyonight.nvim", branch = 'main'
  })
  use({
    "olimorris/onedarkpro.nvim"
  })

end)
