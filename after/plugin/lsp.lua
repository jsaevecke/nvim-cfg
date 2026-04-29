-- LSP, completion, and fold configuration.
local lsp_zero = require('lsp-zero')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

-- Load VSCode-style snippets bundled with installed language servers.
require('luasnip.loaders.from_vscode').lazy_load()

-- Enable LSP-backed code folding (pairs with fold options below).
require('ufo').setup()

-- ── LSP server configurations (Neovim 0.11+ native API) ──────────────────────

-- Lua: suppress "vim/require not found" warnings in Neovim config files.
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime    = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim', 'require' } },
            workspace  = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry  = { enable = false },
        },
    },
})
vim.lsp.enable('lua_ls')

-- YAML: standard filetypes only (Helm templates are handled by helm_ls).
vim.lsp.config('yamlls', {
    filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
})
vim.lsp.enable('yamlls')

-- Helm: delegates yaml sub-files to yaml-language-server.
vim.lsp.config('helm_ls', {
    settings = {
        ['helm-ls'] = {
            yamlls = { path = "yaml-language-server" }
        }
    }
})
vim.lsp.enable('helm_ls')

-- Go: include custom build-tag groups for integration and VPN tests.
vim.lsp.config('gopls', {
    settings = {
        gopls = {
            buildFlags = { "-tags=integration unit integration_vpn" },
        },
    },
})
vim.lsp.enable('gopls')

-- ── Fold settings (required by nvim-ufo) ─────────────────────────────────────

vim.o.foldcolumn    = '1'
vim.o.foldlevel     = 99  -- Open all folds by default.
vim.o.foldlevelstart = 99
vim.o.foldenable    = true

-- ── LSP key mappings (applied per-buffer on attach) ──────────────────────────

-- Restart the LSP server for the current buffer (global mapping, registered once).
vim.keymap.set("n", "<leader>lr", ":LspRestart<CR>", { desc = "Restart LSP server", noremap = true, silent = true })

lsp_zero.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd",         function() vim.lsp.buf.definition() end,      opts)
    vim.keymap.set("n", "K",          function() vim.lsp.buf.hover() end,           opts)
    vim.keymap.set("n", "<leader>vws",function() vim.lsp.buf.workspace_symbol() end,opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,   opts)
    vim.keymap.set("n", "[d",         function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
    vim.keymap.set("n", "]d",         function() vim.diagnostic.jump({ count =  1, float = true }) end, opts)
    vim.keymap.set("n", "<leader>vca",function() vim.lsp.buf.code_action() end,     opts)
    vim.keymap.set("n", "<leader>vrr",function() vim.lsp.buf.references() end,      opts)
    vim.keymap.set("n", "<leader>vrn",function() vim.lsp.buf.rename() end,          opts)
    vim.keymap.set("i", "<C-h>",      function() vim.lsp.buf.signature_help() end,  opts)
    vim.keymap.set("n", "zR",         require('ufo').openAllFolds)
    vim.keymap.set("n", "zM",         require('ufo').closeAllFolds)
end)

-- Advertise folding capabilities so servers send fold ranges.
lsp_zero.set_server_config({
    capabilities = {
        textDocument = {
            foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
            }
        }
    }
})

-- ── Mason: auto-install servers ───────────────────────────────────────────────

mason.setup({})
mason_lspconfig.setup({
    ensure_installed = {
        'lua_ls', 'gopls', 'graphql', 'sqls',
        'dockerls', 'rust_analyzer', 'lemminx',
        'helm_ls', 'pylsp',
    },
    handlers = {
        lsp_zero.default_setup,
        -- Servers configured via vim.lsp.config/enable skip lsp_zero setup.
        lua_ls  = function() end,
        gopls   = function() end,
        yamlls  = function() end,
        helm_ls = function() end,
    }
})

-- ── nvim-cmp completion ───────────────────────────────────────────────────────

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer',  keyword_length = 3 },
    },
    formatting = lsp_zero.cmp_format({ details = false }),
    mapping = cmp.mapping.preset.insert({
        ['<C-p>']     = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>']     = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>']     = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
})
