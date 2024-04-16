return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    local bg = "#000000"
    local bg_dark = "#000000"
    local bg_highlight = "#292e42"
    local bg_search = "#c77b4e"
    local bg_visual = "#275378"
    local fg = "#CBE0F0"
    local fg_dark = "#B4D0E9"
    local fg_gutter = "#627E97"
    local border = "#2f3244"

    require("tokyonight").setup({
      style = "night",
      transparent = true,
      light_style = "night",
      terminal_colors = false,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
        -- comments = "italic", -- Make comments italic
        keywords = "bold", -- Make keywords bold
        -- functions = "underline", -- Underline function names
        variables = "NONE", -- Disable styling for variables
        hlsl = "NONE",
        -- You can customize other highlighting styles as needed
        Normal = "#ffffff",
        Background = "#000000",
      },
      on_colors = function(colors)
        colors.bg = bg
        colors.bg_dark = bg_dark
        colors.bg_float = bg_dark
        colors.bg_highlight = bg_highlight
        colors.bg_popup = bg_dark
        colors.bg_search = bg_search
        colors.bg_sidebar = bg_dark
        colors.bg_statusline = bg_dark
        colors.bg_visual = bg_visual
        colors.border = border
        colors.fg = fg
        colors.fg_dark = fg_dark
        colors.fg_float = fg
        colors.fg_gutter = fg_gutter
        colors.fg_sidebar = fg_dark
      end,
    })

    vim.cmd("colorscheme tokyonight")
  end,
}
