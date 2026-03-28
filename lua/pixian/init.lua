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

vim.filetype.add({
  extension = {
    yaml = function(path, bufnr)
      -- Check if the file is in a 'templates' directory or matches helm naming
      if string.match(path, "templates/.*%.yaml") or string.match(path, "helm/.*%.yaml") then
        return "helm"
      end
      return "yaml"
    end
  }
})
