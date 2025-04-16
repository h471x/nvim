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

    -- Here to make the root name short
    -- found on reddit :
    -- https://www.reddit.com/r/neovim/comments/17ysbe4/neotree_root_name/
    components = {
      name = function(config, node, state)
        local components = require("neo-tree.sources.common.components")
        local name = components.name(config, node, state)
        if node:get_depth() == 1 then
          local root_name = vim.fs.basename(vim.loop.cwd() or "")
          name.text = string.upper(root_name) -- Capitalize the root name like in VSCode
        end
        return name
      end,
    },
  },

  -- ?? Put Neo-tree on the right
  window = {
    position = "right", -- default is "left"
    width = 25,
  },

  indent = {
    indent_size = 0.5,
    padding = 0.5,
    with_markers = true,
    indent_marker = "│",
    last_indent_marker = "└",
  },
})

-- ?? Make Neo-tree and statusline backgrounds transparent
vim.cmd([[
  " Neo-tree background
  highlight NeoTreeNormal guibg=NONE ctermbg=NONE
  highlight NeoTreeNormalNC guibg=NONE ctermbg=NONE
  highlight NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE

  " Statusline background
  highlight StatusLine guibg=NONE ctermbg=NONE
  highlight StatusLineNC guibg=NONE ctermbg=NONE
]])
