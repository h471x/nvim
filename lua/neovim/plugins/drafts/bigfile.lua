return {
  "LunarVim/bigfile.nvim",
  event = "BufReadPre",
  opts = {
    filesize = 2,
    -- anything exceeding 2mb will
    -- activate the bigfile plugin
  },
  config = function(_, opts)
    require("bigfile").setup(opts)
  end,
}
