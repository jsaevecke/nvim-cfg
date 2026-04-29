-- nvim-treesitter main branch (Neovim 0.12+).
-- Highlighting is handled natively by Neovim via built-in treesitter support.
-- Pre-compiled parsers in nvim-treesitter/parser/ are loaded automatically.
-- To install/update parsers: install tree-sitter-cli (cargo install tree-sitter-cli)
-- then run :TSInstall <lang> or :TSUpdate.

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
