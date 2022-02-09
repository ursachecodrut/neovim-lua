-- ------------------------
-- Plugin manager configuration file
-- ------------------------

local fn = vim.fn

-- Automatically install packer
-- Autocommand that reloads neovim whenever you save the plugins.lua file
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

return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- packer

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'

    -- autocomplete
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'saadparwaiz1/cmp_luasnip',
            },
    }

    -- treesitter
    use 'nvim-treesitter/nvim-treesitter'


    -- autopair
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    }

    use 'tpope/vim-fugitive'

    use 'olimorris/onedarkpro.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
