return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      style = "night",
      light_style = "night",
      terminal_colors = false,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
        comments = "italic", -- Make comments italic
        keywords = "bold", -- Make keywords bold
        -- functions = "underline", -- Underline function names
        variables = "NONE", -- Disable styling for variables
        hlsl = "NONE",
        -- You can customize other highlighting styles as needed
        Normal = "#ffffff",
        Background = "#000000",
      },
    },
  },
}
