-- csgn plugins
--
local fn = vim.fn



-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end


-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


-- Install your plugins here
return packer.startup(function(use)
	use "wbthomason/packer.nvim" -- Have packer manage itself
	use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
	use 'kyazdani42/nvim-web-devicons'
	use 'bluz71/vim-moonfly-colors'
	use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
	use "numToStr/Comment.nvim" -- Easily comment stuff
	use { 'kartikp10/noctis.nvim', requires = { 'rktjmp/lush.nvim' } }


    -- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'nvim-telescope/telescope-media-files.nvim'

	-- Treesitter
  	use {
    	"nvim-treesitter/nvim-treesitter",
    	run = ":TSUpdate",
	}

	use "p00f/nvim-ts-rainbow"
  	use "nvim-treesitter/playground"

	-- Comments
  	use 'JoosepAlviste/nvim-ts-context-commentstring'

	-- HOP
	use {
  		'phaazon/hop.nvim',
  		branch = 'v2', -- optional but strongly recommended
  		config = function()
    		-- you can configure Hop the way you like here; see :h hop-config
    		require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  		end
	}


	-- COC
	use {'neoclide/coc.nvim', branch = 'release'}

	use 'matbme/JABS.nvim'

  	use 'nvim-lualine/lualine.nvim'

	use 'kyazdani42/nvim-tree.lua'

	use "akinsho/bufferline.nvim"


	  -- Automatically set up your configuration after cloning packer.nvim
	  -- Put this at the end after all plugins
	  if PACKER_BOOTSTRAP then
		require("packer").sync()
	  end
end)
