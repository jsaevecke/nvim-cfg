-- Treesitter: install parsers and configure the context header.
-- Requires tree-sitter-cli >= 0.26.1 (cargo install tree-sitter-cli).
require('nvim-treesitter').install({
    "bash", "rust", "gitignore",
    "go", "gomod", "gosum", "gotmpl",
    "lua", "vim", "vimdoc", "query",
    "graphql", "helm", "dockerfile", "proto",
})

-- Enable treesitter-based syntax highlighting for every buffer.
-- The nvim-treesitter main branch no longer auto-enables highlighting;
-- it must be started manually via vim.treesitter.start(). pcall silently
-- ignores filetypes that have no parser installed.
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("treesitter-highlight", { clear = true }),
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})

-- treesitter-context: sticky header showing the enclosing scope at the top of
-- the window. max_lines = 0 means "as many lines as needed".
require('treesitter-context').setup {
    enable             = true,
    max_lines          = 0,
    min_window_height  = 0,
    line_numbers       = true,
    multiline_threshold = 20,
    trim_scope         = 'outer',
    mode               = 'cursor',
    separator          = nil,
    zindex             = 20,
    on_attach          = nil,
}
