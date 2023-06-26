-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({ 
        'rose-pine/neovim', as = 'rose-pine' ,
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })
    use{
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('preservim/nerdtree')
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

    use { 'neoclide/coc.nvim', branch='release' }
    use 'lervag/vimtex'
    use('nanozuki/tabby.nvim')
    use('ryanoasis/vim-devicons')
    use('hrsh7th/vim-vsnip')
    use('hrsh7th/vim-vsnip-integ')
    use { "ellisonleao/gruvbox.nvim" }
end)
