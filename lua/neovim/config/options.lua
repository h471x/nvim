-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local workspaces = {
  -- Set `auto_load` to `false` to prevent automatic loading of workspaces on startup
  auto_load = false,
}

-- this allows manual selection of the completion items
-- without automatically selecting the first suggestion.
vim.cmd("set completeopt+=menu,noselect")
-- here to make neovim as insert mode on startup
-- vim.cmd("autocmd VimEnter * startinsert")
