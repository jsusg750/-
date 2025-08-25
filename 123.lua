local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
end)

if not success then
    warn("Rayfield加载失败，尝试备用源...")
    Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local success, Window = pcall(function()
    return Rayfield:CreateWindow({
        Name = "新火刺猬脚本",
        LoadingTitle = "初始化中...",
        LoadingSubtitle = "正在加载功能",
        ConfigurationSaving = { Enabled = false },
        Keybind = Enum.KeyCode.RightShift
    })
end)

if not success then
    error("创建窗口失败: "..tostring(Window))
end

local Tab1 = Window:CreateTab("脚本公告", 7734068321)
local Tab2 = Window:CreateTab("通用功能", 7734068321)
local Tab3 = Window:CreateTab("玩家", 4483345998)
local Tab4 = Window:CreateTab("巴掌大战", 7734068321)
local Tab5 = Window:CreateTab("森林99夜", 7734068321)
local Tab6 = Window:CreateTab("rake", 7734068321)
local Tab7 = Window:CreateTab("被遗弃", 7734068321)
local Tab8 = Window:CreateTab("造船寻宝", 7734068321)
local Tab9 = Window:CreateTab("chain", 7734068321)
local Tab10 = Window:CreateTab("sol'RNG", 7734068321)
local Tab11 = Window:CreateTab("忍者传奇", 7734068321)
local Tab12 = Window:CreateTab("偷走脑红", 7734068321)
local Tab13 = Window:CreateTab("墨水游戏", 7734068321)
local Tab14 = Window:CreateTab("死铁轨", 7734068321)
local Tab15 = Window:CreateTab("监狱人生", 7734068321)
local Tab16 = Window:CreateTab("bf", 7734068321)
local Tab17 = Window:CreateTab("力量传奇", 7734068321)
local Tab18 = Window:CreateTab("伐木脚本", 7734068321)
local Tab19 = Window:CreateTab("脚本中心", 7734068321)

Tab1:CreateLabel("作者: 火刺猬")
Tab1:CreateLabel("作者QQ: 3982716135")
Tab1:CreateLabel("QQ群: 1018112611")

Tab2:CreateButton({
    Name = "HUA 光影",
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
    Name = "旋转",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
    end
})

Tab2:CreateToggle({
    Name = "夜视",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            game.Lighting.Ambient = Color3.new(1, 1, 1)
        else
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
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
        loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
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
    end,
})

Tab3:CreateButton({
    Name = "无限跳",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
    end
})

Tab3:CreateInput({
    Name = "移动速度",
    PlaceholderText = "输入移动速度",
    RemoveTextAfterFocusLost = false,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end,
})

Tab3:CreateInput({
    Name = "跳跃高度",
    PlaceholderText = "输入跳跃高度",
    RemoveTextAfterFocusLost = false,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end,
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
    Name = "1",
    Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Battles")))()
    end
})

Tab4:CreateButton({
    Name = "全勋章手套",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/SlapBattles"))()
    end
})

Tab4:CreateButton({
    Name = "目前我认识最强巴掌脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Guy-that-exists/Hub-that-exists/main/Script"))()
    end
})

Tab4:CreateButton({
    Name = "获取收音机",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Donjosx/AWS/refs/heads/main/Protected_5792205824061745.txt"))()
    end
})

Tab5:CreateButton({
    Name = "H4x",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/H4xScripts/Loader/refs/heads/main/loader.lua",true))()
    end
})

Tab5:CreateButton({
    Name = "全自动钻石",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NAVAAI098/Thunder-Hub/main/Kaitun.lua"))()
    end
})

Tab6:CreateButton({
    Name = "最强平民脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Wayfer0/Roblox-Scripts/refs/heads/main/Wayfer%20Hub"))()
    end
})

Tab6:CreateButton({
    Name = "sapienV1",
    Callback = function()
        loadstring(game:HttpGet("https://sapien-w76a.onrender.com/start"))()
    end
})

Tab7:CreateButton({
    Name = "Httadmin",
    Callback = function()
        loadstring(game:HttpGet"https://raw.githubusercontent.com/OWOWOWWOW/HTT/main/HT.lua")()
    end
})

Tab8:CreateButton({
    Name = "自动建造",
    Callback = function()
        loadstring(game:HttpGet((" https://raw.githubusercontent.com/catblox1346/StensUIReMake/refs/heads/main/Script/boatbuilderhub_B1"),true))()
    end
})

Tab9:CreateButton({
    Name = "1",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/6Zdt8y6z'))()
    end
})

Tab9:CreateButton({
    Name = "2",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/LESum4rq'))()
    end
})

Tab10:CreateButton({
    Name = "1",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Just3itx/Backup/main/loader.lua"))()
    end
})

