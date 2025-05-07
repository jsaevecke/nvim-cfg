Trouble = require("trouble")

vim.g.mapleader = " "

-- GENERAL
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-d>", "<C-D>zz")
vim.keymap.set("n", "<C-u>", "<C-U>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- LINT
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    callback = function()
        require('lint').try_lint()
    end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.keymap.set("n", "<leader>l", function()
    require('lint').try_lint()
end, { desc = "Lint current file" })

-- VIM-GO
vim.g.go_test_timeout = '120s'
vim.keymap.set("n", "<leader>t", ":GoTestFunc<CR>", { desc = "Go Test Function" })
vim.keymap.set("n", "<leader>T", ":GoTest<CR>", { desc = "Go Test All" })
vim.keymap.set("n", "<leader>DS", ":GoDebugStart<CR>", { desc = "Go Debug Start" })
vim.keymap.set("n", "<leader>DOC", ":GoDoc<CR>", { desc = "Go Doc" })

-- TROUBLE
vim.keymap.set("n", "<leader>xx", function() Trouble.toggle("diagnostics") end)
vim.keymap.set("n", "<leader>xw", function() Trouble.toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() Trouble.toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() Trouble.toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() Trouble.toggle("loclist") end)
vim.keymap.set("n", "gR", function() Trouble.toggle("lsp_references") end)
