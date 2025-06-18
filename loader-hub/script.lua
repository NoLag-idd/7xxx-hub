debugX = true

-- First create the initialization screen function
local function showInitializationScreen()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "InitializationDisplay"
    screenGui.IgnoreGuiInset = true
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "InitializationText"
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
    textLabel.TextColor3 = Color3.new(0, 1, 0)
    textLabel.Font = Enum.Font.Code
    textLabel.TextSize = 36
    textLabel.Text = "PLS WAIT Initializing Database..."
    textLabel.TextScaled = false
    textLabel.TextWrapped = true
    textLabel.TextXAlignment = Enum.TextXAlignment.Center
    textLabel.TextYAlignment = Enum.TextYAlignment.Center
    textLabel.Parent = screenGui

    -- Color cycling coroutine
    coroutine.wrap(function()
        local hue = 0
        while true do
            hue = (hue + 0.01) % 1
            textLabel.TextColor3 = Color3.fromHSV(hue, 1, 1)
            local dots = string.rep(".", math.floor((tick() % 3) + 1))
            textLabel.Text = "PLS WAIT Initializing Database" .. dots
            task.wait(0.1)
        end
    end)()
    
    return screenGui
end

-- Show initialization screen while loading Rayfield
local initScreen = showInitializationScreen()

-- Load Rayfield with error handling
local Rayfield, rayfieldError = pcall(function()
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)

if not Rayfield or rayfieldError then
    initScreen:Destroy()
    warn("Failed to load Rayfield:", rayfieldError)
    return
end

-- Now create the window
local Window = Rayfield:CreateWindow({
   Name = "7xxx HUB",
   LoadingTitle = "7xxx Interface Suite",
   LoadingSubtitle = "by 7xxx Duping #GAG",
   ConfigurationSaving = {
      Enabled = false,
   },
   Discord = {
      Enabled = true,
      Invite = "2pKgPGNm",
      RememberJoins = false
   },
   KeySystem = false,
})

-- Remove initialization screen after Rayfield loads
initScreen:Destroy()

-- Create tabs and buttons
local Tab = Window:CreateTab("Script Tab", 4483362458)
local Section = Tab:CreateSection("Keyless Script Selection")

Tab:CreateButton({
    Name = "No-Lag Script",
    Callback = function()
        local loadingScreen = showInitializationScreen()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/main/Loader/LoaderV1.lua", true))()
        end)
        task.wait(15.5)
        loadingScreen:Destroy()
        if not success then
            warn("Failed to load No-Lag Script:", err)
        end
    end,
})

Tab:CreateButton({
    Name = "Anti Stealer",
    Callback = function()
        local loadingScreen = showInitializationScreen()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/NoLag-idd/No-Lag-HUB/main/Loader/LoaderV1.lua", true))()
        end)
        task.wait(15.5)
        loadingScreen:Destroy()
        if not success then
            warn("Failed to load Anti Stealer:", err)
        end
    end,
})

local Tab1 = Window:CreateTab("Premium Scripts", 4483362458)
local Section1 = Tab1:CreateSection("Key Script Selection")

Tab1:CreateButton({
    Name = "Lunor Script",
    Callback = function()
        local loadingScreen = showInitializationScreen()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://lunor.dev/loader", true))()
        end)
        task.wait(15.5)
        loadingScreen:Destroy()
        if not success then
            warn("Failed to load Lunor Script:", err)
        end
    end,
})

Tab1:CreateButton({
    Name = "Lumin Script",
    Callback = function()
        local loadingScreen = showInitializationScreen()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://lumin-hub.lol/loader.lua", true))()
        end)
        task.wait(15.5)
        loadingScreen:Destroy()
        if not success then
            warn("Failed to load Lumin Script:", err)
        end
    end,
})

Rayfield:LoadConfiguration()
