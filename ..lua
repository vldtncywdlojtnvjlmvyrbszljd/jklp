local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local LongmaWebhookUrl = "https://discord.com/api/webhooks/1291252399176028204/HWW9d9k-VKmO7QM42kfUFgWUQWaVJZ_pFS2AA_zE9injyOQGspjPkKARrPEzCIzEGypO"
local lastWebhookTime = 0
local COOLDOWN_TIME = 30

local function SendWebhook(webhookUrl, data)
    local currentTime = os.time()
    if currentTime - lastWebhookTime < COOLDOWN_TIME then
        return
    end

    local success, jsonData = pcall(function()
        return HttpService:JSONEncode(data)
    end)
    if not success then
        warn("JSON encoding failed:", jsonData)
        return
    end

    local headers = { ["Content-Type"] = "application/json" }
    local request = http_request or request or syn.request or fluxus.request or Krnl.request or delta.request or cryptic.request
    
    if not request then
        warn("No HTTP request function found")
        return
    end

    local final = { Url = webhookUrl, Body = jsonData, Method = "POST", Headers = headers }
    local success, response = pcall(function() return request(final) end)

    if success then
        lastWebhookTime = currentTime
    else
        warn("Webhook failed:", response)
    end
end

local location
if game.PlaceId == 2753915549 then
    location = "Sea 1"
elseif game.PlaceId == 4442272183 then
    location = "Sea 2"
elseif game.PlaceId == 7449423635 then
    location = "Sea 3"
else
    location = "Unknown Location"
end

-- Daftar warna yang akan digunakan
local colors = {
    tonumber(0xffa500), -- Orange
    tonumber(0x00ff00), -- Green
    tonumber(0x0000ff), -- Blue
    tonumber(0xff0000), -- Red
    tonumber(0xffff00), -- Yellow
    tonumber(0xffffff),
}

-- Fungsi untuk mendapatkan warna secara acak
local function getRandomColor()
    local randomIndex = math.random(1, #colors)
    return colors[randomIndex]
end

local function SendLongmaWebhook(bossName)
    local PlayerCount = #Players:GetPlayers()
    local data = {
        embeds = {{
            title = "Boss Longma",
            color = getRandomColor(), -- Warna acak
            footer = {
                text = "Created by 𝕭𝖔𝖙𝖚𝖓𝖆.inc",
                icon_url = "https://cdn.discordapp.com/attachments/1262105882871730347/1291060042354790461/MaleOcs_r.jpeg?ex=6702049c&is=6700b31c&hm=0363568c502c3bd15b95c0e32d7ad715f8651837dc7e74044f2a2bbc89403ce5&"
            },
            timestamp = DateTime.now():ToIsoDate(),
            fields = {
                {
                    name = "<:location_1281145107134812171:1292229102937313381> Location",
                    value = "```" .. location .. "```",
                    inline = true
                },
                {
                    name = "<:botunalock:1291855989997441144> Boss Name",
                    value = "```" .. bossName .. "```",
                    inline = true
                },
                {
                    name = "<a:stickglowdance18:1291912943428177991> Player Count",
                    value = "```" .. PlayerCount .. "/12```",
                    inline = true
                },
                {
                    name = "<a:online:1291408185390923878> Overview",
                    value = "```Note: If No Message, it got blocked by Discord (wait 1-2 hours and it will self-fix) - 𝕭𝖔𝖙𝖚𝖓𝖆.inc```",
                    inline = false
                },
                {
                    name = "<a:meluncurbotuna:1292227272379732009> Job ID",
                    value = tostring(game.JobId),
                    inline = false
                },
                {
                    name = "<a:sword:1292227701859418279> Join Script",
                    value = "game:GetService('TeleportService'):TeleportToPlaceInstance(" .. game.PlaceId .. ", '" .. game.JobId .. "', game:GetService('Players').LocalPlayer)",
                    inline = false
                }
            }
        }}
    }
    SendWebhook(LongmaWebhookUrl, data)
end


local World1 = game.PlaceId == 2753915549
local World2 = game.PlaceId == 4442272183
local World3 = game.PlaceId == 7449423635

local bossName = {"Longma"}

local function BossExists(bossName)
    return 
        game:GetService("ReplicatedStorage"):FindFirstChild(bossName) or
        game:GetService("Workspace"):FindFirstChild(bossName)
end

spawn(function()
    while task.wait(5) do 
        if World1 or World2 or World3 then
            for _, bossName in pairs(bossName) do 
                if BossExists(bossName) then 
                    SendLongmaWebhook(bossName)
                end
            end
        end
    end
end)
