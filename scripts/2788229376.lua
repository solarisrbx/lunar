--[[
    Lunar by Solaris

    Da Hood Script
    0.0.1
]]--

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/solarisrbx/lunar/dev/util/lib.lua"))()

local hood = {}
hood.gui = library.new("Lunar")
hood.settings = {
    silentAim = false
}

local aimPage = hood.gui:addPage("Aim", 0)
local silentAim = aimPage:addSection("Silent Aim")
silentAim:addToggle("Enabled", false, function()
    hood.settings.silentAim = not hood.settings.silentAim

    print(hood.settings.silentAim)
end)

hood.gui:Notify("Injected", "Welcome to Lunar by Solaris. Enjoy your time in Da Hood!")