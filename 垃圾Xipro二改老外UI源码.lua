local Player = game:GetService("Players").LocalPlayer
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- 创建主界面
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SiTieGui"
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

-- 标题栏
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
TitleBar.BorderSizePixel = 0
TitleBar.Size = UDim2.new(1, 0, 0, 40)

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 15)
TitleCorner.Parent = TitleBar

local TitleText = Instance.new("TextLabel")
TitleText.Name = "TitleText"
TitleText.Parent = TitleBar
TitleText.BackgroundTransparency = 1
TitleText.Size = UDim2.new(1, -80, 1, 0)
TitleText.Position = UDim2.new(0, 15, 0, 0)
TitleText.Font = Enum.Font.GothamBold
TitleText.Text = "死铁轨脚本"
TitleText.TextColor3 = Color3.fromRGB(255, 80, 80)
TitleText.TextSize = 18
TitleText.TextXAlignment = Enum.TextXAlignment.Left

-- 关闭按钮
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = TitleBar
CloseButton.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -35, 0.5, -10)
CloseButton.Size = UDim2.new(0, 30, 0, 20)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(255, 80, 80)
CloseButton.TextSize = 16

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 5)
CloseCorner.Parent = CloseButton

-- 功能按钮区域
local ButtonContainer = Instance.new("Frame")
ButtonContainer.Name = "ButtonContainer"
ButtonContainer.Parent = MainFrame
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.Position = UDim2.new(0, 20, 0, 50)
ButtonContainer.Size = UDim2.new(1, -40, 0, 200)

-- 创建功能按钮
local function CreateFeatureButton(name, position, icon)
    local Button = Instance.new("TextButton")
    Button.Name = name
    Button.Parent = ButtonContainer
    Button.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    Button.BorderSizePixel = 0
    Button.Position = position
    Button.Size = UDim2.new(0, 170, 0, 60)
    Button.Font = Enum.Font.Gotham
    Button.Text = ""
    Button.TextColor3 = Color3.fromRGB(220, 220, 220)
    Button.TextSize = 14
    Button.AutoButtonColor = false
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 10)
    ButtonCorner.Parent = Button
    
    local IconLabel = Instance.new("TextLabel")
    IconLabel.Name = "Icon"
    IconLabel.Parent = Button
    IconLabel.BackgroundTransparency = 1
    IconLabel.Position = UDim2.new(0, 15, 0, 10)
    IconLabel.Size = UDim2.new(0, 30, 0, 30)
    IconLabel.Font = Enum.Font.GothamBold
    IconLabel.Text = icon
    IconLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
    IconLabel.TextSize = 20
    
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Name = "Text"
    TextLabel.Parent = Button
    TextLabel.BackgroundTransparency = 1
    TextLabel.Position = UDim2.new(0, 55, 0, 0)
    TextLabel.Size = UDim2.new(0, 100, 1, 0)
    TextLabel.Font = Enum.Font.Gotham
    TextLabel.Text = name
    TextLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    TextLabel.TextSize = 16
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Name = "Status"
    StatusLabel.Parent = Button
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Position = UDim2.new(0, 55, 0, 25)
    StatusLabel.Size = UDim2.new(0, 100, 0, 20)
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.Text = "未启用"
    StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    StatusLabel.TextSize = 12
    StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    return Button
end

-- 创建功能按钮
local AutoFarmBtn = CreateFeatureButton("自动刷怪", UDim2.new(0, 0, 0, 0), "⚔️")
local AutoCollectBtn = CreateFeatureButton("自动收集", UDim2.new(0, 190, 0, 0), "💰")
local TeleportBtn = CreateFeatureButton("传送功能", UDim2.new(0, 0, 0, 70), "🚀")
local ESPBtn = CreateFeatureButton("透视显示", UDim2.new(0, 190, 0, 70), "👁️")
local SpeedBtn = CreateFeatureButton("速度提升", UDim2.new(0, 0, 0, 140), "⚡")
local GodModeBtn = CreateFeatureButton("上帝模式", UDim2.new(0, 190, 0, 140), "🛡️")

