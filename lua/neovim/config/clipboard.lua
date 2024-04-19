-- This is to enable the WSL clipboard (found in the manual)
-- Additional for root: add /mnt/c/Windows/System32 to $PATH environment of root

-- Let neovim use the default clipboard of the os
vim.opt.clipboard:append("unnamedplus")

-- Function to execute shell commands and capture their output
local function execute_command(command)
  local handle = io.popen(command)
  local result = handle:read("*a")
  handle:close()
  return result
end

-- Get the output of `uname -r`
local uname_output = execute_command("uname -r")

-- Determine if running on WSL based on uname output
local is_wsl = uname_output:lower():find("microsoft") ~= nil

-- Execute clipboard setup only if running on WSL
if is_wsl then
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
end
