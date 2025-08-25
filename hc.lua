local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 创建主窗口
local Window = Rayfield:CreateWindow({
    Name = "UI 示例窗口",
    LoadingTitle = "加载中...",
    LoadingSubtitle = "UI 元素示例",
    ConfigurationSaving = {
        Enabled = false,
    },
})

-- 创建标签页
local Tab1 = Window:CreateTab("标签页1")
local Tab2 = Window:CreateTab("标签页2")
local Tab3 = Window:CreateTab("标签页3")

-- 1. 切换开关(Toggle)示例
local ToggleExample = Tab1:CreateToggle({
    Name = "切换开关示例",
    CurrentValue = false,
    Flag = "ToggleExample",
    Callback = function(Value)
        print("切换开关状态:", Value)
    end
})

-- 2. 下拉菜单(Dropdown)示例
local DropdownExample = Tab1:CreateDropdown({
    Name = "下拉菜单示例",
    Options = {"选项1", "选项2", "选项3"},
    CurrentOption = "选项1",
    MultipleOptions = false,
    Flag = "DropdownExample",
    Callback = function(Option)
        print("选择的选项:", Option)
    end,
})

-- 3. 多选下拉菜单示例
local MultiDropdownExample = Tab1:CreateDropdown({
    Name = "多选下拉菜单示例",
    Options = {"苹果", "香蕉", "橙子", "葡萄"},
    CurrentOption = {"苹果", "香蕉"},
    MultipleOptions = true,
    Flag = "MultiDropdownExample",
    Callback = function(Options)
        print("选择的多个选项:", table.concat(Options, ", "))
    end,
})

-- 4. 滑块(Slider)示例
local SliderExample = Tab1:CreateSlider({
    Name = "滑块示例",
    Range = {0, 100},
    Increment = 1,
    CurrentValue = 50,
    Flag = "SliderExample",
    Callback = function(Value)
        print("滑块值:", Value)
    end,
})

-- 5. 颜色选择器(ColorPicker)示例
local ColorPickerExample = Tab2:CreateColorPicker({
    Name = "颜色选择器示例",
    Color = Color3.fromRGB(255, 0, 0),
    Callback = function(Color)
        print("选择的颜色:", Color)
    end
})

-- 6. 按钮(Button)示例
local ButtonExample = Tab2:CreateButton({
    Name = "按钮示例",
    Callback = function()
        print("按钮被点击了!")
    end,
})

-- 7. 输入框(TextBox)示例
local TextBoxExample = Tab2:CreateInput({
    Name = "输入框示例",
    PlaceholderText = "输入一些文字...",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        print("输入的文本:", Text)
    end,
})

-- 8. 键位绑定(Keybind)示例
local KeybindExample = Tab3:CreateKeybind({
    Name = "键位绑定示例",
    CurrentKeybind = "Q",
    HoldToInteract = false,
    Flag = "KeybindExample", 
    Callback = function(Keybind)
        print("按下的键:", Keybind)
    end,
})

-- 9. 标签(Label)示例
local LabelExample = Tab3:CreateLabel({
    Name = "标签示例",
    Content = "这是一个静态文本标签",
})

-- 10. 段落(Paragraph)示例
local ParagraphExample = Tab3:CreateParagraph({
    Title = "段落标题",
    Content = "这是一个多行文本段落，可以显示更长的说明性文本。\n这是第二行内容。"
})

-- 11. 通知(Notify)示例
local NotifyButton = Tab3:CreateButton({
    Name = "显示通知示例",
    Callback = function()
        Rayfield:Notify({
            Title = "通知示例",
            Content = "这是一个通知消息!",
            Duration = 5,
            Image = 4483362458,
            Actions = {
                Ignore = {
                    Name = "忽略",
                    Callback = function()
                        print("用户点击了忽略")
                    end
                },
            },
        })
    end,
})

-- 12. 部分(Section)示例
local SectionExample = Tab3:CreateSection("部分标题示例")

-- 在部分中添加元素
local SectionToggle = Tab3:CreateToggle({
    Name = "部分中的切换开关",
    CurrentValue = true,
    Flag = "SectionToggle",
    Callback = function(Value)
        print("部分中的开关:", Value)
    end
})
把这UI替换到下面的UI
local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/FUEx0f3G"))()
local Window = OrionLib:MakeWindow({Name = "新火刺猬脚本", HidePremium = false, SaveConfig = false, IntroText = "欢迎使用", ConfigFolder = "欢迎使用"})

