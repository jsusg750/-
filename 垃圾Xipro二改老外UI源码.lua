-- 死铁轨脚本UI框架 - 第一段
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

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
ScreenGui.ResetOnSpawn = false

-- 主容器
local MainContainer = Instance.new("Frame")
MainContainer.Name = "MainContainer"
MainContainer.Parent = ScreenGui
MainContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainContainer.BackgroundTransparency = 0.05
MainContainer.BorderSizePixel = 0
MainContainer.Position = UDim2.new(0.5, -450, 0.5, -300)
MainContainer.Size = UDim2.new(0, 900, 0, 600)
MainContainer.AnchorPoint = Vector2.new(0.5, 0.5)

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 20)
MainCorner.Parent = MainContainer

-- 阴影效果
local MainShadow = Instance.new("UIStroke")
MainShadow.Thickness = 4
MainShadow.Color = Color3.fromRGB(0, 0, 0)
MainShadow.Transparency = 0.7
MainShadow.Parent = MainContainer

local GlowStroke = Instance.new("UIStroke")
GlowStroke.Thickness = 2
GlowStroke.Color = Color3.fromRGB(255, 80, 80)
GlowStroke.Transparency = 0.3
GlowStroke.Parent = MainContainer

-- 左侧导航栏
local NavPanel = Instance.new("Frame")
NavPanel.Name = "NavPanel"
NavPanel.Parent = MainContainer
NavPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
NavPanel.BorderSizePixel = 0
NavPanel.Position = UDim2.new(0, 0, 0, 0)
NavPanel.Size = UDim2.new(0, 220, 1, 0)

local NavCorner = Instance.new("UICorner")
NavCorner.CornerRadius = UDim.new(0, 20)
NavCorner.Parent = NavPanel

-- Logo区域
local LogoSection = Instance.new("Frame")
LogoSection.Name = "LogoSection"
LogoSection.Parent = NavPanel
LogoSection.BackgroundTransparency = 1
LogoSection.Position = UDim2.new(0, 0, 0, 0)
LogoSection.Size = UDim2.new(1, 0, 0, 80)

local Logo = Instance.new("TextLabel")
Logo.Name = "Logo"
Logo.Parent = LogoSection
Logo.BackgroundTransparency = 1
Logo.Position = UDim2.new(0, 20, 0, 20)
Logo.Size = UDim2.new(1, -40, 0, 40)
Logo.Font = Enum.Font.GothamBold
Logo.Text = "死铁轨脚本"
Logo.TextColor3 = Color3.fromRGB(255, 80, 80)
Logo.TextSize = 24
Logo.TextXAlignment = Enum.TextXAlignment.Left

local LogoIcon = Instance.new("TextLabel")
LogoIcon.Name = "LogoIcon"
LogoIcon.Parent = Logo
LogoIcon.BackgroundTransparency = 1
LogoIcon.Position = UDim2.new(-0.3, 0, 0, 0)
LogoIcon.Size = UDim2.new(0, 40, 1, 0)
LogoIcon.Font = Enum.Font.GothamBold
LogoIcon.Text = "⚙️"
LogoIcon.TextColor3 = Color3.fromRGB(255, 80, 80)
LogoIcon.TextSize = 24
LogoIcon.TextXAlignment = Enum.TextXAlignment.Left

local Subtitle = Instance.new("TextLabel")
Subtitle.Name = "Subtitle"
Subtitle.Parent = LogoSection
Subtitle.BackgroundTransparency = 1
Subtitle.Position = UDim2.new(0, 20, 0, 50)
Subtitle.Size = UDim2.new(1, -40, 0, 20)
Subtitle.Font = Enum.Font.Gotham
Subtitle.Text = "v2.1.5 - 专业版"
Subtitle.TextColor3 = Color3.fromRGB(170, 170, 170)
Subtitle.TextSize = 12
Subtitle.TextXAlignment = Enum.TextXAlignment.Left

-- 导航列表
local NavList = Instance.new("ScrollingFrame")
NavList.Name = "NavList"
NavList.Parent = NavPanel
NavList.BackgroundTransparency = 1
NavList.Position = UDim2.new(0, 0, 0, 80)
NavList.Size = UDim2.new(1, 0, 1, -80)
NavList.ScrollBarThickness = 4
NavList.ScrollBarImageColor3 = Color3.fromRGB(255, 80, 80)
NavList.CanvasSize = UDim2.new(0, 0, 0, 400)

