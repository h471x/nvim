return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "right", -- or "left", "top", "bottom"
      width = 50,
    },
    filesystem = {
      filtered_items = {
        visible = true, -- show hidden files by default
        hide_dotfiles = false,
        hide_gitignored = true,
      },
    },
  },
}
