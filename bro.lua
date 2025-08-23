local Player = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")
local Gui = Instance.new("ScreenGui")
local KeyFrame = Instance.new("Frame")
local KeyCorner = Instance.new("UICorner")
local KeyTitle = Instance.new("TextLabel")
local KeyInput = Instance.new("TextBox")
local KeySubmit = Instance.new("TextButton")
local KeySubmitCorner = Instance.new("UICorner")
local KeyError = Instance.new("TextLabel")

local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local Minimize = Instance.new("TextButton")
local AuthorInfo = Instance.new("Frame")
local AuthorCorner = Instance.new("UICorner")
local AuthorTitle = Instance.new("TextLabel")
local AuthorContent = Instance.new("TextLabel")
local QGroup = Instance.new("TextLabel")
local ExecuteButton = Instance.new("TextButton")
local ExecuteCorner = Instance.new("UICorner")
local StatusLabel = Instance.new("TextLabel")

Gui.Name = "HedgehogScriptUI"
Gui.Parent = Player:WaitForChild("PlayerGui")

KeyFrame.Name = "KeyFrame"
KeyFrame.Parent = Gui
KeyFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
KeyFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
KeyFrame.Size = UDim2.new(0, 300, 0, 180)
KeyFrame.Active = true
KeyFrame.Draggable = true

KeyCorner.Parent = KeyFrame
KeyCorner.CornerRadius = UDim.new(0.05, 0)

KeyTitle.Name = "KeyTitle"
KeyTitle.Parent = KeyFrame
KeyTitle.BackgroundTransparency = 1
KeyTitle.Position = UDim2.new(0.1, 0, 0.1, 0)
KeyTitle.Size = UDim2.new(0.8, 0, 0.2, 0)
KeyTitle.Font = Enum.Font.SourceSansBold
KeyTitle.Text = "请输入卡密"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.TextSize = 18

KeyInput.Name = "KeyInput"
KeyInput.Parent = KeyFrame
KeyInput.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
KeyInput.Position = UDim2.new(0.1, 0, 0.4, 0)
KeyInput.Size = UDim2.new(0.8, 0, 0.2, 0)
KeyInput.Font = Enum.Font.SourceSans
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 16
KeyInput.PlaceholderText = "在此输入卡密"

KeySubmit.Name = "KeySubmit"
KeySubmit.Parent = KeyFrame
KeySubmit.BackgroundColor3 = Color3.fromRGB(80, 80, 255)
KeySubmit.Position = UDim2.new(0.25, 0, 0.7, 0)
KeySubmit.Size = UDim2.new(0.5, 0, 0.2, 0)
KeySubmit.Font = Enum.Font.SourceSansBold
KeySubmit.Text = "验证"
KeySubmit.TextColor3 = Color3.fromRGB(255, 255, 255)
KeySubmit.TextSize = 16

KeySubmitCorner.Parent = KeySubmit
KeySubmitCorner.CornerRadius = UDim.new(0.2, 0)

KeyError.Name = "KeyError"
KeyError.Parent = KeyFrame
KeyError.BackgroundTransparency = 1
KeyError.Position = UDim2.new(0.1, 0, 0.65, 0)
KeyError.Size = UDim2.new(0.8, 0, 0.1, 0)
KeyError.Font = Enum.Font.SourceSans
KeyError.Text = ""
KeyError.TextColor3 = Color3.fromRGB(255, 80, 80)
KeyError.TextSize = 14

Main.Name = "MainFrame"
Main.Parent = Gui
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.BackgroundTransparency = 0.2
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.3, 0, 0.3, 0)
Main.Size = UDim2.new(0, 350, 0, 280)
Main.Active = true
Main.Draggable = true
Main.Visible = false

UICorner.Parent = Main
UICorner.CornerRadius = UDim.new(0.03, 0)

Title.Name = "Title"
Title.Parent = Main
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 40, 0, 10)
Title.Size = UDim2.new(0, 250, 0, 20)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "火刺猬脚本"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

Close.Name = "Close"
Close.Parent = Main
Close.BackgroundTransparency = 1
Close.Position = UDim2.new(0.9, -5, 0, 10)
Close.Size = UDim2.new(0, 20, 0, 20)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 16

Minimize.Name = "Minimize"
Minimize.Parent = Main
Minimize.BackgroundTransparency = 1
Minimize.Position = UDim2.new(0.9, -25, 0, 10)
Minimize.Size = UDim2.new(0, 20, 0, 20)
Minimize.Font = Enum.Font.SourceSans
Minimize.Text = "_"
Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimize.TextSize = 16

AuthorInfo.Name = "AuthorInfo"
AuthorInfo.Parent = Main
AuthorInfo.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
AuthorInfo.Position = UDim2.new(0.05, 0, 0.2, 0)
AuthorInfo.Size = UDim2.new(0.9, 0, 0.4, 0)

AuthorCorner.Parent = AuthorInfo
AuthorCorner.CornerRadius = UDim.new(0.05, 0)

