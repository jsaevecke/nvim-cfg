-- Entry point for the pixian module.
-- Loaded by init.lua via `require("pixian")`.
-- Order matters: remaps first (leader must be set), then options, then theme.
require("pixian.remap")
require("pixian.set")
require("pixian.color")

-- Treat .zsh / .sh files and dot-files as the "sh" filetype so shell LSP
-- and syntax highlighting apply consistently.
vim.filetype.add {
    extension = {
        zsh = "sh",
        sh  = "sh",
    },
    filename = {
        [".zshrc"]  = "sh",
        [".zshenv"] = "sh",
    },
}

-- Detect Helm templates: any *.yaml inside a templates/ or helm/ directory
-- is assigned the "helm" filetype instead of plain "yaml", activating helm_ls.
vim.filetype.add({
    extension = {
        yaml = function(path, _)
            if string.match(path, "templates/.*%.yaml") or string.match(path, "helm/.*%.yaml") then
                return "helm"
            end
            return "yaml"
        end
    }
})
