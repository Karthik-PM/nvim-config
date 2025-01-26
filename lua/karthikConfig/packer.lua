-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`

--@diagnostic disable: undefined-global, lowercase-global
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer can manage itself
    -- use 'wbthomason/packer.nvim'
    use {'wbthomason/packer.nvim', opt=true}
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    --
    -- use({ 
    --     'rose-pine/neovim', as = 'rose-pine' ,
    --     config = function()
    --         vim.cmd('colorscheme rose-pine')
    --     end
    -- })
    -- --lsp
    use{
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    -- use('preservim/nerdtree')

    use "nvim-tree/nvim-tree.lua"
    use('lukas-reineke/indent-blankline.nvim')
    use{
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
    }
    use{
        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},

    }
    use{
        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
    }
    --comment
    use('tpope/vim-commentary');
    --
    use { 'neoclide/coc.nvim', branch='release' }
    use 'lervag/vimtex'
    use('nanozuki/tabby.nvim')
    use 'bryanmylee/vim-colorscheme-icons'
    use 'tiagofumo/vim-nerdtree-syntax-highlight'
    use 'nvim-tree/nvim-web-devicons'
    use 'Xuyuanp/nerdtree-git-plugin'  -- Git integration for NERDTree
    use('hrsh7th/vim-vsnip')
    use('hrsh7th/vim-vsnip-integ')
    use { "ellisonleao/gruvbox.nvim" }
    use {'stevearc/vim-vscode-snippets'}
    use {'marko-cerovac/material.nvim'}
    use {"akinsho/toggleterm.nvim"}
    -- use ('DaikyXendo/nvim-material-icon')
    use {'loctvl842/monokai-pro.nvim'}
    -- vim status bar ( lua line )
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    --themes
    use { "scottmckendry/cyberdream.nvim" }
    use 'navarasu/onedark.nvim'
    use "goolord/alpha-nvim"
    -- greeter starter
end)