-- 底部状态栏
local StatusBar = Instance.new("Frame")
StatusBar.Name = "StatusBar"
StatusBar.Parent = MainFrame
StatusBar.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
StatusBar.BorderSizePixel = 0
StatusBar.Position = UDim2.new(0, 0, 1, -30)
StatusBar.Size = UDim2.new(1, 0, 0, 30)

local StatusText = Instance.new("TextLabel")
StatusText.Name = "StatusText"
StatusText.Parent = StatusBar
StatusText.BackgroundTransparency = 1
StatusText.Size = UDim2.new(1, -20, 1, 0)
StatusText.Position = UDim2.new(0, 10, 0, 0)
StatusText.Font = Enum.Font.Gotham
StatusText.Text = "死铁轨脚本已加载 - 选择功能启用"
StatusText.TextColor3 = Color3.fromRGB(180, 180, 180)
StatusText.TextSize = 12
StatusText.TextXAlignment = Enum.TextXAlignment.Left

-- 按钮交互功能
local function ToggleButton(button)
    local currentStatus = button:FindFirstChild("Status")
    local currentText = button:FindFirstChild("Text")
    
    if currentStatus.Text == "未启用" then
        currentStatus.Text = "已启用"
        currentStatus.TextColor3 = Color3.fromRGB(80, 255, 80)
        button.BackgroundColor3 = Color3.fromRGB(40, 50, 40)
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(45, 55, 45)
        }):Play()
    else
        currentStatus.Text = "未启用"
        currentStatus.TextColor3 = Color3.fromRGB(150, 150, 150)
        button.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(35, 35, 40)
        }):Play()
    end
end

-- 按钮点击事件
AutoFarmBtn.MouseButton1Click:Connect(function()
    ToggleButton(AutoFarmBtn)
    StatusText.Text = "自动刷怪功能已切换"
end)

AutoCollectBtn.MouseButton1Click:Connect(function()
    ToggleButton(AutoCollectBtn)
    StatusText.Text = "自动收集功能已切换"
end)

TeleportBtn.MouseButton1Click:Connect(function()
    ToggleButton(TeleportBtn)
    StatusText.Text = "传送功能已切换"
end)

ESPBtn.MouseButton1Click:Connect(function()
    ToggleButton(ESPBtn)
    StatusText.Text = "透视显示功能已切换"
end)

SpeedBtn.MouseButton1Click:Connect(function()
    ToggleButton(SpeedBtn)
    StatusText.Text = "速度提升功能已切换"
end)

GodModeBtn.MouseButton1Click:Connect(function()
    ToggleButton(GodModeBtn)
    StatusText.Text = "上帝模式功能已切换"
end)

-- 按钮悬停效果
local function SetupButtonHover(button)
    button.MouseEnter:Connect(function()
        if button:FindFirstChild("Status").Text == "未启用" then
            TweenService:Create(button, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(45, 45, 50)
            }):Play()
        else
            TweenService:Create(button, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(50, 60, 50)
            }):Play()
        end
    end)
    
    button.MouseLeave:Connect(function()
        if button:FindFirstChild("Status").Text == "未启用" then
            TweenService:Create(button, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(35, 35, 40)
            }):Play()
        else
            TweenService:Create(button, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(45, 55, 45)
            }):Play()
        end
    end)
end

-- 应用悬停效果到所有按钮
SetupButtonHover(AutoFarmBtn)
SetupButtonHover(AutoCollectBtn)
SetupButtonHover(TeleportBtn)
SetupButtonHover(ESPBtn)
SetupButtonHover(SpeedBtn)
SetupButtonHover(GodModeBtn)

-- 关闭按钮功能
CloseButton.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.3), {
        Size = UDim2.new(0, 0, 0, 300),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    wait(0.3)
    ScreenGui:Destroy()
end)

CloseButton.MouseEnter:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    }):Play()
end)

CloseButton.MouseLeave:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    }):Play()
end)

-- 窗口拖动功能
local dragging = false
local dragStart = nil
local startPos = nil

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

TitleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- 初始动画
MainFrame.Size = UDim2.new(0, 0, 0, 300)
TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 400, 0, 300)
}):Play()
