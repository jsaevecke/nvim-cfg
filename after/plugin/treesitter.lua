-- nvim-treesitter main branch (Neovim 0.12+).
-- Highlighting is handled natively by Neovim via built-in treesitter support.
-- Requires tree-sitter-cli >= 0.26.1: cargo install tree-sitter-cli
require('nvim-treesitter').install({
    "bash", "rust", "gitignore", "go", "gomod", "gosum", "gotmpl",
    "lua", "vim", "vimdoc", "query", "graphql", "helm", "dockerfile", "proto",
})

require('treesitter-context').setup {
    enable = true,
    max_lines = 0,
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 20,
    trim_scope = 'outer',
    mode = 'cursor',
    separator = nil,
    zindex = 20,
    on_attach = nil,
}
