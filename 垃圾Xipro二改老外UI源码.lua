-- 死铁轨脚本UI框架 - 完整版
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
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 主容器
local MainContainer = Instance.new("Frame")
MainContainer.Name = "MainContainer"
MainContainer.Parent = ScreenGui
MainContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainContainer.BorderSizePixel = 0
MainContainer.Position = UDim2.new(0.5, -200, 0.5, -150)
MainContainer.Size = UDim2.new(0, 400, 0, 300)
MainContainer.AnchorPoint = Vector2.new(0.5, 0.5)

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainContainer

-- 左侧导航栏
local NavPanel = Instance.new("Frame")
NavPanel.Name = "NavPanel"
NavPanel.Parent = MainContainer
NavPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
NavPanel.BorderSizePixel = 0
NavPanel.Size = UDim2.new(0, 120, 1, 0)

-- Logo区域
local Logo = Instance.new("TextLabel")
Logo.Name = "Logo"
Logo.Parent = NavPanel
Logo.BackgroundTransparency = 1
Logo.Position = UDim2.new(0, 10, 0, 10)
Logo.Size = UDim2.new(1, -20, 0, 40)
Logo.Font = Enum.Font.GothamBold
Logo.Text = "死铁轨"
Logo.TextColor3 = Color3.fromRGB(255, 80, 80)
Logo.TextSize = 18

-- 导航项数据
local NavItems = {
    {Name = "首页", Icon = "🏠"},
    {Name = "战斗", Icon = "⚔️"},
    {Name = "移动", Icon = "🚀"},
    {Name = "视觉", Icon = "👁️"},
    {Name = "公告", Icon = "📢"}
}

local NavButtons = {}
local ActiveNav = "首页"

-- 创建导航项
for i, item in ipairs(NavItems) do
    local NavItem = Instance.new("TextButton")
    NavItem.Name = item.Name
    NavItem.Parent = NavPanel
    NavItem.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    NavItem.BorderSizePixel = 0
    NavItem.Position = UDim2.new(0, 10, 0, 60 + (i-1)*50)
    NavItem.Size = UDim2.new(1, -20, 0, 40)
    NavItem.Font = Enum.Font.Gotham
    NavItem.Text = item.Icon
    NavItem.TextColor3 = Color3.fromRGB(220, 220, 220)
    NavItem.TextSize = 16
    
    local ItemCorner = Instance.new("UICorner")
    ItemCorner.CornerRadius = UDim.new(0, 6)
    ItemCorner.Parent = NavItem
    
    -- 默认选中第一个
    if i == 1 then
        NavItem.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
    end
    
    table.insert(NavButtons, {Button = NavItem, Data = item})
end

-- 内容区域
local ContentPanel = Instance.new("Frame")
ContentPanel.Name = "ContentPanel"
ContentPanel.Parent = MainContainer
ContentPanel.BackgroundTransparency = 1
ContentPanel.Position = UDim2.new(0, 120, 0, 0)
ContentPanel.Size = UDim2.new(1, -120, 1, 0)

-- 功能卡片数据
local FeatureData = {
    ["首页"] = {
        {Name = "自动刷怪", Icon = "⚔️", Desc = "自动攻击怪物", Status = false},
        {Name = "速度提升", Icon = "⚡", Desc = "提升移动速度", Status = false},
        {Name = "透视显示", Icon = "👁️", Desc = "显示目标位置", Status = false}
    },
    ["战斗"] = {
        {Name = "自动瞄准", Icon = "🎯", Desc = "锁定敌人头部", Status = false},
        {Name = "上帝模式", Icon = "🛡️", Desc = "免疫所有伤害", Status = false},
        {Name = "一击必杀", Icon = "💥", Desc = "秒杀敌人", Status = false}
    },
    ["移动"] = {
        {Name = "飞行模式", Icon = "🕊️", Desc = "自由飞行", Status = false},
        {Name = "穿墙移动", Icon = "🧱", Desc = "穿过墙壁", Status = false},
        {Name = "无限跳跃", Icon = "🦘", Desc = "无限跳跃", Status = false}
    }
}

-- 创建内容页面
local ContentPages = {}

for _, navItem in ipairs(NavItems) do
    local Page = Instance.new("Frame")
    Page.Name = navItem.Name
    Page.Parent = ContentPanel
    Page.BackgroundTransparency = 1
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.Position = UDim2.new(0, 0, 0, 0)
    Page.Visible = navItem.Name == "首页"
    
    ContentPages[navItem.Name] = Page
    
    -- 如果是功能页面，添加功能卡片
    if FeatureData[navItem.Name] then
        for i, feature in ipairs(FeatureData[navItem.Name]) do
            local FeatureCard = Instance.new("TextButton")
            FeatureCard.Name = feature.Name
            FeatureCard.Parent = Page
            FeatureCard.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            FeatureCard.BorderSizePixel = 0
            FeatureCard.Position = UDim2.new(0, 10, 0, 10 + (i-1)*70)
            FeatureCard.Size = UDim2.new(1, -20, 0, 60)
            FeatureCard.Font = Enum.Font.Gotham
            FeatureCard.Text = feature.Icon .. " " .. feature.Name
            FeatureCard.TextColor3 = Color3.fromRGB(220, 220, 220)
            FeatureCard.TextSize = 14
            
            local CardCorner = Instance.new("UICorner")
            CardCorner.CornerRadius = UDim.new(0, 8)
            CardCorner.Parent = FeatureCard
            
            -- 点击切换功能
            FeatureCard.MouseButton1Click:Connect(function()
                feature.Status = not feature.Status
                
                if feature.Status then
                    FeatureCard.BackgroundColor3 = Color3.fromRGB(80, 255, 80)
                    FeatureCard.Text = feature.Icon .. " " .. feature.Name .. " ✓"
                else
                    FeatureCard.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
                    FeatureCard.Text = feature.Icon .. " " .. feature.Name
                end
            end)
        end
    end
    
    -- 如果是公告页面
    if navItem.Name == "公告" then
        local Announcement = Instance.new("TextLabel")
        Announcement.Name = "Announcement"
        Announcement.Parent = Page
        Announcement.BackgroundTransparency = 1
        Announcement.Position = UDim2.new(0, 10, 0, 10)
        Announcement.Size = UDim2.new(1, -20, 1, -20)
        Announcement.Font = Enum.Font.Gotham
        Announcement.Text = "死铁轨脚本 v2.0\n\n• 新增自动刷怪功能\n• 优化性能表现\n• 修复已知问题"
        Announcement.TextColor3 = Color3.fromRGB(220, 220, 220)
        Announcement.TextSize = 14
        Announcement.TextWrapped = true
        Announcement.TextXAlignment = Enum.TextXAlignment.Left
        Announcement.TextYAlignment = Enum.TextYAlignment.Top
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
                otherNav.Button.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
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

MainContainer.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainContainer.Position
    end
end)

MainContainer.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainContainer.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- 初始动画
MainContainer.Size = UDim2.new(0, 0, 0, 300)
TweenService:Create(MainContainer, TweenInfo.new(0.5), {
    Size = UDim2.new(0, 400, 0, 300)
}):Play()

print("死铁轨脚本UI加载完成！")
