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
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
Main.BackgroundTransparency = 0.1
Main.BorderSizePixel = 0
Main.Size = UDim2.new(0, 200, 0, 120)
Main.Position = UDim2.new(0.5, -100, 0.5, -60)
Main.AnchorPoint = Vector2.new(0.5, 0.5)

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = Main

-- 标题栏
local Title = Instance.new("Frame")
Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
Title.BackgroundTransparency = 0.1
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
TitleText.TextSize = 14

-- 关闭按钮
local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Parent = Title
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
CloseBtn.BorderSizePixel = 0
CloseBtn.Position = UDim2.new(1, -25, 0.5, -8)
CloseBtn.Size = UDim2.new(0, 20, 0, 16)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 12

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

-- 铲子快速攻击功能按钮
local ShovelBtn = Instance.new("TextButton")
ShovelBtn.Name = "ShovelBtn"
ShovelBtn.Parent = Main
ShovelBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
ShovelBtn.BackgroundTransparency = 0.1
ShovelBtn.BorderSizePixel = 0
ShovelBtn.Position = UDim2.new(0.5, -80, 0, 40)
ShovelBtn.Size = UDim2.new(0, 160, 0, 50)
ShovelBtn.Font = Enum.Font.GothamBold
ShovelBtn.Text = "🔨 铲子快速攻击\n关闭"
ShovelBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
ShovelBtn.TextSize = 14
ShovelBtn.TextWrapped = true

local ShovelCorner = Instance.new("UICorner")
ShovelCorner.CornerRadius = UDim.new(0, 10)
ShovelCorner.Parent = ShovelBtn

-- 铲子快速攻击功能
getgenv().shovelFarm = false

-- 第一个循环：蓄力攻击
local function chargeAttack()
    while getgenv().shovelFarm do
        task.wait()
        local args = {
            [1] = game:GetService("Players").LocalPlayer.Character.Shovel,
            [2] = 1767223075.838953
        }
        game:GetService("ReplicatedStorage").Shared.Network.RemoteEvent.ChargeMelee:FireServer(unpack(args))
    end
end

-- 第二个循环：挥舞攻击
local function swingAttack()
    while getgenv().shovelFarm do
        task.wait()
        local args = {
            [1] = game:GetService("Players").LocalPlayer.Character.Shovel,
            [2] = 1767223076.988726,
            [3] = Vector3.new(0.4559113681316376, -0.2772691547870636, 0.8457344770431519)
        }
        game:GetService("ReplicatedStorage").Shared.Network.RemoteEvent.SwingMelee:FireServer(unpack(args))
    end
end

-- 铲子按钮点击事件
ShovelBtn.MouseButton1Click:Connect(function()
    getgenv().shovelFarm = not getgenv().shovelFarm
    
    if getgenv().shovelFarm then
        ShovelBtn.BackgroundColor3 = Color3.fromRGB(80, 255, 80)
        ShovelBtn.Text = "🔨 铲子快速攻击\n开启"
        
        -- 启动两个攻击循环
        task.spawn(chargeAttack)
        task.spawn(swingAttack)
        
        print("铲子快速攻击已开启")
    else
        ShovelBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        ShovelBtn.Text = "🔨 铲子快速攻击\n关闭"
        
        print("铲子快速攻击已关闭")
    end
end)

-- 拖动功能
local dragging = false
local dragStart, startPos

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

-- 关闭功能
CloseBtn.MouseButton1Click:Connect(function()
    -- 关闭铲子攻击功能
    getgenv().shovelFarm = false
    ScreenGui:Destroy()
end)

-- 初始动画
Main.Size = UDim2.new(0, 0, 0, 0)
TweenService:Create(Main, TweenInfo.new(0.3), {Size = UDim2.new(0, 200, 0, 120)}):Play()

print("死铁轨脚本 - 铲子快速攻击UI加载完成")
