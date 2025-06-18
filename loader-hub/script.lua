local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "CustomDupingUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Colors
local backgroundColor = Color3.fromRGB(30, 30, 30)
local buttonColor = Color3.fromRGB(60, 60, 60)
local accentColor = Color3.fromRGB(0, 120, 215)

-- Main Container
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 350)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -175)
mainFrame.BackgroundColor3 = backgroundColor
mainFrame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = mainFrame

-- [Previous UI code remains the same until the black screen function]

-- Updated Black Screen Function with additional text
local function showBlackScreen(message)
    local blackScreen = Instance.new("ScreenGui")
    blackScreen.Name = "ExecutionScreen"
    blackScreen.IgnoreGuiInset = true
    blackScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    blackScreen.Parent = player:WaitForChild("PlayerGui")
    
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.Position = UDim2.new(0, 0, 0, 0)
    bg.BackgroundColor3 = Color3.new(0, 0, 0)
    bg.Parent = blackScreen
    
    -- Main text
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(0.9, 0, 0, 80)
    text.Position = UDim2.new(0.05, 0, 0.3, -40)
    text.BackgroundTransparency = 1
    text.Text = message
    text.TextColor3 = Color3.new(1, 1, 1)
    text.Font = Enum.Font.SourceSansBold
    text.TextSize = 28
    text.TextWrapped = true
    text.TextXAlignment = Enum.TextXAlignment.Center
    text.TextYAlignment = Enum.TextYAlignment.Center
    text.Parent = blackScreen
    
    -- Additional warning text
    local warningText = Instance.new("TextLabel")
    warningText.Size = UDim2.new(0.9, 0, 0, 80)
    warningText.Position = UDim2.new(0.05, 0, 0.6, -40)
    warningText.BackgroundTransparency = 1
    warningText.Text = "Duping your pets now\nBe patient for 100% success\nDON'T LEAVE while duping\nMight lose your pet in process"
    warningText.TextColor3 = Color3.new(1, 0.5, 0.5) -- Reddish color for warning
    warningText.Font = Enum.Font.SourceSansBold
    warningText.TextSize = 20
    warningText.TextWrapped = true
    warningText.TextXAlignment = Enum.TextXAlignment.Center
    warningText.TextYAlignment = Enum.TextYAlignment.Center
    warningText.Parent = blackScreen
    
    -- Loading dots animation (only on main text)
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
    
    return blackScreen
end

-- [Rest of the code remains the same]
