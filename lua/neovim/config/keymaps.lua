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
function tab_right()
  vim.cmd("silent! bnext")
end

keymap.set("n", "<C-l>", ":lua tab_right()<CR>", silently)
keymap.set("n", "<C-Right>", ":lua tab_right()<CR>", silently)

-- Here to set the switch left tab shortcut with silence
function tab_left()
  vim.cmd("silent! bprev")
end

keymap.set("n", "<C-Left>", ":lua tab_left()<CR>", silently)
keymap.set("n", "<C-h>", ":lua tab_left()<CR>", silently)

-- Here to set the delete tab shortcut with silence
function tab_delete()
  -- Close NeoTree if opened
  vim.cmd("silent! Neotree close")
  vim.cmd("silent! bd")
  vim.cmd("silent! Neotree show")
end

keymap.set("n", "<C-w>", ":lua tab_delete()<CR>", silently)

-- Here to set the neotree focus shortcut with silence
function neotree_focus()
  vim.cmd("silent! Neotree")
end

keymap.set("n", "<A-Right>", ":lua neotree_focus()<CR>", silently)
keymap.set("n", "<A-q>", ":lua neotree_focus()<CR>", silently)
-- Here to set the editor focus shortcut with silence
-- vim.api.nvim_set_keymap("n", "<A-Right>", "<C-l>", { noremap = true, silent = true })

-- Here to focus the current buffer
function Buffer_focus()
  vim.cmd("silent! wincmd p")
end

keymap.set("n", "<A-Left>", ":lua Buffer_focus()<CR>", silently)

-- Here to set the save shortcut with silence
function save()
  vim.cmd("silent! w")
  vim.cmd('echo "Changes Saved"')
end

-- normal mode
keymap.set("n", "<C-s>", ":lua save()<CR>", silently)

-- insert mode
keymap.set("i", "<C-s>", "<ESC>:lua save()<CR>", silently)

-- Here the undo shortcut with silence
function undo()
  vim.cmd("silent! undo")
end

keymap.set("n", "<C-z>", ":lua undo()<CR>", silently)
keymap.set("i", "<C-z>", "<C-o>:lua undo()<CR>", silently)

-- Here the redo shortcut with silence
function redo()
  vim.cmd("silent! redo")
end

keymap.set("n", "<C-y>", ":lua redo()<CR>", silently)
keymap.set("i", "<C-y>", "<ESC>", silently)

-- Here to set the quit shortcut with silence
function quit()
  -- Close NeoTree if opened
  vim.cmd("silent! Neotree close")
  vim.cmd("silent! q!")
end

-- normal mode
keymap.set("n", "<C-q>", ":lua quit()<CR>", silently)

-- insert mode
keymap.set("i", "<C-q>", "<C-o>:lua quit()<CR>", silently)

-- Here to set the quit and save shortcut with silence
function quit_save()
  -- Close NeoTree if opened
  vim.cmd("silent! Neotree close")
  vim.cmd("silent! wq")
end

-- normal mode
keymap.set("n", "<C-x>", ":lua quit_save()<CR>", silently)

-- insert mode
keymap.set("i", "<C-x>", "<C-o>:lua quit_save()<CR>", silently)

-- Here to set the copy all shortcut with silence
-- vim.api.nvim_set_keymap("n", "<C-a>", "gg<S-v>GY", silently)
keymap.set("n", "<C-a>", "gg<S-v>G", silently)

-- Here to set the copy end of the line shortcut with silence
keymap.set("n", "Y", "y$", silently)