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
            Name = "🔥 终极火刺猬脚本",
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

local Tab1 = Window:CreateTab("主功能", 7734068321)
local Tab2 = Window:CreateTab("通用功能", 7734068321)
local Tab3 = Window:CreateTab("玩家设置", 4483345998)
local Tab4 = Window:CreateTab("巴掌大战", 7734068321)
local Tab5 = Window:CreateTab("森林99夜", 7734068321)
local Tab6 = Window:CreateTab("rake", 7734068321)
local Tab7 = Window:CreateTab("被遗弃", 7734068321)
local Tab8 = Window:CreateTab("造船寻宝", 7734068321)
local Tab9 = Window:CreateTab("chain", 7734068321)
local Tab10 = Window:CreateTab("sol'RNG", 7734068321)
local Tab11 = Window:CreateTab("忍者传奇", 6026568198)
local Tab12 = Window:CreateTab("偷走脑红", 7734068321)
local Tab13 = Window:CreateTab("墨水游戏", 7734068321)
local Tab14 = Window:CreateTab("死铁轨", 7734068321)
local Tab15 = Window:CreateTab("监狱人生", 7734068321)
local Tab16 = Window:CreateTab("bf", 7734068321)
local Tab17 = Window:CreateTab("力量传奇", 7734068321)
local Tab18 = Window:CreateTab("伐木脚本", 7734068321)
local Tab19 = Window:CreateTab("脚本中心", 6023426915)
local Tab20 = Window:CreateTab("Doors", 6026568198)

Tab1:CreateLabel("作者: 火刺猬")
Tab1:CreateLabel("作者QQ: 3982716135")
Tab1:CreateLabel("QQ群: 1018112611")

Tab2:CreateButton({
    Name = "HUA光影",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/arzRCgwS"))()
    end
})

Tab2:CreateButton({
    Name = "光影_2",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
    end
})

Tab2:CreateButton({
    Name = "超高画质",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
    end
})

Tab2:CreateButton({
    Name = "撸管r6",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
    end
})

Tab2:CreateButton({
    Name = "撸管r15",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
    end
})

Tab2:CreateButton({
    Name = "旋转",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0'))()
    end
})

Tab2:CreateToggle({
    Name = "夜视",
    CurrentValue = false,
    Callback = function(Value)
        game.Lighting.Ambient = Value and Color3.new(1,1,1) or Color3.new(0,0,0)
    end
})

Tab2:CreateButton({
    Name = "飞车",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()
    end
})

Tab2:CreateButton({
    Name = "爬墙",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
    end
})

Tab2:CreateButton({
    Name = "动作",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/Zj4NnKs6"))()
    end
})

Tab2:CreateButton({
    Name = "电脑键盘",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt"))()
    end
})

Tab2:CreateButton({
    Name = "踏空行走",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
    end
})

Tab2:CreateInput({
    Name = "重力设置",
    PlaceholderText = "输入重力值",
    RemoveTextAfterFocusLost = false,
    Callback = function(Value)
        game.Workspace.Gravity = Value
    end
})

Tab3:CreateButton({
    Name = "无限跳",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0"))()
    end
})

