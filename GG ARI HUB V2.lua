local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ARIISETIAWAN20/OPM-ARI-HUB/main/ARI%20HUB%20V2.lua"))()
end)

if success then
    print("ScAri.lua berhasil dijalankan!")
else
    warn("Gagal menjalankan ScAri.lua: ", err)
end
