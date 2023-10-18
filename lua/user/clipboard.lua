--[[ if IsWsl() then
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ['+'] =  'clip.exe',
            ['*'] =  'clip.exe',
        },
        paste = {
            ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = true,
    }
    vim.opt.clipboard = "unnamedplus"
else
    vim.opt.clipboard = "unnamed"
end ]]
