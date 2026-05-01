--// D4 FLOAT BUTTON (INTEGRATED)

local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

-- BUTTON
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

-- GLOW
local stroke = Instance.new("UIStroke", button)
stroke.Color = Color3.fromRGB(170,0,255)
stroke.Thickness = 2

-- GRADIENT
local grad = Instance.new("UIGradient", button)
grad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(120,0,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(200,0,255))
}

-- STATE
local open = true

-- TOGGLE (SMOOTH ANIMATION)
button.MouseButton1Click:Connect(function()
    open = not open

    if open then
        main.Visible = true

        main.Size = UDim2.new(0.3
