return {
  "folke/snacks.nvim",
  opts = {
    indent = {
      enabled = true,
      size = 0,
      padding = 0.5,
    },
    input = { enabled = true },
    notifier = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = false },
    toggle = { map = LazyVim.safe_keymap_set },
    words = { enabled = true },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          layout = {
            layout = {
              position = "right",
              width = 25,
            },
          },
        },
      },
    },
    explorer = {
      hidden = true,
      ignored = true,
    },
    terminal = {
      win = { position = "float" },
    },
  },

  config = function(_, opts)
    require("snacks").setup(opts)

    -- Function to apply transparent highlights
    local function set_transparent_highlights()
      local highlights = {
        "SnacksNormal",
        "SnacksFloat",
        "SnacksBorder",
        "NormalFloat",
        "TabLine",
        "TabLineSel",
        "TabLineFill",
        "StatusLine",
        "StatusLineNC",
      }

      for _, hl in ipairs(highlights) do
        vim.api.nvim_set_hl(0, hl, { bg = "none" })
      end
    end

    -- Apply highlights immediately
    set_transparent_highlights()

    -- Reapply highlights on colorscheme change
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = set_transparent_highlights,
    })
  end,
}
