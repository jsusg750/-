local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 清理旧GUI
for _, gui in pairs(playerGui:GetChildren()) do
    if gui.Name == "SiTieGui" then
        gui:Destroy()
    end
end

-- 创建主界面
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SiTieGui"
ScreenGui.Parent = playerGui

-- 主容器 - 半透明深色
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
Main.BackgroundTransparency = 0.1  -- 半透明效果
Main.BorderSizePixel = 0
Main.Size = UDim2.new(0, 320, 0, 200)
Main.Position = UDim2.new(0.5, -160, 0.5, -100)
Main.AnchorPoint = Vector2.new(0.5, 0.5)

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = Main

-- 标题栏 - 修复拖动冲突
local Title = Instance.new("Frame")
Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
Title.BackgroundTransparency = 0.1
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 0, 35)

local TitleText = Instance.new("TextLabel")
TitleText.Name = "TitleText"
TitleText.Parent = Title
TitleText.BackgroundTransparency = 1
TitleText.Size = UDim2.new(1, -80, 1, 0)
TitleText.Position = UDim2.new(0, 15, 0, 0)
TitleText.Font = Enum.Font.GothamBold
TitleText.Text = "死铁轨脚本"
TitleText.TextColor3 = Color3.fromRGB(255, 80, 80)
TitleText.TextSize = 16

-- 控制按钮 - 添加圆角
local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Parent = Title
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
CloseBtn.BorderSizePixel = 0
CloseBtn.Position = UDim2.new(1, -45, 0.5, -10)
CloseBtn.Size = UDim2.new(0, 20, 0, 20)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 14
CloseBtn.ZIndex = 2  -- 确保按钮在最上层

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

local MinBtn = Instance.new("TextButton")
MinBtn.Name = "MinBtn"
MinBtn.Parent = Title
MinBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
MinBtn.BorderSizePixel = 0
MinBtn.Position = UDim2.new(1, -70, 0.5, -10)
MinBtn.Size = UDim2.new(0, 20, 0, 20)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.Text = "－"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.TextSize = 14
MinBtn.ZIndex = 2

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 6)
MinCorner.Parent = MinBtn

-- 导航按钮容器 - 修复布局
local Nav = Instance.new("Frame")
Nav.Name = "Nav"
Nav.Parent = Main
Nav.BackgroundTransparency = 1
Nav.Position = UDim2.new(0, 10, 0, 40)
Nav.Size = UDim2.new(1, -20, 0, 30)

local NavItems = {"🏠主页", "⚔️战斗", "🚀移动", "👁️视觉"}
local NavBtns = {}

for i, text in ipairs(NavItems) do
    local Btn = Instance.new("TextButton")
    Btn.Name = "NavBtn"..i
    Btn.Parent = Nav
    Btn.BackgroundColor3 = i == 1 and Color3.fromRGB(255, 80, 80) or Color3.fromRGB(50, 50, 60)
    Btn.BackgroundTransparency = 0.1
    Btn.BorderSizePixel = 0
    Btn.Position = UDim2.new(0, (i-1)*75, 0, 0)
    Btn.Size = UDim2.new(0, 70, 1, 0)
    Btn.Font = Enum.Font.Gotham
    Btn.Text = text
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextSize = 12
    Btn.ZIndex = 2
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 8)
    BtnCorner.Parent = Btn
    
    table.insert(NavBtns, Btn)
end

-- 功能区域 - 修复布局
local Content = Instance.new("ScrollingFrame")
Content.Name = "Content"
Content.Parent = Main
Content.BackgroundTransparency = 1
Content.Position = UDim2.new(0, 10, 0, 75)
Content.Size = UDim2.new(1, -20, 1, -85)
Content.ScrollBarThickness = 4
Content.CanvasSize = UDim2.new(0, 0, 0, 120)

-- 功能按钮 - 添加圆角，修复布局
local Features = {
    "自动刷怪", "速度提升", "透视显示",
    "上帝模式", "飞行模式", "夜视模式"
}

for i, name in ipairs(Features) do
    local Btn = Instance.new("TextButton")
    Btn.Name = name
    Btn.Parent = Content
    Btn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    Btn.BackgroundTransparency = 0.1
    Btn.BorderSizePixel = 0
    Btn.Position = UDim2.new(0, 0, 0, (i-1)*35)
    Btn.Size = UDim2.new(1, 0, 0, 30)
    Btn.Font = Enum.Font.Gotham
    Btn.Text = name
    Btn.TextColor3 = Color3.fromRGB(220, 220, 220)
    Btn.TextSize = 12
    Btn.ZIndex = 2
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = Btn
    
    Btn.MouseButton1Click:Connect(function()
        Btn.BackgroundColor3 = Btn.BackgroundColor3 == Color3.fromRGB(50, 50, 60) 
            and Color3.fromRGB(80, 255, 80) 
            or Color3.fromRGB(50, 50, 60)
    end)
end

-- 修复拖动功能 - 只在标题栏空白区域拖动
local dragging = false
local dragStart, startPos

-- 只在标题栏文本区域拖动
TitleText.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
    end
end)

TitleText.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.Touch then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- 导航按钮功能
for i, btn in ipairs(NavBtns) do
    btn.MouseButton1Click:Connect(function()
        for j, navBtn in ipairs(NavBtns) do
            navBtn.BackgroundColor3 = i == j and Color3.fromRGB(255, 80, 80) or Color3.fromRGB(50, 50, 60)
        end
    end)
end

-- 缩小功能
local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    Main.Size = minimized and UDim2.new(0, 320, 0, 35) or UDim2.new(0, 320, 0, 200)
    Content.Visible = not minimized
    Nav.Visible = not minimized
    MinBtn.Text = minimized and "＋" or "－"
end)

-- 关闭功能
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- 初始动画
Main.Size = UDim2.new(0, 0, 0, 0)
TweenService:Create(Main, TweenInfo.new(0.3), {Size = UDim2.new(0, 320, 0, 200)}):Play()

print("死铁轨脚本UI加载完成")
