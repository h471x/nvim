return {
  "norcalli/nvim-colorizer.lua",
  event = "BufReadPre",
  config = function()
    require("colorizer").setup({
      "*", -- Attaches to every FileType mode
      css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css
      javascript = { rgb_fn = true }, -- Enable parsing rgb(...) functions in javascript
      html = {
        mode = "foreground", -- Special configuration for html
      },
    })
  end,
}