local NavLayout = Instance.new("UIListLayout")
NavLayout.Parent = NavList
NavLayout.Padding = UDim.new(0, 2)
NavLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- 导航项数据
local NavItems = {
    {Name = "首页概览", Icon = "🏠", Color = Color3.fromRGB(255, 80, 80)},
    {Name = "战斗功能", Icon = "⚔️", Color = Color3.fromRGB(255, 120, 80)},
    {Name = "移动增强", Icon = "🚀", Color = Color3.fromRGB(80, 200, 255)},
    {Name = "视觉特效", Icon = "👁️", Color = Color3.fromRGB(180, 80, 255)},
    {Name = "自动功能", Icon = "🤖", Color = Color3.fromRGB(80, 255, 150)},
    {Name = "脚本设置", Icon = "⚙️", Color = Color3.fromRGB(255, 200, 80)},
    {Name = "更新公告", Icon = "📢", Color = Color3.fromRGB(255, 80, 180)}
}

local NavButtons = {}
local ActiveNav = "首页概览"

-- 创建导航项
for i, item in ipairs(NavItems) do
    local NavItem = Instance.new("TextButton")
    NavItem.Name = item.Name
    NavItem.Parent = NavList
    NavItem.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    NavItem.BorderSizePixel = 0
    NavItem.Size = UDim2.new(1, -20, 0, 50)
    NavItem.Position = UDim2.new(0, 10, 0, (i-1)*52)
    NavItem.Font = Enum.Font.Gotham
    NavItem.Text = ""
    NavItem.TextColor3 = Color3.fromRGB(220, 220, 220)
    NavItem.TextSize = 16
    NavItem.AutoButtonColor = false
    
    local ItemCorner = Instance.new("UICorner")
    ItemCorner.CornerRadius = UDim.new(0, 8)
    ItemCorner.Parent = NavItem
    
    local ItemIcon = Instance.new("TextLabel")
    ItemIcon.Name = "Icon"
    ItemIcon.Parent = NavItem
    ItemIcon.BackgroundTransparency = 1
    ItemIcon.Position = UDim2.new(0, 15, 0, 0)
    ItemIcon.Size = UDim2.new(0, 30, 1, 0)
    ItemIcon.Font = Enum.Font.GothamBold
    ItemIcon.Text = item.Icon
    ItemIcon.TextColor3 = item.Color
    ItemIcon.TextSize = 20
    
    local ItemText = Instance.new("TextLabel")
    ItemText.Name = "Text"
    ItemText.Parent = NavItem
    ItemText.BackgroundTransparency = 1
    ItemText.Position = UDim2.new(0, 50, 0, 0)
    ItemText.Size = UDim2.new(1, -50, 1, 0)
    ItemText.Font = Enum.Font.GothamMedium
    ItemText.Text = item.Name
    ItemText.TextColor3 = Color3.fromRGB(220, 220, 220)
    ItemText.TextSize = 16
    ItemText.TextXAlignment = Enum.TextXAlignment.Left
    
    local Indicator = Instance.new("Frame")
    Indicator.Name = "Indicator"
    Indicator.Parent = NavItem
    Indicator.BackgroundColor3 = item.Color
    Indicator.BorderSizePixel = 0
    Indicator.Size = UDim2.new(0, 4, 0.6, 0)
    Indicator.Position = UDim2.new(0, 0, 0.2, 0)
    Indicator.Visible = false
    
    local IndicatorCorner = Instance.new("UICorner")
    IndicatorCorner.CornerRadius = UDim.new(0, 2)
    IndicatorCorner.Parent = Indicator
    
    -- 默认选中第一个
    if i == 1 then
        NavItem.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
        Indicator.Visible = true
    end
    
    table.insert(NavButtons, {Button = NavItem, Data = item})
end

-- 内容区域
local ContentPanel = Instance.new("Frame")
ContentPanel.Name = "ContentPanel"
ContentPanel.Parent = MainContainer
ContentPanel.BackgroundTransparency = 1
ContentPanel.Position = UDim2.new(0, 220, 0, 0)
ContentPanel.Size = UDim2.new(1, -220, 1, 0)

