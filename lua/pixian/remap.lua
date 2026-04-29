-- Key mappings and autocommands.
-- Leader is defined in set.lua; no need to re-declare it here.

-- ── General ──────────────────────────────────────────────────────────────────

-- Open netrw file explorer.
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Half-page scroll keeping cursor centred.
vim.keymap.set("n", "<C-d>", "<C-D>zz")
vim.keymap.set("n", "<C-u>", "<C-U>zz")
-- Keep search matches centred and fold-open.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- ── Linting ───────────────────────────────────────────────────────────────────

-- Run linter automatically on enter, write, and leaving insert mode.
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = vim.api.nvim_create_augroup('nvim-lint', { clear = true }),
    callback = function()
        require('lint').try_lint()
    end,
})

-- Briefly highlight yanked text.
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Manual lint trigger.
vim.keymap.set("n", "<leader>l", function()
    require('lint').try_lint()
end, { desc = "Lint current file" })

-- ── Go (vim-go) ───────────────────────────────────────────────────────────────

vim.g.go_test_timeout = '120s'
vim.keymap.set("n", "<leader>t",   ":GoTestFunc<CR>",   { desc = "Go Test Function" })
vim.keymap.set("n", "<leader>T",   ":GoTest<CR>",        { desc = "Go Test All" })
vim.keymap.set("n", "<leader>DS",  ":GoDebugStart<CR>",  { desc = "Go Debug Start" })
vim.keymap.set("n", "<leader>DOC", ":GoDoc<CR>",         { desc = "Go Doc" })

-- ── Copilot Chat ──────────────────────────────────────────────────────────────

-- Toggle the chat window in normal mode.
vim.keymap.set('n', '<leader>cc', '<cmd>CopilotChatToggle<cr>', { desc = 'Toggle Copilot Chat' })
-- Open chat with the visual selection as context.
vim.keymap.set('v', '<leader>cc', '<cmd>CopilotChat<cr>',       { desc = 'Copilot Chat with selection' })
