local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

-- BLUR
local blur = Instance.new("BlurEffect", game.Lighting)
blur.Size = 0
TweenService:Create(blur, TweenInfo.new(0.4), {Size = 18}):Play()

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "D4vePremium"

-- MAIN
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0.5,0,0.6,0)
main.Position = UDim2.new(0.25,0,0.2,0)
main.BackgroundColor3 = Color3.fromRGB(10,10,15)
main.BorderSizePixel = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0,18)

-- STROKE
local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(170,0,255)
stroke.Thickness = 2

-- SIDEBAR
local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.new(0,170,1,0)
sidebar.BackgroundColor3 = Color3.fromRGB(15,15,22)
Instance.new("UICorner", sidebar)

local layout = Instance.new("UIListLayout", sidebar)
layout.Padding = UDim.new(0,8)

local pad = Instance.new("UIPadding", sidebar)
pad.PaddingTop = UDim.new(0,15)
pad.PaddingLeft = UDim.new(0,10)

-- INDICATOR
local indicator = Instance.new("Frame", sidebar)
indicator.Size = UDim2.new(0,4,0,40)
indicator.BackgroundColor3 = Color3.fromRGB(170,0,255)

-- CONTENT
local content = Instance.new("Frame", main)
content.Size = UDim2.new(1,-190,1,-20)
content.Position = UDim2.new(0,180,0,10)
content.BackgroundTransparency = 1

-- PAGES
local pages = {}

local function createPage(name)
    local page = Instance.new("Frame", content)
    page.Size = UDim2.new(1,0,1,0)
    page.BackgroundTransparency = 1
    page.Visible = false
    pages[name] = page
    return page
end

local function switchTab(name, btn)
    for _,p in pairs(pages) do
        p.Visible = false
    end

    local target = pages[name]
    target.Visible = true
    target.Position = UDim2.new(0.05,0,0,0)

    TweenService:Create(target, TweenInfo.new(0.25), {
        Position = UDim2.new(0,0,0,0)
    }):Play()

    TweenService:Create(indicator, TweenInfo.new(0.25), {
        Position = UDim2.new(0,0,0,btn.Position.Y.Offset)
    }):Play()
end

-- TAB BUTTON
local function makeTab(name)
    local btn = Instance.new("TextButton", sidebar)
    btn.Size = UDim2.new(1,-10,0,40)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(20,20,30)
    btn.TextColor3 = Color3.fromRGB(220,220,220)
    btn.BorderSizePixel = 0
    Instance.new("UICorner", btn)

    btn.MouseButton1Click:Connect(function()
        switchTab(name, btn)
    end)

    return btn
end

-- CREATE
local mainPage = createPage("Main")
local playerPage = createPage("Player")

makeTab("Main")
makeTab("Player")

-- TOGGLE
local function createToggle(parent, text, posY, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1,-20,0,50)
    frame.Position = UDim2.new(0,10,0,posY)
    frame.BackgroundColor3 = Color3.fromRGB(20,20,30)
    Instance.new("UICorner", frame)

    local label = Instance.new("TextLabel", frame)
    label.Text = text
    label.Size = UDim2.new(0.6,0,1,0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(220,220,220)

    local toggle = Instance.new("Frame", frame)
    toggle.Size = UDim2.new(0,50,0,24)
    toggle.Position = UDim2.new(1,-60,0.5,-12)
    toggle.BackgroundColor3 = Color3.fromRGB(60,60,70)
    Instance.new("UICorner", toggle).CornerRadius = UDim.new(1,0)

    local knob = Instance.new("Frame", toggle)
    knob.Size = UDim2.new(0,20,0,20)
    knob.Position = UDim2.new(0,2,0.5,-10)
    knob.BackgroundColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1,0)

    local on = false

    toggle.InputBegan:Connect(function()
        on = not on

        TweenService:Create(knob, TweenInfo.new(0.2), {
            Position = on and UDim2.new(1,-22,0.5,-10) or UDim2.new(0,2,0.5,-10)
        }):Play()

        TweenService:Create(toggle, TweenInfo.new(0.2), {
            BackgroundColor3 = on and Color3.fromRGB(150,0,255) or Color3.fromRGB(60,60,70)
        }):Play()

        if callback then callback(on) end
    end)
end

-- REAL FEATURE
createToggle(mainPage,"Speed Boost",20,function(on)
    local char = player.Character or player.CharacterAdded:Wait()
    local hum = char:WaitForChild("Humanoid")
    hum.WalkSpeed = on and 32 or 16
end)

-- =========================
-- 🔥 D4 BUTTON (INTEGRATED)
-- =========================

local button = Instance.new("TextButton")
button.Parent = gui
button.Size = UDim2.new(0,60,0,60)
button.Position = UDim2.new(0,20,0.5,-30)
button.BackgroundColor3 = Color3.fromRGB(20,20,30)
button.Text = "D4"
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.TextColor3 = Color3.fromRGB(220,220,255)
button.BorderSizePixel = 0
button.ZIndex = 999

Instance.new("UICorner", button).CornerRadius = UDim.new(1,0)

local btnStroke = Instance.new("UIStroke", button)
btnStroke.Color = Color3.fromRGB(170,0,255)
btnStroke.Thickness = 2

local open = true

button.MouseButton1Click:Connect(function()
    open = not open

    if open then
        main.Visible = true
        main.Size = UDim2.new(0.3,0,0.3,0)

        TweenService:Create(main, TweenInfo.new(0.25), {
            Size = UDim2.new(0.5,0,0.6,0)
        }):Play()
    else
        TweenService:Create(main, TweenInfo.new(0.2), {
            Size = UDim2.new(0,0,0,0)
        }):Play()

        task.delay(0.2, function()
            if not open then
                main.Visible = false
            end
        end)
    end
end)

-- DRAG
local dragging, dragInput, dragStart, startPos

button.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 
    or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPos = button.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

button.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement 
    or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        button.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)
