-- Harpoon key mappings for quick per-project file bookmarks.
local mark = require("harpoon.mark")
local ui   = require("harpoon.ui")

-- Mark current file and open the quick-menu.
vim.keymap.set("n", "<leader>a", mark.add_file,       { desc = "Harpoon: mark file" })
vim.keymap.set("n", "<C-e>",     ui.toggle_quick_menu, { desc = "Harpoon: toggle menu" })

-- Jump directly to harpooned files 1-4.
vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, { desc = "Harpoon: file 1" })
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end, { desc = "Harpoon: file 2" })
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end, { desc = "Harpoon: file 3" })
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end, { desc = "Harpoon: file 4" })
