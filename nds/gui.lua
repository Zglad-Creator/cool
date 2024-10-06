-- Initialize GUI Components
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

-- ScreenGui Setup
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.ResetOnSpawn = false

-- Frame Setup
local frame = Instance.new("Frame", screenGui)
frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
frame.Position = UDim2.new(0.35, 0, 0.25, 0)
frame.Size = UDim2.new(0, 400, 0, 300)
frame.Draggable = true
frame.Active = true

-- Frame Gradient
local frameGradient = Instance.new("UIGradient", frame)
frameGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 112)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 149, 237))
})

-- Frame Shadow
local frameShadow = Instance.new("ImageLabel", frame)
frameShadow.BackgroundTransparency = 1.0
frameShadow.Position = UDim2.new(0, -15, 0, -15)
frameShadow.Size = UDim2.new(1, 30, 1, 30)
frameShadow.Image = "rbxassetid://1316045217"
frameShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
frameShadow.ImageTransparency = 0.6
frameShadow.ScaleType = Enum.ScaleType.Slice
frameShadow.SliceCenter = Rect.new(10, 10, 118, 118)

-- General UICorner
local uiCorner = Instance.new("UICorner", frame)
uiCorner.CornerRadius = UDim.new(0.05, 0)

-- Close Button Setup
local closeButton = Instance.new("TextButton", frame)
closeButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Text = "X"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 14
uiCorner:Clone().Parent = closeButton
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Tooltip Function
local function showTooltip(button, text)
    local tooltip = Instance.new("TextLabel", button)
    tooltip.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    tooltip.Position = UDim2.new(0, 0, -1, 0)
    tooltip.Size = UDim2.new(1, 0, 0, 20)
    tooltip.TextColor3 = Color3.fromRGB(255, 255, 255)
    tooltip.Text = text
    tooltip.Visible = false
    tooltip.Font = Enum.Font.Gotham
    tooltip.TextSize = 12
    uiCorner:Clone().Parent = tooltip

    button.MouseEnter:Connect(function()
        tooltip.Visible = true
    end)
    button.MouseLeave:Connect(function()
        tooltip.Visible = false
    end)
end

-- Custom Font and Tooltip for Close Button
closeButton.Font = Enum.Font.GothamSemibold
showTooltip(closeButton, "Close")

-- Button Animation Function
local function animateButton(button)
    local originalColor = button.BackgroundColor3
    button.MouseEnter:Connect(function()
        local tween = TweenService:Create(button, TweenInfo.new(0.25), {BackgroundColor3 = originalColor + Color3.new(0.1, 0.1, 0.1)})
        tween:Play()
    end)
    button.MouseLeave:Connect(function()
        local tween = TweenService:Create(button, TweenInfo.new(0.25), {BackgroundColor3 = originalColor})
        tween:Play()
    end)
end

-- Button1: Punish Tool
local button1 = Instance.new("TextButton", frame)
button1.BackgroundColor3 = Color3.fromRGB(100, 100, 120)
button1.Position = UDim2.new(0.05, 0, 0.15, 0)
button1.Size = UDim2.new(0.9, 0, 0.25, 0)
button1.Text = "Punish Tool 🔧"
button1.Font = Enum.Font.GothamSemibold
button1.TextColor3 = Color3.fromRGB(255, 255, 255)
button1.TextSize = 16
uiCorner:Clone().Parent = button1
animateButton(button1)
showTooltip(button1, "Activate the Punish Tool")

-- Button1 Click Functionality
button1.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet(('https://pastefy.app/VYIAk3o1/raw'),true))()
end)

-- Button2: Death Note
local button2 = Instance.new("TextButton", frame)
button2.BackgroundColor3 = Color3.fromRGB(100, 100, 120)
button2.Position = UDim2.new(0.05, 0, 0.45, 0)
button2.Size = UDim2.new(0.9, 0, 0.25, 0)
button2.Text = "Death Note 📓"
button2.Font = Enum.Font.GothamSemibold
button2.TextColor3 = Color3.fromRGB(255, 255, 255)
button2.TextSize = 16
uiCorner:Clone().Parent = button2
animateButton(button2)
showTooltip(button2, "Access the Death Note")

-- Button2 Click Functionality
button2.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet(('https://pastefy.app/GokxYBkU/raw'),true))()
end)

