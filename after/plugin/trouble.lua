-- trouble.nvim + Telescope integration.
-- Binds <C-t> inside Telescope pickers to send results directly into a
-- Trouble window instead of the quickfix list.
local trouble   = require("trouble.sources.telescope")
local telescope = require("telescope")

telescope.setup {
    defaults = {
        mappings = {
            i = { ["<c-t>"] = trouble.open },
            n = { ["<c-t>"] = trouble.open },
        },
    },
}

-- ── Trouble key mappings ──────────────────────────────────────────────────────

local Trouble = require("trouble")

vim.keymap.set("n", "<leader>xx", function() Trouble.toggle("diagnostics") end,           { desc = "Trouble: diagnostics" })
vim.keymap.set("n", "<leader>xw", function() Trouble.toggle("workspace_diagnostics") end, { desc = "Trouble: workspace diagnostics" })
vim.keymap.set("n", "<leader>xd", function() Trouble.toggle("document_diagnostics") end,  { desc = "Trouble: document diagnostics" })
vim.keymap.set("n", "<leader>xq", function() Trouble.toggle("quickfix") end,              { desc = "Trouble: quickfix" })
vim.keymap.set("n", "<leader>xl", function() Trouble.toggle("loclist") end,               { desc = "Trouble: loclist" })
vim.keymap.set("n", "gR",         function() Trouble.toggle("lsp_references") end,        { desc = "Trouble: LSP references" })
