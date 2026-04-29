-- Plugin manager configuration using packer.nvim.
-- Load this file via `lua require('pixian.packer')` from init.lua.

-- Bootstrap: load packer from the optional packages path.
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    -- ── AI Assistance ────────────────────────────────────────────────────────

    -- GitHub Copilot inline completions
    use('github/copilot.vim')

    -- Copilot Chat: interactive AI chat panel (tasks, explanations, refactors)
    use {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "main",
        requires = {
            { "github/copilot.vim" },
            { "nvim-lua/plenary.nvim" },
        },
        config = function()
            require("CopilotChat").setup({})
        end,
    }

    -- ── Appearance ───────────────────────────────────────────────────────────

    -- Tokyo Night colorscheme
    use('folke/tokyonight.nvim')

    -- Toggle background transparency (works with terminal transparency)
    use('xiyaowong/transparent.nvim')

    -- ── Navigation & Search ──────────────────────────────────────────────────

    -- Fuzzy finder over files, buffers, git, LSP symbols, and more
    use {
        'nvim-telescope/telescope.nvim',
        branch = 'master',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Quick file marks with per-project jump lists
    use('theprimeagen/harpoon')

    -- ── Syntax & Treesitter ──────────────────────────────────────────────────

    -- Tree-sitter: incremental parsing for accurate highlighting and text objects
    use({
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        run = ':TSUpdate'
    })

    -- Sticky context header showing the current function / class scope
    use('nvim-treesitter/nvim-treesitter-context')

    -- ── LSP & Completion ─────────────────────────────────────────────────────

    -- lsp-zero: opinionated LSP + completion setup with sane defaults
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- Portable package manager for LSP servers, DAP, linters, formatters
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Core LSP client configuration
            { 'neovim/nvim-lspconfig' },

            -- Completion engine and LSP source
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },

            -- Snippet engine (required by nvim-cmp)
            { 'L3MON4D3/LuaSnip' },

            -- Code folding powered by LSP / treesitter
            { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' },
        }
    }

    -- ── Formatting ───────────────────────────────────────────────────────────

    -- conform.nvim: formatter runner with format-on-save support
    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    go       = { "gofmt", "goimports" },
                    graphql  = { "prettier" },
                    gql      = { "prettier" },
                    ["_"]    = { "prettier" }, -- fallback for all other filetypes
                },
                -- Synchronous format triggered on BufWritePre
                format_on_save = {
                    lsp_fallback = true,
                    timeout_ms = 500,
                },
                -- Asynchronous format triggered after BufWritePost
                format_after_save = {
                    lsp_fallback = true,
                },
            })
        end
    })

    -- ── Linting ──────────────────────────────────────────────────────────────

    -- nvim-lint: asynchronous linter dispatcher (runs linters on save / events)
    use('mfussenegger/nvim-lint')

    -- ── Language Support ─────────────────────────────────────────────────────

    -- vim-go: rich Go development tooling (build, test, debug, generate, etc.)
    use('fatih/vim-go')

    -- ── Diagnostics ──────────────────────────────────────────────────────────

    -- trouble.nvim: pretty diagnostics, references, quickfix, and location list
    -- Using h-michael's fork while the upstream '_on_line' fix awaits merge.
    use {
        'h-michael/trouble.nvim',
        branch = 'fix/decoration-provider-api',
        requires = 'nvim-tree/nvim-web-devicons',
    }

    -- ── Git ──────────────────────────────────────────────────────────────────

    -- vim-fugitive: full Git integration (:G, :Gdiff, :Gblame, etc.)
    use('tpope/vim-fugitive')

    -- ── Utilities ────────────────────────────────────────────────────────────

    -- undotree: visual undo history browser
    use('mbbill/undotree')
end)
