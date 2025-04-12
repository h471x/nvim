return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lualine = require("lualine")

    local color = {
      blue = "#049be7",
      green = "#42b00a",
      pink = "#d30ccf",
      orange = "#e78804",
      fg = "#FFFFFF",
      black = "#000000",
      bg = nil,
      white = "#FFFFFF",
    }

    local htx_theme = {
      normal = {
        a = { bg = color.green, fg = color.black, gui = "bold" },
        b = { bg = color.bg, fg = color.fg },
        c = { bg = color.bg, fg = color.fg },
      },

      insert = {
        a = { bg = color.blue, fg = color.black, gui = "bold" },
        b = { bg = color.bg, fg = color.fg },
        c = { bg = color.bg, fg = color.fg },
      },

      command = {
        a = { bg = color.orange, fg = color.black, gui = "bold" },
        b = { bg = color.bg, fg = color.fg },
        c = { bg = color.bg, fg = color.fg },
      },

      visual = {
        a = { bg = color.pink, fg = color.black, gui = "bold" },
        b = { bg = color.bg, fg = color.fg },
        c = { bg = color.bg, fg = color.fg },
      },

      --visual
      --replace
      inactive = {
        a = { bg = color.green, fg = color.black, gui = "bold" },
        b = { bg = color.bg, fg = color.fg },
        c = { bg = color.bg, fg = color.fg },
      },
    }

    lualine.setup({
      options = {
        theme = htx_theme,
        disabled_filetypes = {
          statusline = { "snacks" }, -- disable in Snacks sidebar
          winbar = {},
        },
      },
    })
  end,
}
