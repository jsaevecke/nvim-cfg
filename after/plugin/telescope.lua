-- Telescope fuzzy finder key mappings.
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', 'C-p',        builtin.git_files,  { desc = "Find git-tracked files" })
-- Grep for a fixed string entered at the prompt.
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep string" })
-- Live grep (updates as you type).
vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = "Live grep" })