Tab3:CreateInput({
    Name = "移动速度",
    PlaceholderText = "输入移动速度",
    RemoveTextAfterFocusLost = false,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

Tab3:CreateInput({
    Name = "跳跃高度",
    PlaceholderText = "输入跳跃高度",
    RemoveTextAfterFocusLost = false,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end
})

Tab3:CreateButton({
    Name = "穿墙",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/jvyN5hT8"))()
    end
})

Tab3:CreateButton({
    Name = "飞行",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Gui-Fly-v3-37111"))()
    end
})

Tab4:CreateButton({
    Name = "解锁全手套",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/SlapBattles"))()
    end
})

Tab4:CreateButton({
    Name = "哨声fe",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Umbrella-Scripter/Slap-Battles/refs/heads/main/F.L.O.W.E.R.lua'))()
    end
})

Tab4:CreateButton({
    Name = "目前最强",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Guy-that-exists/Hub-that-exists/main/Script"))()
    end
})

Tab4:CreateButton({
    Name = "免费收音机fe",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Donjosx/AWS/refs/heads/main/Protected_5792205824061745.txt"))()
    end
})

Tab4:CreateButton({
    Name = "冰霜领主",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/LYJzX6un/raw"))();
    end
})

Tab5:CreateButton({
    Name = "H4x",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/H4xScripts/Loader/main/loader.lua"))()
    end
})

Tab6:CreateButton({
    Name = "sapienV1",
    Callback = function()
        loadstring(game:HttpGet("https://sapien-w76a.onrender.com/start"))()
    end
})

Tab6:CreateButton({
    Name = "Wayfer",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Wayfer0/Roblox-Scripts/refs/heads/main/Wayfer%20Hub"))()
    end
})

Tab7:CreateButton({
    Name = "Httadmin",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OWOWOWWOW/HTT/main/HT.lua"))()
    end
})

Tab8:CreateButton({
    Name = "自动建造",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/catblox1346/StensUIReMake/main/Script/boatbuilderhub_B1"))()
    end
})

Tab9:CreateButton({
    Name = "chain脚本1",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/6Zdt8y6z'))()
    end
})

Tab10:CreateButton({
    Name = "sol'RNG",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Just3itx/Backup/main/loader.lua"))()
    end
})

Tab11:CreateButton({
    Name = "忍者传奇",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZhenX201/Ninja_Legends/main/source"))()
    end
})

Tab12:CreateButton({
    Name = "偷走脑红",
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/UCT-hub/5b11d10386f1b8ce08feb803861e0b79/raw/b2917b398d4b0cc80fb2aca73a3137ba494ebcf0/gistfile1.txt"))()
    end
})

Tab13:CreateButton({
    Name = "墨水游戏",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/inkgames.github.io/main/ringta.lua"))()
    end
})

Tab13:CreateButton({
    Name = "上面的汉化版",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hdjsjjdgrhj/script-hub/refs/heads/main/Ringta"))()
    end
})

Tab14:CreateButton({
    Name = "红叶子",
    Callback = function()
        loadstring(game:HttpGet("https://getnative.cc/script/loader"))()
    end
})

Tab15:CreateButton({
    Name = "监狱人生",
    Callback = function()
        loadstring(game:HttpGet("https://paste.website/p/51397c68-b6d0-410d-ae9f-22d5ea5734df.txt"))()
    end
})

Tab16:CreateButton({
    Name = "bf脚本1",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/KindIhave/ChibaHuB/main/Chiba-BF.txt'))()
    end
})

Tab17:CreateButton({
    Name = "力量传奇1",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/jynzl/main/main/Musclas%20Legenos.lua'))()
    end
})

Tab17:CreateButton({
    Name = "docaV1",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DocaV1/Get-Huge-Simulator/refs/heads/main/V1.0.1"))()
    end
})

Tab18:CreateButton({
    Name = "伐木脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/Kavo-Ui/main/%E4%BC%90%E6%9C%A8%E5%A4%A7%E4%BA%A82.lua"))()
    end
})

Tab19:CreateButton({
    Name = "剑客V3",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/jiankeQWQ/jiankeV3/main/jianke_V3'))()
    end
})

Tab19:CreateButton({
    Name = "导管中心",
    Callback = function()
        loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\117\115\101\114\97\110\101\119\114\102\102\47\114\111\98\108\111\120\45\47\109\97\105\110\47\37\69\54\37\57\68\37\65\49\37\69\54\37\65\67\37\66\69\37\69\53\37\56\68\37\56\70\37\69\56\37\65\69\37\65\69\34\41\41\40\41\10")()
    end
})

Tab19:CreateButton({
    Name = "霖溺(检测服务器)",
    Callback = function()
        LnScript = "霖溺-免费版加载器"
loadstring(game:HttpGet("https://raw.githubusercontent.com/ShenJiaoBen/ScriptLoader/refs/heads/main/Linni_FreeLoader.lua"))()
    end
})

Tab19:CreateButton({
    Name = "落叶中心",
    Callback = function()
        getgenv().LS="落叶中心"loadstring(game:HttpGet("https://raw.githubusercontent.com/krlpl/Deciduous-center-LS/main/%E8%90%BD%E5%8F%B6%E4%B8%AD%E5%BF%83%E6%B7%B7%E6%B7%86.txt"))()
    end
})

Tab19:CreateButton({
    Name = "阿尔宙斯X",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))()
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
