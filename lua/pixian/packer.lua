-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use('folke/tokyonight.nvim')
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/nvim-treesitter-context')
    use('nvim-treesitter/playground')
    use('mbbill/undotree')
    use('theprimeagen/harpoon')
    use('tpope/vim-fugitive')
    use('github/copilot.vim')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
            -- Folds
            { 'kevinhwang91/nvim-ufo',            requires = 'kevinhwang91/promise-async' },
        }
    }
    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    go = { "gofmt", "goimports" },
                    ["graphql"] = { "prettier" },
                    ["gql"] = { "prettier" },
                },
                format_on_save = {
                    -- I recommend these options. See :help conform.format for details.
                    lsp_fallback = true,
                    timeout_ms = 500,
                },
                -- If this is set, Conform will run the formatter asynchronously after save.
                -- It will pass the table to conform.format().
                -- This can also be a function that returns the table.
                format_after_save = {
                    lsp_fallback = true,
                },
            })
        end
    })                            -- Auto Formatter
    use('fatih/vim-go')           -- Go support
    use('mfussenegger/nvim-lint') -- Linter
    use {
        'folke/trouble.nvim',
        requires = 'nvim-tree/nvim-web-devicons',
    }
    use('xiyaowong/transparent.nvim')
end)
