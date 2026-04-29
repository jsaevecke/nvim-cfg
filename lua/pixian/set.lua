-- Editor options.

-- Block cursor in all modes (overrides terminal cursor shape).
vim.opt.guicursor = ""

-- Line numbers: absolute + relative for easy jump distances.
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation: 4-space soft tabs.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- No line wrapping.
vim.opt.wrap = false

-- Persistent undo: no swap/backup files; undo history survives restarts.
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search: no persistent highlight but incremental preview while typing.
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- True-colour support.
vim.opt.termguicolors = true

-- Keep 8 lines of context above/below the cursor when scrolling.
-- Always show the sign column so the gutter width never shifts.
-- Allow '@' in file-name patterns (needed for some LSP paths).
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Faster CursorHold / swap write (default 4000 ms is too slow for LSP).
vim.opt.updatetime = 50

-- Visual ruler at 160 characters.
vim.opt.colorcolumn = "160"

-- <Space> as leader key is set in init.lua before any module is loaded.
