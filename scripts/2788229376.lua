--[[
    Lunar by Solaris

    Da Hood Script
    0.0.1
]]--
    
local Players = game:GetService("Players")
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/solarisrbx/lunar/dev/util/lib.lua"))()
local Aiming = loadstring(game:HttpGet("https://raw.githubusercontent.com/solarisrbx/lunar/dev/util/aiming.lua"))()
Aiming.TeamCheck(false)
Aiming.VisibleCheck = false

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

hood.gui:Notify("Injected", "Welcome to Lunar by Solaris. Enjoy your time in Da Hood!")

function Aiming.Check()
    if not (Aiming.Enabled == true and Aiming.Selected ~= Players.LocalPlayer and Aiming.SelectedPart ~= nil) then
        return false
    end
 
    local Character = Aiming.Character(Aiming.Selected)
    local KOd = Character:WaitForChild("BodyEffects")["K.O"].Value
    local Grabbed = Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
 
    if (KOd or Grabbed) then
        return false
    end
 
    return true
end

local __index
__index = hookmetamethod(game, "__index", function(t, k)
    if (t:IsA("Mouse") and (k == "Hit" or k == "Target") and Aiming.Check()) then
        local SelectedPart = Aiming.SelectedPart
        if (DaHoodSettings.SilentAim and (k == "Hit" or k == "Target")) then
            local Hit = SelectedPart.CFrame + (SelectedPart.Velocity)
 
            return (k == "Hit" and Hit or SelectedPart)
        end
    end
 
    return __index(t, k)
end)