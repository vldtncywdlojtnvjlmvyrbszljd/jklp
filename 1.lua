local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 250)
frame.Position = UDim2.new(0.2, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local headerLabel = Instance.new("TextLabel")
headerLabel.Size = UDim2.new(1, 0, 0, 30)
headerLabel.Position = UDim2.new(0, 0, 0, 0)
headerLabel.Text = "BRUTALITY HUB V4"
headerLabel.Font = Enum.Font.SourceSansBold
headerLabel.TextSize = 18
headerLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
headerLabel.BackgroundTransparency = 1
headerLabel.TextWrapped = true
headerLabel.Parent = frame

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.Text = ""
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 18
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundTransparency = 1
closeButton.Parent = frame

closeButton.MouseButton1Click:Connect(function()
    local tween = TweenService:Create(frame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, -0.5, -100)})
    tween:Play()
    tween.Completed:Connect(function()
        screenGui:Destroy()
    end)
end)

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0, 50)
label.Position = UDim2.new(0, 0, 0, 12) 
label.Text = "Nice To Meet You"
label.Font = Enum.Font.SourceSansBold
label.TextSize = 30
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.BackgroundTransparency = 1
label.TextWrapped = true
label.Parent = frame

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0, 50)
label.Position = UDim2.new(0, 0, 0, 35) 
label.Text = "".. game.Players.LocalPlayer.Name
label.Font = Enum.Font.SourceSansBold
label.TextSize = 20
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.BackgroundTransparency = 1
label.TextWrapped = true
label.Parent = frame

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0, 50)
label.Position = UDim2.new(0, 0, 0, 55) 
label.Text = "".. identifyexecutor()
label.Font = Enum.Font.SourceSansBold
label.TextSize = 20
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.BackgroundTransparency = 1
label.TextWrapped = true
label.Parent = frame

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0.8, 0, 0, 30)
textBox.Position = UDim2.new(0.1, 0, 0.4, 0)
textBox.Text = "Enter Key Here"
textBox.Font = Enum.Font.SourceSans
textBox.TextSize = 18
textBox.TextColor3 = Color3.fromRGB(0, 0, 0)
textBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textBox.TextWrapped = true
textBox.Parent = frame

local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(0.4, 0, 0, 30)
getKeyButton.Position = UDim2.new(0.1, 0, 0.7, 0)
getKeyButton.Text = "Get Key"
getKeyButton.Font = Enum.Font.SourceSansBold
getKeyButton.TextSize = 18
getKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0) --0, 170, 0
getKeyButton.Parent = frame

local checkKeyButton = Instance.new("TextButton")
checkKeyButton.Size = UDim2.new(0.4, 0, 0, 30)
checkKeyButton.Position = UDim2.new(0.5, 0, 0.7, 0)
checkKeyButton.Text = "Check Key"
checkKeyButton.Font = Enum.Font.SourceSansBold
checkKeyButton.TextSize = 18
checkKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
checkKeyButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0) --0, 170, 0
checkKeyButton.Parent = frame

local DiscordButton = Instance.new("TextButton")
DiscordButton.Size = UDim2.new(0.8, 0, 0, 30)
DiscordButton.Position = UDim2.new(0.10, 0, 0.850, 0)
DiscordButton.Text = "Join Discord"
DiscordButton.Font = Enum.Font.SourceSansBold
DiscordButton.TextSize = 18
DiscordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
DiscordButton.Parent = frame

local validationLabel = Instance.new("TextLabel")
validationLabel.Size = UDim2.new(0.8, 0, 0, 30)
validationLabel.Position = UDim2.new(0.1, 0, 0.550, 0)
validationLabel.Text = "Please Get Key"
validationLabel.Font = Enum.Font.SourceSansBold
validationLabel.TextSize = 18
validationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
validationLabel.BackgroundTransparency = 1
validationLabel.Parent = frame
local keyFileUrl = "https://raw.githubusercontent.com/vldtncywdlojtnvjlmvyrbszljd/28s92hs/main/key.txt"
local allowPassThrough = false
local rateLimit = false
local rateLimitCountdown = 0
local errorWait = false
local useDataModel = true 
local countdownActive = false
local savedKey = nil
local expiryTimeInSeconds = 24 * 60 * 60 

function onMessage(msg)
    print(msg)
end

function fWait(seconds)
    wait(seconds)
end

function fSpawn(func)
    spawn(func)
end

function saveKeyWithTimestamp(key)
    local timestamp = os.time()
    local keyWithTimestamp = key .. "|" .. tostring(timestamp)
    writefile("savedKey.txt", keyWithTimestamp)
    savedKey = keyWithTimestamp
end

function loadKeyWithTimestamp()
    if isfile("savedKey.txt") then
        savedKey = readfile("savedKey.txt")
        local key, timestamp = parseKeyAndTimestamp(savedKey)
        if os.time() - tonumber(timestamp) >= expiryTimeInSeconds then
            onMessage("Saved key has expired!")
            delfile("savedKey.txt")
            savedKey = nil
        else
            savedKey = key
        end
    end
end

function parseKeyAndTimestamp(keyWithTimestamp)
    local key, timestamp = keyWithTimestamp:match("([^|]+)|([^|]+)")
    return key, timestamp
end

function startCountdown(seconds)
    countdownActive = true
    for i = seconds, 0, -1 do
        onMessage("Time remaining: " .. i .. " seconds")
        fWait(1)
    end
    countdownActive = false
    onMessage("Time's up! Please re-enter your key.")
    savedKey = nil
    if isfile("savedKey.txt") then
        delfile("savedKey.txt")
    end
    screenGui.Enabled = true
end

