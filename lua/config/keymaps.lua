-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- function to save and go back to insert mode
--local function insrt()
--vim.cmd("<ESC>:w")
--vim.cmd("startinsert")
--end

-- keymaps for save and quit
-- keymap.set("n", "<C-s>", ":w<CR>") -- save with Ctrl + s in Normal mode
-- keymap.set("i", "<C-s>", ":w<CR>") -- save with Ctrl + s in Insert mode
-- keymap.set("n", "<C-w>", "<ESC><cmd>startinsert<CR>") -- switch to insert mode with Ctrl + w
-- keymap.set("i", "<C-s>", "<ESC>:w<CR>") -- save with Ctrl + s also in insert mode
-- keymap.set("i", "<C-x>", "<ESC>:wq<CR>") -- save and quit by pressing Ctrl + x in insert mode
-- keymap.set("n", "<C-x>", "<ESC>:wq<CR>") -- save and quit by pressing Ctrl + x in normal mode
-- keymap.set("i", "<C-q>", "<ESC>:q!<CR>") -- quit without saving by pressing Ctrl + q in insert mode
-- keymap.set("n", "<C-q>", "<ESC>:q!<CR>") -- quit without saving by pressing Ctrl + q in normal mode
-- keymap.set("i", "<C-z>", "<ESC>:undo<CR>") -- undo by pressing Ctrl + z in insert mode
-- keymap.set("n", "<C-z>", "<ESC>:undo<CR>") -- undo by pressing Ctrl + z in normal mode
-- keymap.set("i", "<C-y>", "<ESC>:redo<CR>") -- redo by pressing Ctrl + y in insert mode
-- keymap.set("n", "<C-y>", "<ESC>:redo<CR>") -- redo by pressing Ctrl + y in normal mode
keymap.set("n", "<A-f>", "<ESC>/") -- find by pressing Alt + f in normal mode
keymap.set("i", "<A-f>", "<ESC>/") -- find by pressing Alt + f in insert mode
keymap.set("i", "<C-c>", "<ESC>:") -- Command mode by pressing Ctrl + c in insert mode
keymap.set("n", "<C-c>", "<ESC>:") -- Command mode by pressing Ctrl + c in normal mode
-- Select aLL
-- keymap.set("n", "<C-a>", "gg<S-v>G")
-- keymap.set("i", "<C-a>", "<ESC>:bd<CR>") -- Delete Tab by pressing Ctrl + a in insert mode
-- keymap.set("n", "<C-a>", "<ESC>:bd<CR>") -- Delete Tab by pressing Ctrl + a in normal mode
-- keymap.set("n", "<A-Left>", "<ESC>:Neotree<CR>") -- Focus Neotree by pressing Alt + n in normal mode
-- keymap.set("n", "<C-Right>", ":bnext<CR>") -- Switch to Next Tab using Ctrl+ArrowRight in normal mode
-- keymap.set("i", "<C-Right>", ":bnext<CR>") -- Switch to Next Tab using Ctrl+ArrowRight in insert mode
-- keymap.set("n", "<C-Left>", ":bprev<CR>") -- Switch to Previous Tab using Ctrl+ArrowLeft in normal mode
-- keymap.set("i", "<C-Left>", ":bprev<CR>") -- Switch to Previous Tab using Ctrl+ArrowLeft in insert mode

-- keymap.set("n", "<C-v>", "<ESC><cmd>startvisual<CR>") --enter visual mode from normal mode using Ctrl + v
-- keymap.set("i", "<C-v>", "<ESC><cmd>startvisual<CR>") --enter visual mode from insert mode using Ctrl + v

---- Define a function to comment out selected text based on the file type
--local function comment_selected_text()
--  local filetype = vim.bo.filetype
--  local start_line = vim.fn.line("'<") -- Get the start line of the selection
--  local end_line = vim.fn.line("'>") -- Get the end line of the selection
--
--  -- Define comment characters based on the file type
--  local comment_chars = {
--    ["bash"] = "#",
--    ["c"] = "//",
--    ["javascript"] = "//",
--    -- Add more file types and their respective comment characters as needed
--  }
--
--  local comment_char = comment_chars[filetype]
--
--  if comment_char then
--    for line_num = start_line, end_line do
--      local line = vim.fn.getline(line_num)
--      vim.fn.setline(line_num, comment_char .. line)
--    end
--  end
--end
--
---- Map Ctrl+Shift+c in visual mode to comment_selected_text function
--keymap.set("v", "<C-c>", comment_selected_text)