-- 内容容器
local ContentContainer = Instance.new("Frame")
ContentContainer.Name = "ContentContainer"
ContentContainer.Parent = ContentPanel
ContentContainer.BackgroundTransparency = 1
ContentContainer.Size = UDim2.new(1, 0, 1, 0)
ContentContainer.ClipsDescendants = true

-- 第一段结束，请复制第二段
-- 死铁轨脚本UI框架 - 第二段
-- 功能卡片数据
local FeatureData = {
    ["首页概览"] = {
        {Name = "自动刷怪", Icon = "⚔️", Desc = "自动寻找并攻击附近的怪物", Status = false},
        {Name = "速度提升", Icon = "⚡", Desc = "大幅提升角色移动速度", Status = false},
        {Name = "透视显示", Icon = "👁️", Desc = "显示玩家、物品和资源位置", Status = false},
        {Name = "自动收集", Icon = "💰", Desc = "自动拾取附近的物品和资源", Status = false},
        {Name = "一键传送", Icon = "🚪", Desc = "快速传送到指定位置", Status = false},
        {Name = "无限跳跃", Icon = "🦘", Desc = "取消跳跃次数限制", Status = false}
    },
    ["战斗功能"] = {
        {Name = "自动瞄准", Icon = "🎯", Desc = "自动锁定敌人头部", Status = false},
        {Name = "无后坐力", Icon = "🔫", Desc = "消除武器后坐力", Status = false},
        {Name = "上帝模式", Icon = "🛡️", Desc = "免疫所有伤害", Status = false},
        {Name = "一击必杀", Icon = "💥", Desc = "所有攻击造成致命伤害", Status = false},
        {Name = "无限弹药", Icon = "🔋", Desc = "无需装弹，持续射击", Status = false},
        {Name = "穿墙攻击", Icon = "🧱", Desc = "攻击可穿透墙壁", Status = false}
    },
    ["移动增强"] = {
        {Name = "飞行模式", Icon = "🕊️", Desc = "自由飞行移动", Status = false},
        {Name = "水上行走", Icon = "🌊", Desc = "可以在水面行走", Status = false},
        {Name = "穿墙移动", Icon = "🚶‍♂️", Desc = "可以穿过墙壁移动", Status = false},
        {Name = "无限体力", Icon = "💪", Desc = "无限跑步和游泳体力", Status = false},
        {Name = "爬墙功能", Icon = "🧗", Desc = "可以在墙壁上攀爬", Status = false},
        {Name = "瞬移功能", Icon = "🌀", Desc = "瞬间传送到目标位置", Status = false}
    },
    ["视觉特效"] = {
        {Name = "夜视模式", Icon = "🌙", Desc = "在黑暗中清晰视物", Status = false},
        {Name = "全屏高亮", Icon = "💡", Desc = "增强画面亮度和对比度", Status = false},
        {Name = "轮廓显示", Icon = "🔲", Desc = "显示物体轮廓边框", Status = false},
        {Name = "去雾效果", Icon = "🌫️", Desc = "移除场景中的雾气", Status = false},
        {Name = "色彩增强", Icon = "🌈", Desc = "增强游戏画面色彩", Status = false},
        {Name = "景深效果", Icon = "📸", Desc = "添加景深模糊效果", Status = false}
    }
}

-- 创建内容页面
local ContentPages = {}