function verify(key)
    if errorWait or rateLimit then 
        return false
    end

    onMessage("Checking key...")

    local status, result = pcall(function() 
        return game:HttpGetAsync(keyFileUrl)
    end)
    
    if status then

        if string.find(result, key) then
            onMessage("Key is valid!")
            saveKeyWithTimestamp(key) 
            if not countdownActive then
                fSpawn(function()
                    startCountdown(expiryTimeInSeconds) 
                end)
            end
            return true
        else
            onMessage("Key is invalid!")
            return false
        end
    else
        onMessage("An error occurred while contacting the server!")
        return allowPassThrough
    end
end

getKeyButton.MouseButton1Click:Connect(function()
    setclipboard('https://medusastore.tech/halaman/postingan/point-key.html')
    validationLabel.Text = "Link Get Key Copied!"
    validationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

DiscordButton.MouseButton1Click:Connect(function()
    setclipboard('https://discord.com/invite/brutality-hub-1182005198206545941')
    validationLabel.Text = "Link Discord Copied!"
    validationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

checkKeyButton.MouseButton1Click:Connect(function()
    local key = textBox.Text
    if verify(key) then
        validationLabel.Text = "Key Is Valid!"
        validationLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        wait(2)
        validationLabel.Text = "Thanks For Using"
        validationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        wait(2)
        local tween = TweenService:Create(frame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, 1.5, -100)})
        tween:Play()
        tween.Completed:Connect(function()
            screenGui:Destroy()
        end)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vldtncywdlojtnvjlmvyrbszljd/asedesa/main/zxcv.lua",true))()
    else
        validationLabel.Text = "Checking Key..."
        validationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        wait(1.7)
        validationLabel.Text = "Key Is Not Valid!"
        validationLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end)

wait(3)
local tween = TweenService:Create(frame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, 0.5, -100)})
tween:Play()

loadKeyWithTimestamp()
if savedKey then
    if verify(savedKey) then
        onMessage("Saved key is valid!")
        screenGui.Enabled = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vldtncywdlojtnvjlmvyrbszljd/asedesa/main/zxcv.lua",true))()
    else
        onMessage("Saved key is invalid, please enter a new key.")
    end
end


-- Function to load the key from the GitHub raw file and check it
local function fetchKeyFromGitHub(url)
    local HttpService = game:GetService("HttpService")
    local success, result = pcall(function()
        return HttpService:GetAsync(url)
    end)
    if success then
        return result
    else
        warn("Error fetching key from GitHub: " .. tostring(result))
        return nil
    end
end

-- Save the key locally to prevent repeated input
local function saveKey(key)
    if not key or key == "" then return end
    -- Store the key in the player's data (use DataStore for production)
    writefile("saved_key.txt", key)
end

-- Load the saved key
local function loadSavedKey()
    if isfile("saved_key.txt") then
        return readfile("saved_key.txt")
    end
    return nil
end

-- Validate the key and give access to the main loadstring
local function validateKey(inputKey)
    local githubKey = fetchKeyFromGitHub("https://raw.githubusercontent.com/vldtncywdlojtnvjlmvyrbszljd/28s92hs/refs/heads/main/key.txt")
    if githubKey and inputKey == githubKey then
        saveKey(inputKey)
        -- Loadstring utama
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vldtncywdlojtnvjlmvyrbszljd/asedesa/main/zxcv.lua",true))()
    else
        warn("Invalid key!")
    end
end

-- Auto-load saved key if it exists and is still valid within 24 hours
local function autoLoadKey()
    local savedKey = loadSavedKey()
    if savedKey then
        local currentTime = os.time()
        local savedTime = tonumber(readfile("saved_time.txt") or "0")
        if currentTime - savedTime < 24 * 60 * 60 then  -- 24 hours in seconds
            validateKey(savedKey)  -- Validate saved key
        else
            warn("Key expired, please enter again.")
        end
    end
end

-- Save the current time when the key is entered successfully
local function saveKeyTime()
    writefile("saved_time.txt", tostring(os.time()))
end

-- GUI logic for inputting the key
local keyInput = Instance.new("TextBox")
keyInput.PlaceholderText = "Enter Key"
keyInput.Size = UDim2.new(1, 0, 0, 30)
keyInput.Position = UDim2.new(0, 0, 0.3, 0)
keyInput.Text = ""
keyInput.Parent = frame

local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(1, 0, 0, 30)
submitButton.Position = UDim2.new(0, 0, 0.5, 0)
submitButton.Text = "Submit Key"
submitButton.Parent = frame

submitButton.MouseButton1Click:Connect(function()
    local key = keyInput.Text
    validateKey(key)
    saveKeyTime()  -- Save the time when the key is validated
end)

-- Auto-load the key on start
autoLoadKey()



-- Table that stores username and corresponding keys
local usernameKeyTable = {
    ["Memek28222"] = "B-Team_12$@3wd2",
    ["username2"] = "key2",
    ["username3"] = "key3",
    -- Add more username-key pairs here
}

-- Function to load the key for the given username
local function validateUsernameKey(username, key)
    local storedKey = usernameKeyTable[username]
    if storedKey and storedKey == key then
        -- If key matches and username is correct, load the main loadstring without further validation
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vldtncywdlojtnvjlmvyrbszljd/asedesa/main/zxcv.lua",true))()
        return true
    end
    return false
end

-- Logic for handling permanent username-based keys
local function handleUsernameKey()
    local username = LocalPlayer.Name
    local savedKey = loadSavedKey()

    -- If there's a saved key, check if it belongs to the current username
    if savedKey and validateUsernameKey(username, savedKey) then
        print("Valid username-based key found. Loading script directly.")
    else
        print("No valid username key found, or username mismatch. Please enter key via GUI.")
        -- If no valid permanent key, fall back to GUI input
        autoLoadKey()
    end
end

-- Call the function to handle username-based keys at script startup
handleUsernameKey()

