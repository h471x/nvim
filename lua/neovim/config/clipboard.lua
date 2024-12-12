-- Let neovim use the default clipboard of the os
vim.opt.clipboard:append("unnamedplus")

-- Function to execute shell commands and capture their output
local function execute_command(command)
  local handle = io.popen(command)
  if not handle then
    return nil, "Failed to execute command"
  end
  local result = handle:read("*a")
  local success, reason = handle:close()
  if not success then
    return nil, "Failed to close command handle: " .. tostring(reason)
  end
  return result
end

-- Get the output of `uname -r` to determine the current OS
local uname_output = execute_command("uname -r")

-- Determine if running on WSL based on uname output
local is_wsl = uname_output and uname_output:lower():find("microsoft") ~= nil

-- Get the value of $DISPLAY to check if running under an RDP session (e.g., :13.0)
local display_output = os.getenv("DISPLAY")

-- Determine if RDP is active (based on $DISPLAY being :13.0)
local is_windows_terminal = display_output == ":0"

-- Execute clipboard setup only if running on WSL
-- Otherwise it will work without this on Linux
if is_wsl then
  -- only use clip.exe on WSL in case we are not
  -- currently using it as RDP connection or WSL GUI
  if is_windows_terminal then
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
end
