--[[
    Lunar by Solaris

    Da Hood Script
    0.0.1
]]--
    
local Players = game:GetService("Players")
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/solarisrbx/lunar/dev/util/lib.lua"))()
local aiming = loadstring(game:HttpGet("https://raw.githubusercontent.com/solarisrbx/lunar/dev/util/aiming.lua"))()
aiming.TeamCheck(false)
aiming.VisibleCheck = false
aiming.FOV = 35
aiming.ShowFOV = false

local hood = {}
hood.gui = library.new("Lunar")
hood.settings = {
    silentAim = false
}

local aimPage = hood.gui:addPage("Aim", 0)
local silentAim = aimPage:addSection("Silent Aim")
silentAim:addToggle("Enabled", false, function(val: boolean)
    hood.settings.silentAim = val
end)
silentAim:addToggle("Show FOV", false, function(val: boolean)
    aiming.ShowFOV = val
end)
silentAim:addSlider("FOV Size", 35, 0, 180, function(val: number)
    aiming.FOV = val
end)


hood.gui:Notify("Injected", "Welcome to Lunar by Solaris. Enjoy your time in Da Hood!")

local __index
__index = hookmetamethod(game, "__index", function(t, k)
    if (t:IsA("Mouse") and (k == "Hit" or k == "Target") and aiming.Check()) then
        local SelectedPart = aiming.SelectedPart
        if (hood.settings.silentAim and (k == "Hit" or k == "Target")) then
            local Hit = SelectedPart.CFrame + (SelectedPart.Velocity)
 
            return (k == "Hit" and Hit or SelectedPart)
        end
    end
 
    return __index(t, k)
end)