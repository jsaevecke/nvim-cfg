require("pixian.remap")
require("pixian.set")
require("pixian.color")

vim.filetype.add {
    extension = {
        zsh = "sh",
        sh = "sh",
    },
    filename = {
        [".zshrc"] = "sh",
        [".zshenv"] = "sh",
    },
}
