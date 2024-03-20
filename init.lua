-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd("set completeopt+=menu,noselect")
-- here to make neovim as insert mode on startup
-- vim.cmd("autocmd VimEnter * startinsert")

-- This is to enable the WSL clipboard (found in the manual)
-- Additional for root: add /mnt/c/Windows/System32 to $PATH environment of root
vim.cmd([[
  let g:clipboard = {
    \   'name': 'WslClipboard',
    \   'copy': {
      \      '+': 'clip.exe',
      \      '*': 'clip.exe',
    \    },
    \   'paste': {
      \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    \   },
    \   'cache_enabled': 0,
  \ }
]])

-- Here to disable lualine in neotree

-- Here to store the variable silent
local silently = { noremap = true, silent = true }

-- Here to set the switch right tab shortcut with silence
function tab_right()
  vim.cmd("silent! bnext")
end

vim.api.nvim_set_keymap("n", "<C-l>", ":lua tab_right()<CR>", silently)
vim.api.nvim_set_keymap("n", "<C-Right>", ":lua tab_right()<CR>", silently)

-- Here to set the switch left tab shortcut with silence
function tab_left()
  vim.cmd("silent! bprev")
end

vim.api.nvim_set_keymap("n", "<C-Left>", ":lua tab_left()<CR>", silently)
vim.api.nvim_set_keymap("n", "<C-h>", ":lua tab_left()<CR>", silently)

-- Here to set the delete tab shortcut with silence
function tab_delete()
  vim.cmd("silent! bd")
end

vim.api.nvim_set_keymap("n", "<C-w>", ":lua tab_delete()<CR>", silently)

-- Here to set the neotree focus shortcut with silence
function neotree_focus()
  vim.cmd("silent! Neotree")
end

vim.api.nvim_set_keymap("n", "<A-Right>", ":lua neotree_focus()<CR>", silently)
vim.api.nvim_set_keymap("n", "<A-q>", ":lua neotree_focus()<CR>", silently)
-- Here to set the editor focus shortcut with silence
-- vim.api.nvim_set_keymap("n", "<A-Right>", "<C-l>", { noremap = true, silent = true })

-- Here to set the save shortcut with silence
function save()
  vim.cmd("silent! w")
  vim.cmd('echo "Changes Saved"')
end

-- normal mode
vim.api.nvim_set_keymap("n", "<C-s>", ":lua save()<CR>", silently)

-- insert mode
vim.api.nvim_set_keymap("i", "<C-s>", "<ESC>:lua save()<CR>", silently)

-- Here the undo shortcut with silence
function undo()
  vim.cmd("silent! undo")
end

vim.api.nvim_set_keymap("n", "<C-z>", ":lua undo()<CR>", silently)
vim.api.nvim_set_keymap("i", "<C-z>", "<C-o>:lua undo()<CR>", silently)

-- Here the redo shortcut with silence
function redo()
  vim.cmd("silent! redo")
end

vim.api.nvim_set_keymap("n", "<C-y>", ":lua redo()<CR>", silently)
vim.api.nvim_set_keymap("i", "<C-y>", "<ESC>", silently)

-- Here to set the quit shortcut with silence
function quit()
  vim.cmd("silent! q!")
end

-- normal mode
vim.api.nvim_set_keymap("n", "<C-q>", ":lua quit()<CR>", silently)

-- insert mode
vim.api.nvim_set_keymap("i", "<C-q>", "<C-o>:lua quit()<CR>", silently)

-- Here to set the quit and save shortcut with silence
function quit_save()
  vim.cmd("silent! wq")
end

-- normal mode
vim.api.nvim_set_keymap("n", "<C-x>", ":lua quit_save()<CR>", silently)

-- insert mode
vim.api.nvim_set_keymap("i", "<C-x>", "<C-o>:lua quit_save()<CR>", silently)

-- Here to set the copy all shortcut with silence
-- vim.api.nvim_set_keymap("n", "<C-a>", "gg<S-v>GY", silently)
vim.api.nvim_set_keymap("n", "<C-a>", "gg<S-v>G", silently)

-- Here to set the copy end of the line shortcut with silence
vim.api.nvim_set_keymap("n", "Y", "y$", silently)

-- here to configure neo-tree
require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      visible = true, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = false, -- this to not hide dotted files
      hide_gitignored = false, -- this to not hide gitignore files
      hide_by_name = {
        ".DS_Store",
        "thumbs.db",
        --"node_modules",
      },
    },
  },
})
