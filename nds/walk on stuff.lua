local Workspace = game:GetService("Workspace")

-- Define a rizzful green color
local calmingGreen = Color3.fromRGB(0, 255, 123) -- Adjust RGB values as needed

-- Loop through each 'Island' object in the Workspace
for _, island in pairs(Workspace:GetChildren()) do
    if island.Name == "Island" and island:IsA("Model") then -- Ensure it's an 'Island' model
        for _, child in ipairs(island:GetChildren()) do
            if child:IsA("BasePart") then -- Check if the child is a BasePart
                child.Color = calmingGreen -- Set the color to rizzful green
                child.CanCollide = true -- Ensure the part is collidable
            end
        end
    end
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

-- Correctly reference 'WaterLevel' with the correct case
local waterLevelObject = Workspace:FindFirstChild("WaterLevel")
if not waterLevelObject then
    warn("WaterLevel object not found.")
    return
end

local player = Players.LocalPlayer
local floating = true
local floatName = "FloatingPart"
local floatPart
local floatValueAdjustment = 0 -- Initial adjustment to the water level

local function createOrUpdateFloatPart()
    local character = player.Character or player.CharacterAdded:Wait()
    if not floating then
        if floatPart then
            floatPart:Destroy()
            floatPart = nil
        end
        return
    end

    if not floatPart or not floatPart.Parent then
        floatPart = Instance.new('Part')
        floatPart.Name = floatName
        floatPart.Transparency = 0.5 -- Make it slightly visible for demonstration, set to 1 for full invisibility
        floatPart.Size = Vector3.new(100, 5, 100) -- Customize the size as needed
        floatPart.Anchored = true
        floatPart.Color = Color3.fromRGB(13,105, 172) -- Cyan for visibility, adjust as needed
        floatPart.CanCollide = true
        floatPart.Parent = Workspace
    end

    -- Update the platform position to be at the water level, below the player
    local waterY = waterLevelObject.Position.Y + floatValueAdjustment
    if character:FindFirstChild("HumanoidRootPart") then
        floatPart.Position = Vector3.new(character.HumanoidRootPart.Position.X, waterY, character.HumanoidRootPart.Position.Z)
    end
end

-- Adjust platform height with key presses
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.E then
        floatValueAdjustment = floatValueAdjustment + 0.5
    elseif input.KeyCode == Enum.KeyCode.Q then
        floatValueAdjustment = floatValueAdjustment - 0.5
    end
end)

-- Main loop to constantly adjust the platform's position
RunService.RenderStepped:Connect(function()
    createOrUpdateFloatPart()
end)
