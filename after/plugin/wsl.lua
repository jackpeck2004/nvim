function IsWsl()
    local wsl = os.getenv('WSL_DISTRO_NAME')
    local r = 0
    if wsl then
        r = 1
    end

    return r
end
