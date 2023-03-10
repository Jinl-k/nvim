-- https://github.com/amrbashir/nvim-docs-view
return {
  "amrbashir/nvim-docs-view",
  opt = true,
  cmd = { "DocsViewToggle" },
  config = function()
    require("docs-view").setup {
      position = "right",
      width = 30,
    }
  end
}