-- nvim-lint: map filetypes to the linters that should run on them.
-- Linter binaries must be available on $PATH (e.g. golangci-lint).
-- Triggering is handled by the autocommand in remap.lua.
local linter = require('lint')

linter.linters_by_ft = {
    go = { 'golangcilint' },
}
