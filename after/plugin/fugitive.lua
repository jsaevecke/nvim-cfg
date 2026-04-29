-- vim-fugitive: open the interactive Git status buffer.
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status (fugitive)" })