local Tab = Window:MakeTab({
    Name = "脚本公告",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddParagraph("作者","火刺猬")
Tab:AddLabel("作者QQ：3982716135")
Tab:AddLabel("QQ群：1018112611")

local Tab = Window:MakeTab({
	Name = "通用功能",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "HUA 光影",
  Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/arzRCgwS"))()
  end
})

Tab:AddButton({
  Name = "光影_2",
  Default = false,
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
  end
})

Tab:AddButton({
	Name = "超高画质",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
  end
})    

Tab:AddButton({
  Name = "旋转",
  Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
  end
})

Tab:AddToggle({
	Name = "夜视",
	Default = false,
	Callback = function(Value)
		if Value then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
		else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
		end
	end
})
 
Tab:AddButton({
	Name = "飞车",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()
	end
})

Tab:AddButton({
	Name = "爬墙",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end
})

Tab:AddButton({
    Name = "动作",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Zj4NnKs6"))()
    end
})

Tab:AddButton({
	Name = "电脑键盘",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
  	end    
})

Tab:AddButton({
	Name = "踏空行走",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
	end
})

local player = Window:MakeTab({
	Name = "玩家",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "无限跳",
    Default = false,
	Callback = function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
	end
})

player:AddTextbox({
	Name = "移动速度",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end
})

player:AddTextbox({
	Name = "跳跃高度",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end
})

Tab:AddTextbox({
	Name = "重力设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Workspace.Gravity = Value
	end
})

player:AddButton({
	Name = "穿墙",
	Callback = function()
      	loadstring(game:HttpGet("https://pastebin.com/raw/jvyN5hT8"))()
  	end
})

player:AddButton({
	Name = "飞行",
	Callback = function()
      	loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Gui-Fly-v3-37111"))()
  	end
})

local Tab = Window:MakeTab({
    Name = "巴掌大战",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "1",
    Callback = function()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Battles")))()
    end
})

Tab:AddButton({
    Name = "全勋章手套",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/SlapBattles"))()
    end
})

Tab:AddButton({
    Name = "目前我认识最强巴掌脚本",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Guy-that-exists/Hub-that-exists/main/Script"))()
    end
})

Tab:AddButton({
    Name = "获取收音机",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Donjosx/AWS/refs/heads/main/Protected_5792205824061745.txt"))()
    end
})

local Tab = Window:MakeTab({
    Name = "森林99夜",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "H4x",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/H4xScripts/Loader/refs/heads/main/loader.lua",true))()
    end
})

Tab:AddButton({
    Name = "全自动钻石",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NAVAAI098/Thunder-Hub/main/Kaitun.lua"))()
    end
})

local Tab = Window:MakeTab({
    Name = "rake",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "最强平民脚本",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Wayfer0/Roblox-Scripts/refs/heads/main/Wayfer%20Hub"))()
    end
})

Tab:AddButton({
    Name = "sapienV1",
    Callback = function()
    loadstring(game:HttpGet("https://sapien-w76a.onrender.com/start"))()
    end
})

local Tab = Window:MakeTab({
    Name = "被遗弃",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "Httadmin",
    Callback = function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/OWOWOWWOW/HTT/main/HT.lua")()
    end
})

local Tab = Window:MakeTab({
    Name = "造船寻宝",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "自动建造",
    Callback = function()
    loadstring(game:HttpGet((" https://raw.githubusercontent.com/catblox1346/StensUIReMake/refs/heads/main/Script/boatbuilderhub_B1"),true))()
    end
})

local Tab = Window:MakeTab({
    Name = "chain",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "1",
    Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/6Zdt8y6z'))()
    end
})

Tab:AddButton({
    Name = "2",
    Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/LESum4rq'))()
    end
})

local Tab = Window:MakeTab({
    Name = "sol'RNG",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "1",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Just3itx/Backup/main/loader.lua"))()
    end
})

local Tab = Window:MakeTab({
    Name = "忍者传奇",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "1(忍者注入器不可用)",
    Callback = function()
    loadstring(game:HttpGet(" https://raw.githubusercontent.com/ZhenX201/Ninja_Legends/refs/heads/main/source",true))()
    end
})

local Tab = Window:MakeTab({
    Name = "偷走脑红",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "1",
    Callback = function()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/UCT-hub/5b11d10386f1b8ce08feb803861e0b79/raw/b2917b398d4b0cc80fb2aca73a3137ba494ebcf0/gistfile1.txt"))()
    end
})

local Tab = Window:MakeTab({
    Name = "墨水游戏",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "1",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/inkgames.github.io/refs/heads/main/ringta.lua"))()
    end
})

local Tab = Window:MakeTab({
    Name = "死铁轨",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "红叶子",
    Callback = function()
    loadstring(game:HttpGet("https://getnative.cc/script/loader"))()
    end
})

local Tab = Window:MakeTab({
    Name = "监狱人生",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "1",
    Callback = function()
    loadstring(game:HttpGet("https://paste.website/p/51397c68-b6d0-410d-ae9f-22d5ea5734df.txt", true))()
    end
})

local Tab = Window:MakeTab({
    Name = "bf",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "1",
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KindIhave/ChibaHuB/main/Chiba-BF.txt'))()
    end
})

Tab:AddButton({
    Name = "2",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/Xiao-Yun-UWU/main/%E6%B5%B7%E8%B4%BC%E7%8E%8Bbf.lua", true))()
    end
})

local Tab = Window:MakeTab({
    Name = "力量传奇",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "力量传奇1",
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/jynzl/main/main/Musclas%20Legenos.lua'))()
    end
})

Tab:AddButton({
    Name = "docaV1",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DocaV1/Get-Huge-Simulator/refs/heads/main/V1.0.1"))()
    end
})

local Tab = Window:MakeTab({
    Name = "伐木脚本",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "白",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/Kavo-Ui/main/%E4%BC%90%E6%9C%A8%E5%A4%A7%E4%BA%A82.lua", true))()
    end
})

local Tab = Window:MakeTab({
    Name = "脚本中心",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "杯脚本",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zuohongjian/bjb/main/bjb"))()
    end
})

Tab:AddButton({
    Name = "云(白灰)",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/6666666666/main/%E4%BA%91%E8%84%9A%E6%9C%AC%E6%B5%8B%E8%AF%95%E7%89%88%E4%BA%91%E8%84%9A%E6%9C%AC%E6%B5%8B%E8%AF%95%E7%89%88Xiao%20Yun.lua"))()
    end
})

Tab:AddButton({
    Name = "核脚本",
    Callback = function()
    getgenv().he="作者鱼"loadstring(game:HelpGet("https://pastebin.com/raw/2WmdapD2"))()
    end
})

Tab:AddButton({
    Name = "剑客v3",
    Callback = function()
   jianke_V3 = "作者_初夏"jianke = "剑客QQ群347724155"loadstring(game:HttpGet(('https://raw.githubusercontent.com/jiankeQWQ/jiankeV3/main/jianke_V3')))()
    end
})

Tab:AddButton({
    Name = "XC，卡密a",
    Callback = function()
    getgenv().XC="作者XC"loadstring(game:HttpGet("https://pastebin.com/raw/PAFzYx0F"))()
    end
})

Tab:AddButton({
    Name = "阿尔宙斯",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))()
    end
})

