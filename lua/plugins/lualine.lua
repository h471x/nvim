-- Make sure to define the module as a table and return it
return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    local color = {
      blue = "#049be7",
      -- blue = "#65D1FF",
      green = "#42b00a",
      pink = "#d30ccf",
      orange = "#e78804",
      -- fg = "#c3ccdc",
      fg = "#FFFFFF",
      bg = "#000000",
      white = "#FFFFFF",
    }

    local htx_theme = {
      normal = {
        a = { bg = color.green, fg = color.bg, gui = "bold" }, -- gui = "bold" },
        b = { bg = color.bg, fg = color.fg },
        c = { bg = color.bg, fg = color.fg },
      },

      insert = {
        a = { bg = color.blue, fg = color.bg, gui = "bold" },
        b = { bg = color.bg, fg = color.fg },
        c = { bg = color.bg, fg = color.fg },
      },

      command = {
        a = { bg = color.orange, fg = color.bg, gui = "bold" },
        b = { bg = color.bg, fg = color.fg },
        c = { bg = color.bg, fg = color.fg },
      },

      visual = {
        a = { bg = color.pink, fg = color.bg, gui = "bold" },
        b = { bg = color.bg, fg = color.fg },
        c = { bg = color.bg, fg = color.fg },
      },

      --visual
      --replace
      inactive = {
        a = { bg = color.green, fg = color.bg, gui = "bold" }, -- gui = "bold" },
        b = { bg = color.bg, fg = color.fg },
        c = { bg = color.bg, fg = color.fg },
      },
    }

    lualine.setup({
      options = {
        theme = htx_theme,
        disabled_filetypes = { "neo-tree" },
      },
    })

    sections = {
      lualine_x = {
        {
          lazy_status.updates,
          cond = lazy_status.has_updates,
          color = "#FFFFFF",
        },
        { "encoding" },
        { "fileformat" },
        { "filetype" },
      },
    }
  end,
}