Tab11:CreateButton({
    Name = "1(忍者注入器不可用)",
    Callback = function()
        loadstring(game:HttpGet(" https://raw.githubusercontent.com/ZhenX201/Ninja_Legends/refs/heads/main/source",true))()
    end
})

Tab12:CreateButton({
    Name = "1",
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/UCT-hub/5b11d10386f1b8ce08feb803861e0b79/raw/b2917b398d4b0cc80fb2aca73a3137ba494ebcf0/gistfile1.txt"))()
    end
})

Tab13:CreateButton({
    Name = "1",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/inkgames.github.io/refs/heads/main/ringta.lua"))()
    end
})

Tab14:CreateButton({
    Name = "红叶子",
    Callback = function()
        loadstring(game:HttpGet("https://getnative.cc/script/loader"))()
    end
})

Tab15:CreateButton({
    Name = "1",
    Callback = function()
        loadstring(game:HttpGet("https://paste.website/p/51397c68-b6d0-410d-ae9f-22d5ea5734df.txt", true))()
    end
})

Tab16:CreateButton({
    Name = "1",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/KindIhave/ChibaHuB/main/Chiba-BF.txt'))()
    end
})

Tab16:CreateButton({
    Name = "2",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/Xiao-Yun-UWU/main/%E6%B5%B7%E8%B4%BC%E7%8E%8Bbf.lua", true))()
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
    Name = "白",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/Kavo-Ui/main/%E4%BC%90%E6%9C%A8%E5%A4%A7%E4%BA%A82.lua", true))()
    end
})

Tab19:CreateButton({
    Name = "杯脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zuohongjian/bjb/main/bjb"))()
    end
})

Tab19:CreateButton({
    Name = "云(白灰)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/6666666666/main/%E4%BA%91%E8%84%9A%E6%9C%AC%E6%B5%8B%E8%AF%95%E7%89%88%E4%BA%91%E8%84%9A%E6%9C%AC%E6%B5%8B%E8%AF%95%E7%89%88Xiao%20Yun.lua"))()
    end
})

Tab19:CreateButton({
    Name = "核脚本",
    Callback = function()
        getgenv().he="作者鱼"loadstring(game:HelpGet("https://pastebin.com/raw/2WmdapD2"))()
    end
})

Tab19:CreateButton({
    Name = "剑客v3",
    Callback = function()
        jianke_V3 = "作者_初夏"jianke = "剑客QQ群347724155"loadstring(game:HttpGet(('https://raw.githubusercontent.com/jiankeQWQ/jiankeV3/main/jianke_V3')))()
    end
})

Tab19:CreateButton({
    Name = "XC，卡密a",
    Callback = function()
        getgenv().XC="作者XC"loadstring(game:HttpGet("https://pastebin.com/raw/PAFzYx0F"))()
    end
})

Tab19:CreateButton({
    Name = "阿尔宙斯",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))()
    end
})

Tab19:CreateButton({
    Name = "忍脚本",
    Callback = function()
        getgenv().ren666 = "忍脚本，加载时间长请耐心"loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,90,77,115,67,56,114,104,114})end)())))();
    end
})

Tab19:CreateButton({
    Name = "神光脚本",
    Callback = function()
        loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,56,102,50,76,99,113,113,80})end)())))()
    end
})

Tab19:CreateButton({
    Name = "青脚本",
    Callback = function()
        loadstring(game:HttpGet('https://rentry.co/ct293/raw'))()
    end
})

Tab19:CreateButton({
    Name = "脚本中心",
    Callback = function()
        loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,103,101,109,120,72,119,65,49"))()
    end
})

Tab19:CreateButton({
    Name = "鸭hub",
    Callback = function()
        loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\81\89\49\113\112\99\115\106})end)())))()
    end
})

Tab19:CreateButton({
    Name = "青蛙",
    Callback = function()
        getgenv().eom = "青蛙"
        loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\39\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105,110,46,99,111,109,47,114,97,119,47,68,122,120,115,81,82,68,85,39,41,41,40,41")()
    end
})

Tab19:CreateButton({
    Name = "地岩",
    Callback = function()
        loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\�\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,98,98,97,109,120,98,98,97,109,120,98,98,97,109,120,47,99,111,100,101,115,112,97,99,101,115,45,98,108,97,110,107,47,109,97,105,110,47,37,69,55,37,57,57,37,66,68,34,41,41\40\41")()
    end
})

Tab19:CreateButton({
    Name = "冰",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/GR4ChWKv"))()
    end
})

Tab19:CreateButton({
    Name = "ato",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/atoyayaya/jiaoben/main/jiamilist"))()
    end
})

Window:Show()
Rayfield:Notify({
    Title = "脚本已加载",
    Content = "按右Shift打开/关闭菜单",
    Duration = 5
})