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

-- 主容器
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
Main.BorderSizePixel = 0
Main.Size = UDim2.new(0, 300, 0, 180)
Main.Position = UDim2.new(0.5, -150, 0.5, -90) -- 屏幕中央
Main.AnchorPoint = Vector2.new(0.5, 0.5)

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 10)
Corner.Parent = Main

-- 标题栏
local Title = Instance.new("Frame")
Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 0, 30)

local TitleText = Instance.new("TextLabel")
TitleText.Name = "TitleText"
TitleText.Parent = Title
TitleText.BackgroundTransparency = 1
TitleText.Size = UDim2.new(1, -60, 1, 0)
TitleText.Position = UDim2.new(0, 10, 0, 0)
TitleText.Font = Enum.Font.GothamBold
TitleText.Text = "死铁轨脚本"
TitleText.TextColor3 = Color3.fromRGB(255, 80, 80)
TitleText.TextSize = 16

-- 控制按钮
local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Parent = Title
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
CloseBtn.BorderSizePixel = 0
CloseBtn.Position = UDim2.new(1, -25, 0.5, -10)
CloseBtn.Size = UDim2.new(0, 20, 0, 20)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 14

local MinBtn = Instance.new("TextButton")
MinBtn.Name = "MinBtn"
MinBtn.Parent = Title
MinBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
MinBtn.BorderSizePixel = 0
MinBtn.Position = UDim2.new(1, -50, 0.5, -10)
MinBtn.Size = UDim2.new(0, 20, 0, 20)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.Text = "－"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.TextSize = 14

-- 导航按钮
local Nav = Instance.new("Frame")
Nav.Name = "Nav"
Nav.Parent = Main
Nav.BackgroundTransparency = 1
Nav.Position = UDim2.new(0, 10, 0, 35)
Nav.Size = UDim2.new(1, -20, 0, 25)

local NavItems = {"🏠", "⚔️", "🚀", "👁️"}
local NavBtns = {}

for i, icon in ipairs(NavItems) do
    local Btn = Instance.new("TextButton")
    Btn.Name = "NavBtn"..i
    Btn.Parent = Nav
    Btn.BackgroundColor3 = i == 1 and Color3.fromRGB(255, 80, 80) or Color3.fromRGB(50, 50, 60)
    Btn.BorderSizePixel = 0
    Btn.Position = UDim2.new(0, (i-1)*65, 0, 0)
    Btn.Size = UDim2.new(0, 60, 1, 0)
    Btn.Font = Enum.Font.Gotham
    Btn.Text = icon
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextSize = 14
    
    table.insert(NavBtns, Btn)
end

-- 功能区域
local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Parent = Main
Content.BackgroundTransparency = 1
Content.Position = UDim2.new(0, 10, 0, 65)
Content.Size = UDim2.new(1, -20, 1, -75)

-- 功能按钮
local Features = {
    "自动刷怪", "速度提升", "透视显示",
    "上帝模式", "飞行模式", "夜视模式"
}

for i, name in ipairs(Features) do
    local Btn = Instance.new("TextButton")
    Btn.Name = name
    Btn.Parent = Content
    Btn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    Btn.BorderSizePixel = 0
    Btn.Position = UDim2.new(0, 0, 0, (i-1)*25)
    Btn.Size = UDim2.new(1, 0, 0, 20)
    Btn.Font = Enum.Font.Gotham
    Btn.Text = name
    Btn.TextColor3 = Color3.fromRGB(220, 220, 220)
    Btn.TextSize = 12
    
    Btn.MouseButton1Click:Connect(function()
        Btn.BackgroundColor3 = Btn.BackgroundColor3 == Color3.fromRGB(50, 50, 60) 
            and Color3.fromRGB(80, 255, 80) 
            or Color3.fromRGB(50, 50, 60)
    end)
end

-- 拖动功能
local dragging = false
local dragStart, startPos

Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
    end
end)

Title.InputEnded:Connect(function(input)
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

-- 缩小功能
local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    Main.Size = minimized and UDim2.new(0, 300, 0, 30) or UDim2.new(0, 300, 0, 180)
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
TweenService:Create(Main, TweenInfo.new(0.3), {Size = UDim2.new(0, 300, 0, 180)}):Play()

print("死铁轨脚本UI加载完成")
