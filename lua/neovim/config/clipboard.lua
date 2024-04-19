-- Let neovim use the default clipboard of the os
vim.opt.clipboard:append("unnamedplus")

-- Function to execute shell commands and capture their output
local function execute_command(command)
  local handle = io.popen(command)
  local result = handle:read("*a")
  handle:close()
  return result
end

-- Get the output of `uname -r` to determine the current OS
local uname_output = execute_command("uname -r")

-- Determine if running on WSL based on uname output
local is_wsl = uname_output:lower():find("microsoft") ~= nil

-- Execute clipboard setup only if running on WSL
-- Otherwise it will work without this on Linux
if is_wsl then
  -- This is to enable the WSL clipboard (found in the manual)
  -- Additional for root: add /mnt/c/Windows/System32 to $PATH environment of root
  local copyCmd = "clip.exe"
  local powershell = "powershell.exe -c [Console]::Out.Write($("
  local getClipboard = "Get-Clipboard -Raw"
  local toStringReplace = ').tostring().replace("`r", ""))'
  local pasteCmd = powershell .. getClipboard .. toStringReplace

  vim.cmd([[
    let g:clipboard = {
      \ 'name': 'WslClipboard',
      \ 'copy': {
      \   '+': ']] .. copyCmd .. [[',
      \   '*': ']] .. copyCmd .. [[',
      \ },
      \ 'paste': {
      \   '+': ']] .. pasteCmd .. [[',
      \   '*': ']] .. pasteCmd .. [[',
      \ },
      \ 'cache_enabled': 0,
    \ }
  ]])
end
