local player = game.Players.LocalPlayer

-- Nom du fichier qui va stocker la clé
local keyFile = "Milka_StreamSniping_key.txt"

-- Clé valide
local validKey = "9Fz$7qL!r8Vx2@Dk5Wp#YbM4tNj*XhQ1"

-- Vérifie si l’exécuteur supporte la sauvegarde
local canSave = writefile and readfile and isfile

-- Vérifie si un fichier avec la clé existe déjà
local savedKey
if canSave and isfile(keyFile) then
    savedKey = readfile(keyFile)
end

-- Si la clé est déjà correcte → charger direct
if savedKey == validKey then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/StarTradeBr/MilkaLoader/refs/heads/main/Milka%20Loader.lua"))()
    return
end

-- Sinon, on lance ton interface
local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Frame principale
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 180)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local frameUICorner = Instance.new("UICorner")
frameUICorner.CornerRadius = UDim.new(0, 15)
frameUICorner.Parent = frame

-- Titre
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🔑 Enter Your Key"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

-- Champ de texte
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0.8, 0, 0, 40)
textBox.Position = UDim2.new(0.1, 0, 0.3, 0)
textBox.PlaceholderText = "Enter key here"
textBox.TextScaled = true
textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.ClearTextOnFocus = false
textBox.Parent = frame

local textBoxCorner = Instance.new("UICorner")
textBoxCorner.CornerRadius = UDim.new(0, 10)
textBoxCorner.Parent = textBox

-- Feedback label
local feedback = Instance.new("TextLabel")
feedback.Size = UDim2.new(1, 0, 0, 20)
feedback.Position = UDim2.new(0, 0, 0.55, 0)
feedback.BackgroundTransparency = 1
feedback.Text = ""
feedback.TextColor3 = Color3.fromRGB(255, 255, 0)
feedback.TextScaled = true
feedback.Font = Enum.Font.Gotham
feedback.Parent = frame

-- Bouton Get Key
local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(0, 160, 0, 40)
getKeyButton.Position = UDim2.new(0.05, 0, 0.7, 0)
getKeyButton.Text = "Get Key"
getKeyButton.TextScaled = true
getKeyButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
getKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyButton.Font = Enum.Font.GothamBold
getKeyButton.Parent = frame

local getKeyCorner = Instance.new("UICorner")
getKeyCorner.CornerRadius = UDim.new(0, 10)
getKeyCorner.Parent = getKeyButton

-- Bouton Submit Key
local submitKeyButton = Instance.new("TextButton")
submitKeyButton.Size = UDim2.new(0, 160, 0, 40)
submitKeyButton.Position = UDim2.new(0.55, 0, 0.7, 0)
submitKeyButton.Text = "Submit Key"
submitKeyButton.TextScaled = true
submitKeyButton.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
submitKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitKeyButton.Font = Enum.Font.GothamBold
submitKeyButton.Parent = frame

local submitKeyCorner = Instance.new("UICorner")
submitKeyCorner.CornerRadius = UDim.new(0, 10)
submitKeyCorner.Parent = submitKeyButton

-- Fonction Get Key
getKeyButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://loot-link.com/s?X43H0ICh")
        feedback.Text = "✅ Link copied to clipboard!"
    else
        feedback.Text = "⚠️ Your executor doesn't support setclipboard."
    end
    task.delay(2, function()
        feedback.Text = ""
    end)
end)

-- Fonction Submit Key
submitKeyButton.MouseButton1Click:Connect(function()
    local enteredKey = textBox.Text
    if enteredKey == validKey then
        feedback.Text = "✅ Key correct! Loading script..."
        task.delay(1, function()
            -- Sauvegarde seulement si supporté
            if canSave then
                writefile(keyFile, enteredKey)
            end
            loadstring(game:HttpGet("loadstring(game:HttpGet("https://raw.githubusercontent.com/StarTradeBr/StreamSniping/refs/heads/main/StreamSnipingByMilka.lua"))()"))()
            screenGui:Destroy()
        end)
    else
        player:Kick("Key invalid !")
    end
end)