--[[
    Lunar by Solaris

    Da Hood Script
    0.0.1
]]--

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/solarisrbx/lunar/dev/util/lib.lua"))()
local aiming = loadstring(game:HttpGet("https://raw.githubusercontent.com/solarisrbx/lunar/dev/util/aiming.lua"))()
aiming.TeamCheck(false)
aiming.FOV = 60

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
silentAim:addToggle("Visible Check", true, function(val: boolean)
    aiming.VisibleCheck = val
end)
silentAim:addToggle("Show FOV Circle", true, function(val: boolean)
    aiming.ShowFOV = val
end)
-- silentAim:addSlider("FOV Size", 0, 0, 400, function(val: boolean)
--     aiming.FOV = val
-- end)

hood.gui:Notify("Injected", "Welcome to Lunar by Solaris. Enjoy your time in Da Hood!")

local __index
__index = hookmetamethod(game, "__index", function(t, k)
    if t:IsA("Mouse") and (k == "Hit" or k == "Target") and hood.settings.silentAim then
        local SelectedPart = aiming.SelectedPart

        local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * 0.178)

        return (k == "Hit" and Hit or SelectedPart)
    end
end)