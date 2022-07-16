--[[
             _.._
        .' .-'`
       /  /
       |  |            welcome to Lunar
       \  '.___.;
        '._  _.'
           ``
]]--

local SUPPORTED_PLACES = {
    2788229376
}

local placeId: number = game.PlaceId

local module
if table.find(SUPPORTED_PLACES, placeId) then
    module = loadstring(game:HttpGet("https://raw.githubusercontent.com/solarisrbx/lunar/dev/scripts/" .. placeId .. ".lua"))()
else
    module = loadstring(game:HttpGet("https://raw.githubusercontent.com/solarisrbx/lunar/dev/scripts/misc.lua"))()
end