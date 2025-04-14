-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<A-f>", "<ESC>/") -- find by pressing Alt + f in normal mode
keymap.set("i", "<A-f>", "<ESC>/") -- find by pressing Alt + f in insert mode
keymap.set("i", "<C-c>", "<ESC>:") -- Command mode by pressing Ctrl + c in insert mode
keymap.set("n", "<C-c>", "<ESC>:") -- Command mode by pressing Ctrl + c in normal mode

-- Here to store the variable silent
local silently = { noremap = true, silent = true }

-- Here to set the switch right tab shortcut with silence
function Tab_right()
  vim.cmd("silent! bnext")
end

keymap.set("n", "<C-l>", ":lua Tab_right()<CR>", silently)
keymap.set("n", "<C-Right>", ":lua Tab_right()<CR>", silently)
keymap.set("n", "<Tab>", ":lua Tab_right()<CR>", silently)

-- Here to set the switch left tab shortcut with silence
function Tab_left()
  vim.cmd("silent! bprev")
end

keymap.set("n", "<C-Left>", ":lua Tab_left()<CR>", silently)
keymap.set("n", "<C-h>", ":lua Tab_left()<CR>", silently)
keymap.set("n", "<Tab>", ":lua Tab_right()<CR>", silently)

-- Here to set the delete tab shortcut with silence
function Tab_delete()
  vim.cmd("silent! bd")
end

keymap.set("n", "<C-w>", ":lua Tab_delete()<CR>", silently)

-- Here to focus the current buffer
function Buffer_focus()
  vim.cmd("silent! wincmd p")
end

keymap.set("n", "<A-Left>", ":lua Buffer_focus()<CR>", silently)

-- Here to set the save shortcut with silence
function Save()
  vim.cmd("silent! w")
  vim.cmd('echo "Changes Saved"')
end

-- normal mode
keymap.set("n", "<C-s>", ":lua Save()<CR>", silently)

-- insert mode
keymap.set("i", "<C-s>", "<ESC>:lua Save()<CR>", silently)

-- Here the undo shortcut with silence
function Undo()
  vim.cmd("silent! undo")
end

keymap.set("n", "<C-z>", ":lua Undo()<CR>", silently)
keymap.set("i", "<C-z>", "<C-o>:lua Undo()<CR>", silently)

-- Here the redo shortcut with silence
function Redo()
  vim.cmd("silent! redo")
end

keymap.set("n", "<C-y>", ":lua Redo()<CR>", silently)
keymap.set("i", "<C-y>", "<ESC>", silently)

-- Function to check if Snacks is open by checking if the explorer window exists
local function is_snacks_open()
  local win_id = vim.fn.win_getid()
  return vim.fn.bufname(win_id) == "snacks"
end

-- Function to toggle Snacks explorer
local function close_snacks_if_open()
  if is_snacks_open() then
    require("snacks.explorer").toggle() -- This will close the Snacks explorer if it's open
  end
end

-- Here to set the quit shortcut with silence
function Quit()
  close_snacks_if_open()
  vim.cmd("silent! q!")
end

-- normal mode
keymap.set("n", "<C-q>", ":lua Quit()<CR>", silently)

-- insert mode
keymap.set("i", "<C-q>", "<C-o>:lua Quit()<CR>", silently)

-- Here to set the quit and save shortcut with silence
function Quit_save()
  close_snacks_if_open()
  vim.cmd("silent! wq")
end

-- normal mode
keymap.set("n", "<C-x>", ":lua Quit_save()<CR>", silently)

-- insert mode
keymap.set("i", "<C-x>", "<C-o>:lua Quit_save()<CR>", silently)

-- Here to set the copy all shortcut with silence
-- vim.api.nvim_set_keymap("n", "<C-a>", "gg<S-v>GY", silently)
keymap.set("n", "<C-a>", "gg<S-v>G", silently)

-- Here to set the copy end of the line shortcut with silence
keymap.set("n", "Y", "y$", silently)
