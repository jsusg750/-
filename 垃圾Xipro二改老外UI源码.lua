-- 手机横版死铁轨脚本UI - 完整版
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 清理旧GUI
for _, gui in pairs(playerGui:GetChildren()) do
    if gui.Name == "SiTieGuiMobile" then
        gui:Destroy()
    end
end

-- 创建主界面
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SiTieGuiMobile"
ScreenGui.Parent = playerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- 主容器
local MainContainer = Instance.new("Frame")
MainContainer.Name = "MainContainer"
MainContainer.Parent = ScreenGui
MainContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainContainer.BorderSizePixel = 0
MainContainer.Size = UDim2.new(0, 350, 0, 200)
MainContainer.Position = UDim2.new(0.5, -175, 0.5, -100) -- 屏幕中央
MainContainer.AnchorPoint = Vector2.new(0.5, 0.5)

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 15)
MainCorner.Parent = MainContainer

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 3
MainStroke.Color = Color3.fromRGB(255, 80, 80)
MainStroke.Parent = MainContainer

-- 标题栏（可拖动）
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Parent = MainContainer
TitleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
TitleBar.BorderSizePixel = 0
TitleBar.Size = UDim2.new(1, 0, 0, 40)

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 15)
TitleCorner.Parent = TitleBar

local TitleText = Instance.new("TextLabel")
TitleText.Name = "TitleText"
TitleText.Parent = TitleBar
TitleText.BackgroundTransparency = 1
TitleText.Position = UDim2.new(0, 15, 0, 0)
TitleText.Size = UDim2.new(0, 200, 1, 0)
TitleText.Font = Enum.Font.GothamBold
TitleText.Text = "死铁轨脚本"
TitleText.TextColor3 = Color3.fromRGB(255, 80, 80)
TitleText.TextSize = 18
TitleText.TextXAlignment = Enum.TextXAlignment.Left

-- 控制按钮
local ControlButtons = Instance.new("Frame")
ControlButtons.Name = "ControlButtons"
ControlButtons.Parent = TitleBar
ControlButtons.BackgroundTransparency = 1
ControlButtons.Position = UDim2.new(1, -100, 0, 0)
ControlButtons.Size = UDim2.new(0, 85, 1, 0)

-- 缩小按钮
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = ControlButtons
MinimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Position = UDim2.new(0, 5, 0.5, -12)
MinimizeButton.Size = UDim2.new(0, 24, 0, 24)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "－"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 16

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 6)
MinimizeCorner.Parent = MinimizeButton

-- 关闭按钮
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = ControlButtons
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(0, 55, 0.5, -12)
CloseButton.Size = UDim2.new(0, 24, 0, 24)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 16

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

-- 内容区域
local ContentPanel = Instance.new("Frame")
ContentPanel.Name = "ContentPanel"
ContentPanel.Parent = MainContainer
ContentPanel.BackgroundTransparency = 1
ContentPanel.Position = UDim2.new(0, 0, 0, 40)
ContentPanel.Size = UDim2.new(1, 0, 1, -40)

-- 导航按钮（横排）
local NavContainer = Instance.new("Frame")
NavContainer.Name = "NavContainer"
NavContainer.Parent = ContentPanel
NavContainer.BackgroundTransparency = 1
NavContainer.Position = UDim2.new(0, 10, 0, 10)
NavContainer.Size = UDim2.new(1, -20, 0, 40)

-- 导航项数据
local NavItems = {
    {Name = "主页", Icon = "🏠"},
    {Name = "战斗", Icon = "⚔️"},
    {Name = "移动", Icon = "🚀"},
    {Name = "视觉", Icon = "👁️"},
    {Name = "公告", Icon = "📢"}
}

local NavButtons = {}
local ActiveNav = "主页"

-- 创建导航按钮
for i, item in ipairs(NavItems) do
    local NavButton = Instance.new("TextButton")
    NavButton.Name = item.Name
    NavButton.Parent = NavContainer
    NavButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    NavButton.BorderSizePixel = 0
    NavButton.Position = UDim2.new(0, (i-1)*65, 0, 0)
    NavButton.Size = UDim2.new(0, 60, 1, 0)
    NavButton.Font = Enum.Font.Gotham
    NavButton.Text = item.Icon
    NavButton.TextColor3 = Color3.fromRGB(220, 220, 220)
    NavButton.TextSize = 16
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 8)
    ButtonCorner.Parent = NavButton
    
    -- 默认选中第一个
    if i == 1 then
        NavButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
    end
    
    table.insert(NavButtons, {Button = NavButton, Data = item})
end

