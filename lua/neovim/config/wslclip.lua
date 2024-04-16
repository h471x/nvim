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
