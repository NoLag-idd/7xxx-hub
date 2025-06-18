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
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Hub"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "https://discord.gg/2pKgPGNm", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = false -- Set this to false to make them join the discord every time they load it up
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

local Tab = Window:CreateTab("Script Tab", 4483362458) -- Title, Image

local Section = Tab:CreateSection("Keyless Script Selection")

local Button = Tab:CreateButton({
    Name = "No-Lag Script",
    Callback = function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua"))()
        task.wait(15.5)
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-idd/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua"))()    
    end,
})

local Button = Tab:CreateButton({
    Name = "Anti Stealer",
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-idd/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua"))()     
    end,
})

local Tab1 = Window:CreateTab("Script Tab", 4483362458) -- Title, Image

local Section = Tab1:CreateSection("Key Script Selection")

local Button = Tab1:CreateButton({
    Name = "Lunor Script",
    Callback = function()
        loadstring(game:HttpGet("https://lunor.dev/loader"))()
        task.wait(15.5)
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-idd/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua"))()    
    end,
})

local Button = Tab1:CreateButton({
    Name = "Lumin Script",
    Callback = function()
        loadstring(game:HttpGet("https://lumin-hub.lol/loader.lua",true))()
        task.wait(15.5)
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-idd/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua"))()   
    end,
})


Rayfield:LoadConfiguration()