-- 功能内容区域
local ContentArea = Instance.new("ScrollingFrame")
ContentArea.Name = "ContentArea"
ContentArea.Parent = ContentPanel
ContentArea.BackgroundTransparency = 1
ContentArea.Position = UDim2.new(0, 10, 0, 60)
ContentArea.Size = UDim2.new(1, -20, 1, -70)
ContentArea.ScrollBarThickness = 6
ContentArea.ScrollBarImageColor3 = Color3.fromRGB(255, 80, 80)
ContentArea.CanvasSize = UDim2.new(0, 0, 0, 200)

-- 功能数据
local FeatureData = {
    ["主页"] = {
        {Name = "自动刷怪", Icon = "⚔️", Status = false},
        {Name = "速度提升", Icon = "⚡", Status = false},
        {Name = "透视显示", Icon = "👁️", Status = false}
    },
    ["战斗"] = {
        {Name = "自动瞄准", Icon = "🎯", Status = false},
        {Name = "上帝模式", Icon = "🛡️", Status = false},
        {Name = "一击必杀", Icon = "💥", Status = false}
    },
    ["移动"] = {
        {Name = "飞行模式", Icon = "🕊️", Status = false},
        {Name = "穿墙移动", Icon = "🧱", Status = false},
        {Name = "无限跳跃", Icon = "🦘", Status = false}
    },
    ["视觉"] = {
        {Name = "夜视模式", Icon = "🌙", Status = false},
        {Name = "轮廓显示", Icon = "🔲", Status = false},
        {Name = "去雾效果", Icon = "🌫️", Status = false}
    }
}

local ContentPages = {}

-- 创建功能页面
for _, navItem in ipairs(NavItems) do
    local Page = Instance.new("Frame")
    Page.Name = navItem.Name
    Page.Parent = ContentArea
    Page.BackgroundTransparency = 1
    Page.Size = UDim2.new(1, 0, 0, 150)
    Page.Position = UDim2.new(0, 0, 0, 0)
    Page.Visible = navItem.Name == "主页"
    
    ContentPages[navItem.Name] = Page
    
    if FeatureData[navItem.Name] then
        for i, feature in ipairs(FeatureData[navItem.Name]) do
            local FeatureButton = Instance.new("TextButton")
            FeatureButton.Name = feature.Name
            FeatureButton.Parent = Page
            FeatureButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
            FeatureButton.BorderSizePixel = 0
            FeatureButton.Position = UDim2.new(0, 0, 0, (i-1)*50)
            FeatureButton.Size = UDim2.new(1, 0, 0, 45)
            FeatureButton.Font = Enum.Font.Gotham
            FeatureButton.Text = feature.Icon .. " " .. feature.Name
            FeatureButton.TextColor3 = Color3.fromRGB(220, 220, 220)
            FeatureButton.TextSize = 14
            
            local FeatureCorner = Instance.new("UICorner")
            FeatureCorner.CornerRadius = UDim.new(0, 8)
            FeatureCorner.Parent = FeatureButton
            
            -- 功能切换
            FeatureButton.MouseButton1Click:Connect(function()
                feature.Status = not feature.Status
                if feature.Status then
                    FeatureButton.BackgroundColor3 = Color3.fromRGB(80, 255, 80)
                    FeatureButton.Text = feature.Icon .. " " .. feature.Name .. " ✓"
                else
                    FeatureButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
                    FeatureButton.Text = feature.Icon .. " " .. feature.Name
                end
            end)
        end
    end
    
    if navItem.Name == "公告" then
        local Announcement = Instance.new("TextLabel")
        Announcement.Name = "Announcement"
        Announcement.Parent = Page
        Announcement.BackgroundTransparency = 1
        Announcement.Size = UDim2.new(1, 0, 1, 0)
        Announcement.Font = Enum.Font.Gotham
        Announcement.Text = "死铁轨脚本 v2.0\n手机横版优化\n支持触摸操作"
        Announcement.TextColor3 = Color3.fromRGB(220, 220, 220)
        Announcement.TextSize = 14
        Announcement.TextWrapped = true
    end
end

-- 导航切换功能
for _, navButton in ipairs(NavButtons) do
    navButton.Button.MouseButton1Click:Connect(function()
        ActiveNav = navButton.Data.Name
        
        -- 更新导航按钮状态
        for _, otherNav in ipairs(NavButtons) do
            if otherNav.Data.Name == ActiveNav then
                otherNav.Button.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
            else
                otherNav.Button.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            end
        end
        
        -- 显示对应的内容页面
        for pageName, page in pairs(ContentPages) do
            page.Visible = pageName == ActiveNav
        end
    end)
end

-- 窗口拖动功能
local dragging = false
local dragStart = nil
local startPos = nil
local isMinimized = false

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainContainer.Position
    end
end)

TitleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.Touch then
        local delta = input.Position - dragStart
        MainContainer.Position = UDim2.new(
            