for _, navItem in ipairs(NavItems) do
    local Page = Instance.new("ScrollingFrame")
    Page.Name = navItem.Name
    Page.Parent = ContentContainer
    Page.BackgroundTransparency = 1
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.Position = UDim2.new(0, 0, 0, 0)
    Page.ScrollBarThickness = 6
    Page.ScrollBarImageColor3 = Color3.fromRGB(255, 80, 80)
    Page.CanvasSize = UDim2.new(0, 0, 0, 500)
    Page.Visible = navItem.Name == "首页概览"
    
    local PageLayout = Instance.new("UIGridLayout")
    PageLayout.Parent = Page
    PageLayout.CellPadding = UDim2.new(0, 15, 0, 15)
    PageLayout.CellSize = UDim2.new(0.5, -20, 0, 120)
    PageLayout.StartCorner = Enum.StartCorner.TopLeft
    PageLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    local PagePadding = Instance.new("UIPadding")
    PagePadding.Parent = Page
    PagePadding.PaddingLeft = UDim.new(0, 20)
    PagePadding.PaddingRight = UDim.new(0, 20)
    PagePadding.PaddingTop = UDim.new(0, 20)
    PagePadding.PaddingBottom = UDim.new(0, 20)
    
    ContentPages[navItem.Name] = Page
    
    -- 如果是功能页面，添加功能卡片
    if FeatureData[navItem.Name] then
        for _, feature in ipairs(FeatureData[navItem.Name]) do
            local FeatureCard = Instance.new("TextButton")
            FeatureCard.Name = feature.Name
            FeatureCard.Parent = Page
            FeatureCard.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            FeatureCard.BorderSizePixel = 0
            FeatureCard.Size = UDim2.new(1, 0, 0, 120)
            FeatureCard.Font = Enum.Font.Gotham
            FeatureCard.Text = ""
            FeatureCard.TextColor3 = Color3.fromRGB(220, 220, 220)
            FeatureCard.TextSize = 16
            FeatureCard.AutoButtonColor = false
            
            local CardCorner = Instance.new("UICorner")
            CardCorner.CornerRadius = UDim.new(0, 12)
            CardCorner.Parent = FeatureCard
            
            local CardStroke = Instance.new("UIStroke")
            CardStroke.Thickness = 2
            CardStroke.Color = Color3.fromRGB(60, 60, 70)
            CardStroke.Parent = FeatureCard
            
            local FeatureIcon = Instance.new("TextLabel")
            FeatureIcon.Name = "Icon"
            FeatureIcon.Parent = FeatureCard
            FeatureIcon.BackgroundTransparency = 1
            FeatureIcon.Position = UDim2.new(0, 15, 0, 15)
            FeatureIcon.Size = UDim2.new(0, 30, 0, 30)
            FeatureIcon.Font = Enum.Font.GothamBold
            FeatureIcon.Text = feature.Icon
            FeatureIcon.TextColor3 = Color3.fromRGB(255, 80, 80)
            FeatureIcon.TextSize = 20
            
            local FeatureName = Instance.new("TextLabel")
            FeatureName.Name = "Name"
            FeatureName.Parent = FeatureCard
            FeatureName.BackgroundTransparency = 1
            FeatureName.Position = UDim2.new(0, 60, 0, 15)
            FeatureName.Size = UDim2.new(1, -60, 0, 30)
            FeatureName.Font = Enum.Font.GothamBold
            FeatureName.Text = feature.Name
            FeatureName.TextColor3 = Color3.fromRGB(240, 240, 240)
            FeatureName.TextSize = 18
            FeatureName.TextXAlignment = Enum.TextXAlignment.Left
            
            local FeatureDesc = Instance.new("TextLabel")
            FeatureDesc.Name = "Desc"
            FeatureDesc.Parent = FeatureCard
            FeatureDesc.BackgroundTransparency = 1
            FeatureDesc.Position = UDim2.new(0, 15, 0, 55)
            FeatureDesc.Size = UDim2.new(1, -30, 0, 35)
            FeatureDesc.Font = Enum.Font.Gotham
            FeatureDesc.Text = feature.Desc
            FeatureDesc.TextColor3 = Color3.fromRGB(180, 180, 180)
            FeatureDesc.TextSize = 13
            FeatureDesc.TextWrapped = true
            FeatureDesc.TextXAlignment = Enum.TextXAlignment.Left
            FeatureDesc.TextYAlignment = Enum.TextYAlignment.Top
            
            local ToggleContainer = Instance.new("Frame")
            ToggleContainer.Name = "Toggle"
            ToggleContainer.Parent = FeatureCard
            ToggleContainer.BackgroundTransparency = 1
            ToggleContainer.Position = UDim2.new(1, -70, 1, -30)
            ToggleContainer.Size = UDim2.new(0, 55, 0, 20)
            
            local StatusText = Instance.new("TextLabel")
            StatusText.Name = "StatusText"
            StatusText.Parent = ToggleContainer
            StatusText.BackgroundTransparency = 1
            StatusText.Size = UDim2.new(0, 40, 1, 0)
            StatusText.Font = Enum.Font.Gotham
            StatusText.Text = "关闭"
            StatusText.TextColor3 = Color3.fromRGB(255, 100, 100)
            StatusText.TextSize = 12
            
            local ToggleButton = Instance.new("Frame")
            ToggleButton.Name = "Button"
            ToggleButton.Parent = ToggleContainer
            ToggleButton.BackgroundColor3 = Color3.fromRGB(100, 100, 120)
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Position = UDim2.new(0, 45, 0, 0)
            ToggleButton.Size = UDim2.new(0, 35, 1, 0)
            
            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.CornerRadius = UDim.new(1, 0)
            ToggleCorner.Parent = ToggleButton
            
            local ToggleKnob = Instance.new("Frame")
            ToggleKnob.Name = "Knob"
            ToggleKnob.Parent = ToggleButton
            ToggleKnob.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
            ToggleKnob.BorderSizePixel = 0
            ToggleKnob.Position = UDim2.new(0, 2, 0, 2)
            ToggleKnob.Size = UDim2.new(0, 16, 0, 16)
            
            local KnobCorner = Instance.new("UICorner")
            KnobCorner.CornerRadius = UDim.new(1, 0)
            KnobCorner.Parent = ToggleKnob
            
            -- 悬停效果
            FeatureCard.MouseEnter:Connect(function()
                TweenService:Create(CardStroke, TweenInfo.new(0.2), {
                    Color = Color3.fromRGB(255, 80, 80)
                }):Play()
                TweenService:Create(FeatureCard, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(45, 45, 55)
                }):Play()
            end)
            
            FeatureCard.MouseLeave:Connect(function()
                TweenService:Create(CardStroke, TweenInfo.new(0.2), {
                    Color = Color3.fromRGB(60, 60, 70)
                }):Play()
                TweenService:Create(FeatureCard, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(40, 40, 50)
                }):Play()
            end)
            
            -- 点击切换功能
            FeatureCard.MouseButton1Click:Connect(function()
                feature.Status = not feature.Status
                
                if feature.Status then
                    StatusText.Text = "开启"
                    StatusText.TextColor3 = Color3.fromRGB(100, 255, 100)
                    TweenService:Create(ToggleButton, TweenInfo.new(0.2), {
                        BackgroundColor3 = Color3.fromRGB(100, 255, 100)
                    }):Play()
                    TweenService:Create(ToggleKnob, TweenInfo.new(0.2), {
                        Position = UDim2.new(1, -18, 0, 2)
                    }):Play()
                else
                    StatusText.Text = "关闭"
                    StatusText.TextColor3 = Color3.fromRGB(255, 100, 100)
                    TweenService:Create(ToggleButton, TweenInfo.new(0.2), {
                        BackgroundColor3 = Color3.fromRGB(100, 100, 120)
                    }):Play()
                    TweenService:Create(ToggleKnob, TweenInfo.new(0.2), {
                        Position = UDim2.new(0, 2, 0, 2)
                    }):Play()
                end
            end)
        end
    end
    
    -- 如果是公告页面
    if navItem.Name == "更新公告" then
        local Announcements = {
            {Date = "2024-12-20", Content = "发布死铁轨脚本 v2.1.5 版本，新增自动刷怪功能"},
 -- 死铁轨脚本UI框架 - 第三段
-- 导航切换功能
for _, navButton in ipairs(NavButtons) do
    navButton.Button.MouseButton1Click:Connect(function()
        ActiveNav = navButton.Data.Name
        
        -- 更新导航按钮状态
        for _, otherNav in ipairs(NavButtons) do
            local button = otherNav.Button
            local indicator = button:FindFirstChild("Indicator")
            
            if otherNav.Data.Name == ActiveNav then
                TweenService:Create(button, TweenInfo.new(0.3), {
                    BackgroundColor3 = Color3.fromRGB(45, 45, 55)
                }):Play()
                indicator.Visible = true
            else
                TweenService:Create(button, TweenInfo.new(0.3), {
                    BackgroundColor3 = Color3.fromRGB(35, 35, 45)
                }):Play()
                indicator.Visible = false
            end
        end
        
        -- 显示对应的内容页面
        for pageName, page in pairs(ContentPages) do
            if pageName == ActiveNav then
                page.Visible = true
                Tween
