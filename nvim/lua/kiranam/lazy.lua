
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

    {
        "nvim-neorg/neorg",
        dependencies = { "luarocks.nvim" },
        lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = "*", -- Pin Neorg to the latest stable release
        config = true,
    },

    {"catppuccin/nvim", name = "catppuccin",},

    {
        'nvim-telescope/telescope.nvim',
        version = "0.1.6",
	    -- or                            , branch = '0.1.x',
	    dependencies = { {'nvim-lua/plenary.nvim'} }
    },

    {
        "vhyrro/luarocks.nvim",
        priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
        config = true,
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

    'nvim-treesitter/playground',
    'theprimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',

    {
	    'VonHeikemen/lsp-zero.nvim',
	    dependencies =
        {
	        --lsp support
	        'neovim/nvim-lspconfig',
	        'williamboman/mason.nvim',
	        'williamboman/mason-lspconfig.nvim',

	        --AutoComplete
	        'hrsh7th/nvim-cmp',
	        'hrsh7th/cmp-buffer',
	        'hrsh7th/cmp-path',
	        'saadparwaiz1/cmp_luasnip',
	        'hrsh7th/cmp-nvim-lsp',
	        'hrsh7th/cmp-nvim-lua',

	        --Snippets
	        'L3MON4D3/LuaSnip',
	        'rafamadriz/friendly-snippets',
        }
    },

})
