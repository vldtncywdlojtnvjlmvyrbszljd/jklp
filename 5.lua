local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local EliteWebhookUrl = "https://discord.com/api/webhooks/1291252394944106526/9EIKB-WZYJeIIQmqLB9_th8IYRVOFxl8sEDIFmQO_usf54JaBz85rsGzSe767AtnhodU"
local function SendWebhook(webhookUrl, data)
    local jsonData = HttpService:JSONEncode(data)
    local headers = { ["Content-Type"] = "application/json" }
    local request = http_request or request or syn.request or fluxus.request or Krnl.request or delta.request
    local final = { Url = webhookUrl, Body = jsonData, Method = "POST", Headers = headers }
    local success, response = pcall(function() return request(final) end)

    if not success then
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

local function SendEliteWebhook(EliteName)
    local PlayerCount = #Players:GetPlayers()
    local data = {
        embeds = {
            {
                title = "Longma Notification",
                color = tonumber(0xffa500),
                footer = {
                    text = "Botuna.INC",
                    icon_url = ""
                },
                timestamp = DateTime.now():ToIsoDate(),
                fields = {
                    {
                        name = "⭐️ Overview",
                        value = "```Note: If No Message, it got blocked by Discord (wait 1-2 hours and it will self-fix) - Botuna```",
                        inline = false
                    },
                    {
                        name = "🗺️ Location",
                        value = "```" .. location .. "```",
                        inline = false
                    },
                    {
                        name = "🧸 Elite Name",
                        value = "```" .. EliteName .. "```",
                        inline = false
                    },
                    {
                        name = "🍪 Player Count",
                        value = "```" .. PlayerCount .. "/12```",
                        inline = false
                    },
                    {
                        name = "📄 Job ID",
                        value = tostring(game.JobId),
                        inline = false
                    },
                    {
                        name = "📝 Join Script",
                        value = "game:GetService('TeleportService'):TeleportToPlaceInstance(" .. game.PlaceId .. ", '" .. game.JobId .. "', game:GetService('Players').LocalPlayer)",
                        inline = false
                    }
                }
            }
        }
    }
    SendWebhook(EliteWebhookUrl, data)
end
if game:GetService("ReplicatedStorage"):FindFirstChild("Longma") or game:GetService("Workspace").Enemies:FindFirstChild("Longma") then
    SendEliteWebhook("Longma")
elseif game:GetService("ReplicatedStorage"):FindFirstChild("Longma") or game:GetService("Workspace").Enemies:FindFirstChild("Longma") then
    SendEliteWebhook("Longma")
elseif game:GetService("ReplicatedStorage"):FindFirstChild("Longma") or game:GetService("Workspace").Enemies:FindFirstChild("Longma") then
    SendEliteWebhook("Longma")
end