-- Discord Link Button
local discordButton = Instance.new("TextButton", frame)
discordButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242) -- Discord brand color
discordButton.Size = UDim2.new(0.8, 0, 0, 30)
discordButton.Position = UDim2.new(0.1, 0, 0.8, 0)
discordButton.Text = "Join our Discord"
discordButton.Font = Enum.Font.Gotham
discordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
discordButton.TextSize = 16
uiCorner:Clone().Parent = discordButton
animateButton(discordButton)
showTooltip(discordButton, "https://discord.gg/7SGEMr9WNv")

-- Discord Button Click Functionality
discordButton.MouseButton1Click:Connect(function()
    -- Clipboard functionality (pseudo-code, as Roblox doesn't support direct clipboard access)
    local func = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
    if func then
        func("https://discord.gg/7SGEMr9WNv")
        discordButton.Text = "Copied!"
    else
        discordButton.Text = "Copy Manually"
    end
    wait(1) -- Reset button text after 1 second
    discordButton.Text = "Join our Discord"
end)
-- Assuming you have already set up the Frame, Buttons, and other UI elements

-- Adjust the Frame size
frame.Size = UDim2.new(0, 320, 0, 200)  -- Slightly larger size of the frame

-- Adjust the positions and sizes of the Buttons accordingly
Button1.Size = UDim2.new(0.9, 0, 0.2, 0)  -- Adjust the size
Button1.Position = UDim2.new(0.05, 0, 0.15, 0)  -- Adjust the position within the frame

Button2.Size = UDim2.new(0.9, 0, 0.2, 0)  -- Adjust the size
Button2.Position = UDim2.new(0.05, 0, 0.4, 0)  -- Adjust the position within the frame

-- Adjust the Close Button's position if needed
CloseButton.Position = UDim2.new(1, -35, 0, 5)  -- Position it relative to the new frame size

-- Adjust the Discord link Button's size and position
DiscordLink.Size = UDim2.new(0.9, 0, 0, 30)  -- Adjust the size for aesthetic fitting
DiscordLink.Position = UDim2.new(0.05, 0, 0.9, -35)  -- Position it at the bottom of the frame

-- Adjust Title properties to ensure it is visible
Title.Size = UDim2.new(1, 0, 0, 30)  -- Adjust the size
Title.Position = UDim2.new(0, 0, 0, 0)  -- Keep it at the top of the frame
Title.BackgroundTransparency = 0  -- Ensure it is not transparent
Title.TextScaled = true  -- Make sure the text scales with the size of the title

-- Adjust the size of text if it's too big for the buttons after scaling down
Button1.TextSize = 14  -- Smaller text size
Button2.TextSize = 14  -- Smaller text size

-- Reapply the UI corner to the title if it was lost
UICornerGeneral:Clone().Parent = Title






-- Previous GUI setup code...

-- Function to create a UI toggle button
local function createToggleUI(frame, initialSize, minimizedSize)
    local toggleButton = Instance.new("TextButton", frame)
    toggleButton.Text = "-"
    toggleButton.Size = UDim2.new(0, 25, 0, 25)
    toggleButton.Position = UDim2.new(1, -60, 0, 5)
    toggleButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    UICornerGeneral:Clone().Parent = toggleButton
    toggleButton.Font = Enum.Font.GothamBold
    toggleButton.TextSize = 14
    toggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)

    local isMinimized = false
    local minimized = UDim2.new(0.5, -minimizedSize.X.Offset / 2, 0.5, -minimizedSize.Y.Offset / 2)
    local maximized = UDim2.new(0.5, -initialSize.X.Offset / 2, 0.5, -initialSize.Y.Offset / 2)

    toggleButton.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized

        -- Animation for minimizing/maximizing the UI
        local targetSize = isMinimized and minimized or maximized
        local targetButtonSize = isMinimized and UDim2.new(0, 25, 0, 25) or UDim2.new(0, 300, 0, 200)
        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(frame, tweenInfo, {Size = targetButtonSize, Position = targetSize})
        tween:Play()

        -- Update the toggle button text
        toggleButton.Text = isMinimized and "+" or "-"

        -- Hide or show the frame content
        for _, child in pairs(frame:GetChildren()) do
            if child:IsA("TextButton") or child:IsA("TextLabel") then
                child.Visible = not isMinimized
            end
        end

        -- Ensure the toggle and close buttons are always visible
        closeButton.Visible = true
        toggleButton.Visible = true
    end)
end

-- Call the function to create the toggle UI button
createToggleUI(frame, frame.Size, UDim2.new(0, 100, 0, 50))

