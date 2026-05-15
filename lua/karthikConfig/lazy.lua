-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


return require('lazy').setup({
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    'christoomey/vim-tmux-navigator',
    --
    -- ({
    --     'rose-pine/neovim', as = 'rose-pine' ,
    --     config = function()
    --         vim.cmd('colorscheme rose-pine')
    --     end
    -- })
    -- --lsp
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    'mbbill/undotree',
    'tpope/vim-fugitive',
    -- ('preservim/nerdtree')

    "nvim-tree/nvim-tree.lua",
    ('lukas-reineke/indent-blankline.nvim'),
    {
        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },

    },
    {"nvim-treesitter/nvim-treesitter", branch = "master", build = ":TSUpdate"},
    {
        "3rd/image.nvim",
        build = false,
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "nvim-telescope/telescope-media-files.nvim",
        dependencies = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    },
    {
        -- Snippets
        { 'L3MON4D3/LuaSnip' },
        { 'rafamadriz/friendly-snippets' },
    },
    --comment
    'tpope/vim-commentary',
    --
    { 'neoclide/coc.nvim',           branch = 'release' },
    'lervag/vimtex',
    'nanozuki/tabby.nvim',
    'bryanmylee/vim-colorscheme-icons',
    'tiagofumo/vim-nerdtree-syntax-highlight',
    'nvim-tree/nvim-web-devicons',
    'Xuyuanp/nerdtree-git-plugin', -- Git integration for NERDTreem
    'hrsh7th/vim-vsnip',
    'hrsh7th/vim-vsnip-integ',
    { "ellisonleao/gruvbox.nvim" },
    { 'stevearc/vim-vscode-snippets' },
    { 'marko-cerovac/material.nvim' },
    { "akinsho/toggleterm.nvim" },
    -- 'DaikyXendo/nvim-material-icon'
    { 'loctvl842/monokai-pro.nvim' },
    -- vim status bar  lua line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },
    --themes
    { "scottmckendry/cyberdream.nvim" },
    'navarasu/onedark.nvim',
    "goolord/alpha-nvim",
    -- greeter starter
    -- AI Integration like curson
    "folke/which-key.nvim",
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
        opts = {
            -- add any opts here
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "echasnovski/mini.pick",     -- for file_selector provider mini.pick
            "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            "hrsh7th/nvim-cmp",          -- autocompletion for avante commands and mentions
            "ibhagwan/fzf-lua",          -- for file_selector provider fzf
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            "zbirenbaum/copilot.lua",    -- for providers='copilot'
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
        {
            'mvllow/modes.nvim',
            tag = 'v0.2.1',
            config = function()
                require('modes').setup()
            end
        }
    },
    -- Jupyter notebook combo
    {
        "benlubas/molten-nvim",
        version = "^1.0.0",
        build = ":UpdateRemotePlugins",
        dependencies = { "3rd/image.nvim" },
        init = function()
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 20
            vim.g.molten_auto_open_output = false
            vim.g.molten_wrap_output = true
            vim.g.molten_virt_text_output = true
        end,
    },
    {
        "GCBallesteros/jupytext.nvim",
        lazy = false,
        config = function()
            require("jupytext").setup({
                style = "hydrogen",
                output_extension = "py",
                force_ft = "python",
            })
        end,
    },
    {
        "GCBallesteros/NotebookNavigator.nvim",
        dependencies = {
            "echasnovski/mini.comment",
            "benlubas/molten-nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("notebook-navigator").setup({ activate_hydra_keys = nil })
        end,
    },
    { "echasnovski/mini.comment", version = "*" },
})
