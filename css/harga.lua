getgenv().Games = {
    [2753915549] = "https://37uzdt26sof4b.ahost.marscode.site/bf.lua", -- Bl 1
    [4442272183] = "https://37uzdt26sof4b.ahost.marscode.site/bf.lua", -- Bl 2
    [7449423635] = "https://37uzdt26sof4b.ahost.marscode.site/bf.lua", -- Bl 3
    [10260193230] = "https://37uzdt26sof4b.ahost.marscode.site/meme.lua", -- Memesea
    [13772394625] = "https://37uzdt26sof4b.ahost.marscode.site/bladebll.lua", -- Blade Ball
    [15744137588] = "", --Blade Slayer
    [11520107397] = "https://37uzdt26sof4b.ahost.marscode.site/mekmek/slap-battle.lua", --Slap Battle 1
    [6403373529] = "hhttps://37uzdt26sof4b.ahost.marscode.site/mekmek/slap-battle.lua", --Slap Battle 2
    [9015014224] = "https://37uzdt26sof4b.ahost.marscode.site/mekmek/slap-battle.lua", --Slap Battle 3
    [8737899170] = "https://raw.githubusercontent.com/AhmadV99/Script-Games/main/PS99.lua",  -- PS99 World 1
    [16498369169] = "https://raw.githubusercontent.com/AhmadV99/Script-Games/main/PS99.lua",  -- PS99 World 2
    [17503543197] = "https://raw.githubusercontent.com/AhmadV99/Script-Games/main/PS99.lua",  -- PS99 World 3
    [10449761463] = "https://raw.githubusercontent.com/AhmadV99/Script-Games/main/The%20Strongest%20Battleground.lua",  -- The Strongest Battlegrounds
  }

-- Fungsi untuk mendeteksi PlaceId dan menjalankan script yang sesuai
local placeId = game.PlaceId  -- Mengambil PlaceId dari game yang sedang dijalankan

if getgenv().Games[placeId] then
    local scriptUrl = getgenv().Games[placeId]
    loadstring(game:HttpGet(scriptUrl))()  -- Memuat dan menjalankan script dari URL
else
    print("Script untuk game ini tidak tersedia.")
end
