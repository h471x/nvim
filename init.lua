-- bootstrap lazy.nvim, LazyVim and your plugins
require("neovim.lazy")
require("neovim.config")

-- here to open neo-tree at neovim startup
require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      visible = true, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = false, -- this to not hide dotted files
      hide_gitignored = false, -- this to not hide gitignore files
      hide_by_name = {
        ".DS_Store",
        "thumbs.db",
        --"node_modules",
      },
    },
  },
})