Tab:AddButton({
    Name = "忍脚本",
    Callback = function()
    getgenv().ren666 = "忍脚本，加载时间长请耐心"loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,90,77,115,67,56,114,104,114})end)())))();
    end
})

Tab:AddButton({
    Name = "神光脚本",
    Callback = function()
    loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,56,102,50,76,99,113,113,80})end)())))()
    end
})

Tab:AddButton({
    Name = "青脚本",
    Callback = function()
    loadstring(game:HttpGet('https://rentry.co/ct293/raw'))()
    end
})

Tab:AddButton({
    Name = "脚本中心",
    Callback = function()
    loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\103\101\109\120\72\119\65\49"))()
    end
})

Tab:AddButton({
    Name = "鸭hub",
    Callback = function()
    loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,81,89,49,113,112,99,115,106})end)())))()
    end
})

Tab:AddButton({
	Name = "青蛙",
	Callback = function()
   
getgenv().eom = "青蛙"
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\39\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\68\122\120\115\81\82\68\85\39\41\41\40\41")()
    end
})

Tab:AddButton({
	Name = "地岩",
	Callback = function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\98\98\97\109\120\98\98\97\109\120\98\98\97\109\120\47\99\111\100\101\115\112\97\99\101\115\45\98\108\97\110\107\47\109\97\105\110\47\37\69\55\37\57\57\37\66\68\34\41\41\40\41")()
    end
})

Tab:AddButton({
    Name = "冰",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/GR4ChWKv"))()
    end
})

Tab:AddButton({
	Name = "ato",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/atoyayaya/jiaoben/main/jiamilist"))()
    end
})