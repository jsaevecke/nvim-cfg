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
