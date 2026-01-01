repeat task.wait() until game:IsLoaded()

local Rayfield
local sources = {
    "https://raw.githubusercontent.com/shlexware/Rayfield/main/source",
    "https://sirius.menu/rayfield", 
    "https://cdn.jsdelivr.net/gh/shlexware/Rayfield@main/source",
    "https://pastebin.com/raw/5FPAP5T5"
}

for i = 1, 4 do
    local success = pcall(function()
        Rayfield = loadstring(game:HttpGet(sources[i]))()
    end)
    if success then break end
    if i == 4 then
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "错误",
            Text = "UI库加载失败",
            Duration = 10
        })
        return
    end
end

local Window
for i = 1, 5 do
    local success = pcall(function()
        Window = Rayfield:CreateWindow({
            Name = "🔥 脚本中心",
            LoadingTitle = "加载中...",
            LoadingSubtitle = "尝试 "..i.."/5",
            ConfigurationSaving = {Enabled = false},
            Keybind = Enum.KeyCode.RightShift
        })
    end)
    if success then break end
    if i == 5 then
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "错误",
            Text = "窗口创建失败",
            Duration = 10
        })
        return
    end
end

local Tab1 = Window:CreateTab("死铁轨", 7734068321)

Tab1:CreateLabel("作者: 不告诉你们")
Tab1:CreateLabel("作者QQ: 66666666")
Tab1:CreateLabel("QQ群: 6666666666")

Tab1:CreateButton({
    Name = "铲子超攻速攻击",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/COM28/-/refs/heads/main/%E5%9E%83%E5%9C%BEXipro%E4%BA%8C%E6%94%B9%E8%80%81%E5%A4%96UI%E6%BA%90%E7%A0%81.lua"))()
    end
})

Tab1:CreateButton({
    Name = "玩家ESP透视",
    Callback = function()
        -- 动态刷新透视系统
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- 缓存
local PlayerCache = {}
local ESPCache = {}

-- 简约配置
local Config = {
    RefreshRate = 0.5,  -- 刷新频率
    Color = Color3.fromRGB(100, 200, 255),
    OutlineColor = Color3.fromRGB(255, 200, 100)
}

-- 创建简约透视
function createESP(player, character)
    if not character then return end
    
    -- 清理旧ESP
    if ESPCache[player] then
        for _, obj in pairs(ESPCache[player]) do
            obj:Destroy()
        end
    end
    
    ESPCache[player] = {}
    
    -- 创建高亮
    local highlight = Instance.new("Highlight")
    highlight.Name = "DynamicESP_" .. player.Name
    highlight.FillColor = Config.Color
    highlight.FillTransparency = 0.7
    highlight.OutlineColor = Config.OutlineColor
    highlight.OutlineTransparency = 0.1
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Adornee = character
    highlight.Parent = character
    
    -- 创建标签
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Label"
    billboard.Size = UDim2.new(0, 150, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Adornee = character:WaitForChild("Head", 2)
    
    if billboard.Adornee then
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = player.Name
        label.TextColor3 = Config.Color
        label.Font = Enum.Font.Gotham
        label.TextScaled = true
        label.Parent = billboard
        
        billboard.Parent = billboard.Adornee
        table.insert(ESPCache[player], billboard)
    end
    
    table.insert(ESPCache[player], highlight)
    
    return ESPCache[player]
end

-- 清理玩家ESP
function clearPlayerESP(player)
    if ESPCache[player] then
        for _, obj in pairs(ESPCache[player]) do
            pcall(function() obj:Destroy() end)
        end
        ESPCache[player] = nil
    end
end

-- 主更新循环
local function updateESP()
    while true do
        -- 更新所有玩家
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local character = player.Character
                
                if character then
                    -- 检查角色是否存活
                    local humanoid = character:FindFirstChild("Humanoid")
                    local isAlive = humanoid and humanoid.Health > 0
                    
                    if isAlive then
                        if not ESPCache[player] or not ESPCache[player][1] or not ESPCache[player][1].Parent then
                            createESP(player, character)
                        end
                    else
                        clearPlayerESP(player)
                    end
                else
                    clearPlayerESP(player)
                end
            end
        end
        
        -- 清理缓存
        for player in pairs(ESPCache) do
            if not Players:FindFirstChild(player.Name) then
                clearPlayerESP(player)
            end
        end
        
        task.wait(Config.RefreshRate)
    end
end

-- 监听玩家重生
function setupPlayerTracking()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            trackPlayer(player)
        end
    end
    
    -- 监听新玩家
    Players.PlayerAdded:Connect(function(player)
        trackPlayer(player)
    end)
    
    -- 监听玩家离开
    Players.PlayerRemoving:Connect(function(player)
        clearPlayerESP(player)
    end)
end

-- 跟踪玩家
function trackPlayer(player)
    PlayerCache[player] = {
        Character = player.Character
    }
    
    -- 角色添加事件
    player.CharacterAdded:Connect(function(character)
        task.wait(0.5)  -- 等待角色完全加载
        if character then
            createESP(player, character)
        end
    end)
    
    -- 角色移除事件
    player.CharacterRemoving:Connect(function()
        clearPlayerESP(player)
    end)
end

-- 启动
setupPlayerTracking()
task.spawn(updateESP)

print("🔄 动态刷新透视已激活")
print("⏱️ 刷新频率: " .. Config.RefreshRate .. "秒")
    end
})

Window:Show()

task.spawn(function()
    while task.wait(5) do
        if not Window.Enabled then
            Window:Show()
        end
    end
end)

Rayfield:Notify({
    Title = "加载完成",
    Content = "按RightShift键切换菜单",
    Duration = 5
})