AuthorTitle.Name = "AuthorTitle"
AuthorTitle.Parent = AuthorInfo
AuthorTitle.BackgroundTransparency = 1
AuthorTitle.Position = UDim2.new(0, 10, 0, 10)
AuthorTitle.Size = UDim2.new(1, -20, 0, 20)
AuthorTitle.Font = Enum.Font.SourceSansBold
AuthorTitle.Text = "作者: 闯红灯记着吧"
AuthorTitle.TextColor3 = Color3.fromRGB(255, 200, 100)
AuthorTitle.TextSize = 16
AuthorTitle.TextXAlignment = Enum.TextXAlignment.Left

AuthorContent.Name = "AuthorContent"
AuthorContent.Parent = AuthorInfo
AuthorContent.BackgroundTransparency = 1
AuthorContent.Position = UDim2.new(0, 10, 0, 40)
AuthorContent.Size = UDim2.new(1, -20, 0, 50)
AuthorContent.Font = Enum.Font.SourceSans
AuthorContent.Text = "火刺猬脚本是一款多功能游戏辅助工具，提供多种实用功能。"
AuthorContent.TextColor3 = Color3.fromRGB(200, 200, 200)
AuthorContent.TextSize = 14
AuthorContent.TextWrapped = true
AuthorContent.TextXAlignment = Enum.TextXAlignment.Left
AuthorContent.TextYAlignment = Enum.TextYAlignment.Top

QGroup.Name = "QGroup"
QGroup.Parent = AuthorInfo
QGroup.BackgroundTransparency = 1
QGroup.Position = UDim2.new(0, 10, 0, 100)
QGroup.Size = UDim2.new(1, -20, 0, 20)
QGroup.Font = Enum.Font.SourceSans
QGroup.Text = "QQ群: 1018112611"
QGroup.TextColor3 = Color3.fromRGB(100, 180, 255)
QGroup.TextSize = 14
QGroup.TextXAlignment = Enum.TextXAlignment.Left

ExecuteButton.Name = "ExecuteButton"
ExecuteButton.Parent = Main
ExecuteButton.BackgroundColor3 = Color3.fromRGB(80, 80, 255)
ExecuteButton.Position = UDim2.new(0.1, 0, 0.7, 0)
ExecuteButton.Size = UDim2.new(0.8, 0, 0.1, 0)
ExecuteButton.Font = Enum.Font.SourceSansBold
ExecuteButton.Text = "执行脚本"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.TextSize = 16

ExecuteCorner.Parent = ExecuteButton
ExecuteCorner.CornerRadius = UDim.new(0.2, 0)

StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = Main
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0.1, 0, 0.85, 0)
StatusLabel.Size = UDim2.new(0.8, 0, 0.1, 0)
StatusLabel.Font = Enum.Font.SourceSans
StatusLabel.Text = "准备就绪"
StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
StatusLabel.TextSize = 14

KeySubmit.MouseButton1Click:Connect(function()
    if KeyInput.Text == "CHD666" then
        KeyFrame.Visible = false
        Main.Visible = true
    else
        KeyError.Text = "卡密错误，请重试"
    end
end)

Close.MouseButton1Click:Connect(function()
    Gui:Destroy()
end)

Minimize.MouseButton1Click:Connect(function()
    Main.Size = Main.Size == UDim2.new(0, 350, 0, 280) and UDim2.new(0, 350, 0, 40) or UDim2.new(0, 350, 0, 280)
    AuthorInfo.Visible = not AuthorInfo.Visible
    ExecuteButton.Visible = not ExecuteButton.Visible
    StatusLabel.Visible = not StatusLabel.Visible
end)

ExecuteButton.MouseButton1Click:Connect(function()
    ExecuteButton.Text = "执行中..."
    ExecuteButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
    StatusLabel.Text = "正在加载脚本..."
    StatusLabel.TextColor3 = Color3.fromRGB(255, 165, 0)
    
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jsusg750/-/refs/heads/main/obf_Elqe1b1whjcWm216A5Qx043EGc7om3jFqgO747vFakyR6tTy44a2830PZyyf6g7L.lua.txt"))()
    end)
    
    if success then
        ExecuteButton.Text = "执行成功"
        ExecuteButton.BackgroundColor3 = Color3.fromRGB(80, 255, 80)
        StatusLabel.Text = "脚本加载成功!"
        StatusLabel.TextColor3 = Color3.fromRGB(80, 255, 80)
        wait(2)
        ExecuteButton.Text = "执行脚本"
        ExecuteButton.BackgroundColor3 = Color3.fromRGB(80, 80, 255)
        StatusLabel.Text = "准备就绪"
        StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    else
        ExecuteButton.Text = "执行失败"
        ExecuteButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
        StatusLabel.Text = "脚本加载失败: "..string.sub(tostring(err), 1, 30).."..."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
        warn("脚本加载错误: "..err)
        wait(2)
        ExecuteButton.Text = "重试"
        ExecuteButton.BackgroundColor3 = Color3.fromRGB(80, 80, 255)
    end
end)

local dragging
local dragInput
local dragStart
local startPos

local function update(input, frame)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

KeyFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = KeyFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

KeyFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

Main.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        if KeyFrame.Visible then
            update(input, KeyFrame)
        else
            update(input, Main)
        end
    end
end)
