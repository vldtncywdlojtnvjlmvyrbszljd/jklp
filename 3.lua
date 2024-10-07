local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 250)
frame.Position = UDim2.new(0.5, -150, 0.5, -125)
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
label.Position = UDim2.new(0, 0, 0, 20) 
label.Text = "Nice To Meet You"
label.Font = Enum.Font.SourceSansBold
label.TextSize = 30
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.BackgroundTransparency = 1
label.TextWrapped = true
label.Parent = frame

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0, 50)
label.Position = UDim2.new(0, 0, 0, 50) 
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
label.Text = "" --.. identifyexecutor()
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
getKeyButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0) 
getKeyButton.Parent = frame

local checkKeyButton = Instance.new("TextButton")
checkKeyButton.Size = UDim2.new(0.4, 0, 0, 30)
checkKeyButton.Position = UDim2.new(0.5, 0, 0.7, 0)
checkKeyButton.Text = "Check Key"
checkKeyButton.Font = Enum.Font.SourceSansBold
checkKeyButton.TextSize = 18
checkKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
checkKeyButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0) 
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

local keyFileUrl = "https://raw.githubusercontent.com/vldtncywdlojtnvjlmvyrbszljd/28s92hs/main/keqy.txt"
local savedKey = nil

-- Daftar pasangan key dan username (langsung dari kode Lua)
local keysWithUsernames = {
    {key = "key1", username = "Memek2822a2"},
    {key = "key2", username = "username2"},
    {key = "key3", username = "username3"},
    -- Tambahkan pasangan key dan username lainnya di sini
}

-- Fungsi untuk menampilkan pesan
function onMessage(msg)
    print(msg)
end

-- Fungsi untuk memverifikasi key dari GitHub
function verifyKeyFromGitHub(key)
    onMessage("Checking key from GitHub...")

    local status, result = pcall(function() 
        return game:HttpGetAsync(keyFileUrl)
    end)

    if status then
        if string.find(result, key) then
            onMessage("Key is valid from GitHub!")
            saveKey(key) -- Simpan key yang cocok dari GitHub
            return true
        else
            onMessage("Key is invalid from GitHub!")
            return false
        end
    else
        onMessage("An error occurred while contacting the GitHub server!")
        return false
    end
end

-- Fungsi untuk menyimpan key dari GitHub ke file lokal
function saveKey(key)
    writefile("savedKey.txt", key)
    savedKey = key
end

-- Fungsi untuk memuat key yang tersimpan
function loadSavedKey()
    if isfile("savedKey.txt") then
        savedKey = readfile("savedKey.txt")
        return savedKey
    end
    return nil
end

-- Fungsi untuk memverifikasi key dan username dari kode Lua
function verifyKeyWithUsername(key, username)
    for _, pair in ipairs(keysWithUsernames) do
        if pair.key == key and pair.username == username then
            onMessage("Key and username match!")
            return true
        end
    end
    return false
end

-- Fungsi utama untuk memverifikasi key
function verify(key)
    local playerName = game.Players.LocalPlayer.Name

    -- Pertama, coba validasi username dari Lua
    local isValidUsername = verifyKeyWithUsername(key, playerName)
    if isValidUsername then
        onMessage("Key and username are valid. Loading script...")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/natsu023/RBXM/main/jj"))()
        return true
    end

    -- Jika tidak cocok, cek validitas key dari GitHub
    local isValidGitHub = verifyKeyFromGitHub(key)
    if isValidGitHub then
        onMessage("Key from GitHub is valid and saved.")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/natsu023/RBXM/main/jj"))()
        return true
    else
        onMessage("Key is invalid!")
        return false
    end
end

-- Penggunaan GUI
checkKeyButton.MouseButton1Click:Connect(function()
    local key = textBox.Text
    if verify(key) then
        validationLabel.Text = "Key Is Valid!"
        validationLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        wait(2)
        validationLabel.Text = "Thanks For Using"
        validationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        wait(2)
        local tween = TweenService:Create(frame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, -0.5, -100)})
        tween:Play()
        tween.Completed:Connect(function()
            screenGui:Destroy()
        end)
    else
        validationLabel.Text = "Invalid Key!"
        validationLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        wait(2)
        validationLabel.Text = "Please Get Key"
        validationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

-- Saat pengguna membuka GUI, cek apakah ada key yang sudah tersimpan dari GitHub
if loadSavedKey() then
    local savedKey = loadSavedKey()

    if verify(savedKey) then
        validationLabel.Text = "Key Is Valid!"
        validationLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        wait(2)
        validationLabel.Text = "Thanks For Using"
        validationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        wait(2)
        local tween = TweenService:Create(frame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, -0.5, -100)})
        tween:Play()
        tween.Completed:Connect(function()
            screenGui:Destroy()
        end)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/natsu023/RBXM/main/jj"))()
    else
        validationLabel.Text = "Invalid Key!"
        validationLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        wait(2)
        validationLabel.Text = "Please Get Key"
        validationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end
