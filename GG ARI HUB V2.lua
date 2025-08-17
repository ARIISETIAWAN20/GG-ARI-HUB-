-- ===== SECURITY CHECK - Kick if not authorized =====
local player = game.Players.LocalPlayer
local allowedUsers = {
    "Devrenzx",
    "Vornek2083"
}

if not table.find(allowedUsers, player.Name) then
    player:Kick("You are not authorized to use this script.")
    return -- Hentikan eksekusi script selanjutnya
end

-- ===== Load ARI HUB V2 =====
local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ARIISETIAWAN20/OPM-ARI-HUB/main/ARI%20HUB%20V2.lua "))()
end)

if success then
    print("ARI HUB V2.lua berhasil dijalankan!")
else
    warn("Gagal menjalankan ARI HUB V2.lua: ", err)
end

-- ===== Auto No-Fog & Brightness Equalizer (Passive) =====
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

-- Settings
local DAY_BRIGHTNESS = 2 -- Adjust if you want it brighter
local NIGHT_THRESHOLD = 0.4 -- Threshold for detecting night (based on brightness)

local function removeFogAndBrighten()
    -- Remove fog
    Lighting.FogStart = 0
    Lighting.FogEnd = 1e9
    Lighting.GlobalShadows = false
    Lighting.Ambient = Color3.fromRGB(180, 180, 180)
    Lighting.OutdoorAmbient = Color3.fromRGB(180, 180, 180)
    Lighting.Brightness = DAY_BRIGHTNESS

    -- Neutralize Atmosphere
    local atm = Lighting:FindFirstChildOfClass("Atmosphere")
    if atm then
        atm.Density = 0
        atm.Offset = 0
        pcall(function() atm.Haze = 0 end)
        pcall(function() atm.Glare = 0 end)
        atm.Color = Color3.fromRGB(255, 255, 255)
        atm.Decay = Color3.fromRGB(255, 255, 255)
    end
end

RunService.Heartbeat:Connect(function()
    local currentBrightness = Lighting.Brightness
    if currentBrightness < NIGHT_THRESHOLD or Lighting.ClockTime < 6 or Lighting.ClockTime > 18 then
        removeFogAndBrighten()
    end
end)
