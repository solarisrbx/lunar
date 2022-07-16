--[[
    Lunar by Solaris

    Da Hood Script
    0.0.1
]]--

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/solarisrbx/lunar/dev/util/lib.lua"))()
local aiming = loadstring(game:HttpGet("https://raw.githubusercontent.com/solarisrbx/lunar/dev/util/aiming.lua"))()

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
    -- aiming.VisibleCheck = val
end)
silentAim:addToggle("Show FOV Circle", true, function(val: boolean)
    -- aiming.ShowFOV = val
end)
-- silentAim:addSlider("FOV Size", 0, 0, 400, function(val: boolean)
--     aiming.FOV = val
-- end)

hood.gui:Notify("Injected", "Welcome to Lunar by Solaris. Enjoy your time in Da Hood!")

-- // Hook
local __index
__index = hookmetamethod(game, "__index", function(t, k)
    -- // Check if it trying to get our mouse's hit or target
    if (t:IsA("Mouse") and (k == "Hit" or k == "Target")) then
        -- // If we can use the silent aim
        if (aiming.Check()) then
            -- // Vars
            local TargetPart = aiming.SelectedPart

            -- // Return modded val
            return (k == "Hit" and TargetPart.CFrame or TargetPart)
        end
    end

    -- // Return
    return __index(t, k)
end)

