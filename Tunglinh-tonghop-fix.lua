local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- 🌌 INTRO GUI
local gui = Instance.new("ScreenGui")
gui.Name = "TunglinhIntro"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Nền tối nhẹ
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
bg.BackgroundTransparency = 0.3
bg.Parent = gui

-- Logo Image
local logo = Instance.new("ImageLabel")
logo.Parent = gui
logo.AnchorPoint = Vector2.new(0.5,0.5)
logo.Position = UDim2.new(0.5,0,0.5,0)
logo.Size = UDim2.new(0,0,0,0) -- bắt đầu nhỏ rồi zoom
logo.BackgroundTransparency = 1
logo.Image = "http://www.roblox.com/asset/?id=77111304194141"
logo.ImageTransparency = 1

-- Hiện logo (zoom + fade in)
TweenService:Create(logo, TweenInfo.new(1.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
    Size = UDim2.new(0,200,0,200),
    ImageTransparency = 0
}):Play()

-- Xoay logo
task.spawn(function()
    while logo.Parent do
        logo.Rotation = logo.Rotation + 0.5
        task.wait(0.01)
    end
end)

-- Chữ bên dưới logo
local msg = Instance.new("TextLabel")
msg.Parent = gui
msg.AnchorPoint = Vector2.new(0.5,0)
msg.Position = UDim2.new(0.5,0,0.75,0)
msg.Size = UDim2.new(0,600,0,80)
msg.BackgroundTransparency = 1
msg.Text = "Tunglinh Hub"
msg.TextColor3 = Color3.fromRGB(0,255,255)
msg.Font = Enum.Font.GothamBlack
msg.TextScaled = true
msg.TextStrokeTransparency = 0
msg.TextStrokeColor3 = Color3.fromRGB(0,0,0)
msg.TextTransparency = 1

-- Chữ fade in
TweenService:Create(msg, TweenInfo.new(1.2), {TextTransparency=0}):Play()

-- Giữ intro 4s
task.wait(4)

-- Fade out tất cả
TweenService:Create(logo, TweenInfo.new(1.2), {ImageTransparency=1}):Play()
TweenService:Create(msg, TweenInfo.new(1.2), {TextTransparency=1}):Play()
TweenService:Create(bg, TweenInfo.new(1.2), {BackgroundTransparency=1}):Play()
task.wait(1.5)

gui:Destroy()

------------------------------------------------------------
-- 🎛 MAIN UI BUTTON
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local ImageButton = Instance.new("ImageButton")
ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.1,0,0.15,0)
ImageButton.Size = UDim2.new(0,40,0,40)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id=77111304194141"

local UICorner = Instance.new("UICorner")
UICorner.Parent = ImageButton
UICorner.CornerRadius = UDim.new(1,10)

ImageButton.MouseButton1Down:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true,Enum.KeyCode.End,false,game)
end)

------------------------------------------------------------
-- 📦 LOAD FLUENT
repeat task.wait() until game:IsLoaded()
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title="Tunglinh",
    SubTitle="Tổng Hợp Script",
    TabWidth=157,
    Size=UDim2.fromOffset(450,300),
    Acrylic=true,
    Theme="Dark",
    MinimizeKey=Enum.KeyCode.End
})

-- Tabs
local Tabs = {
    Main0=Window:AddTab({Title="Thông Tin"}),
    Main1=Window:AddTab({Title="Blox Fruits"}),
    Main2=Window:AddTab({Title="blox fruits 2"}),
    Main3=Window:AddTab({Title="blox kid 3"})
}

-- Tab 0: Thông Tin
Tabs.Main0:AddButton({
    Title="Youtuber",
    Description="Tunglinh",
    Callback=function()
        setclipboard("https://youtube.com/@tunglinhla-m5g?si=xmlVgTUb_XpQ4ZH2")
    end
})

-- Tab 1: Blox Fruits
Tabs.Main1:AddButton({
    Title="Redz Hub",
    Callback=function()
        local Settings={JoinTeam="Pirates",Translator=true}
        loadstring(game:HttpGet("https://raw.githubusercontent.com/newredz/BloxFruits/refs/heads/main/Source.luau"))(Settings)
    end
})
Tabs.Main1:AddButton({
    Title="w-azure Hub",
    Callback=function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/85e904ae1ff30824c1aa007fc7324f8f.lua"))()
    end
})
Tabs.Main1:AddButton({
    Title="Fix Lag",
    Callback=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TurboLite/Script/main/FixLag.lua"))()
    end
})
Tabs.Main1:AddButton({
    Title="Min Hub",
    Callback=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Min/refs/heads/main/MinXt2Eng"))()
    end
})
Tabs.Main1:AddButton({
    Title="Speed Hub X",
    Callback=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})
Tabs.Main1:AddButton({
    Title="Than Hub",
    Callback=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/thantzy/thanhub/refs/heads/main/thanv1"))()
    end
})
Tabs.Main1:AddButton({
    Title="BlueX HUb",
    Callback=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/Main.lua"))()
    end
})
Tabs.Main1:AddButton({
    Title="Tsoul Hub",
    Callback=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Tsuo7/TsuoHub/main/Tsuoscripts"))()
    end
})
Tabs.Main1:AddButton({
    Title="Volcano Hub V3",
    Callback=function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/indexeduu/BF-NewVer/refs/heads/main/V3New.lua"))()
    end
})
Tabs.Main1:AddButton({
    Title="HOHO Hub",
    Callback=function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI'))()
    end
})
-- Tab 2: blox fruits 2
TTabs.Main2:AddButton({
    Title="ok hub",
    Callback=function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/fakekuri/Okhubhere/refs/heads/main/MainBloxFruit.lua"))()
            end
})
Tabs.Main2:AddButton({
    Title="vũ khánh toàn HUb",
    Callback=function()
loadstring(game:HttpGet("https://gist.githubusercontent.com/vukhanhtoan2907-lab/c164c1225db0d0e0f8424030a238ab35/raw/1246a6af3f64b3701b5d091fa5b223fd6cc10ecf/gistfile1.txt"))()
            end
})
-- Tab 3: blox kid 3
Tabs.Main3:AddButton({
Title="OMG HUB",
Callback=function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua"))()
            end
})
Tabs.Main3:AddButton({
    Title="longhihi hub",
    Callback=function()
loadstring(game:HttpGet(" https://raw.githubusercontent.com/longhihilonghihi-hub/Devs-LongHiHiV2/refs/heads/main/MainV2.txt"))()
            end
          })
        Tabs.Main3:AddButton({
    Title="orange hub",
    Callback=function()
              loadstring(game: HttpGet("https://raw.githubusercontent.com/HieuDepTrai-Z/Dev_Orange/refs/heads/main/OrangeHub.lua"))()
            end
          })
        -- run this for get all fruit name `local t={};for _,v in pairs(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("GetFruits"))do table.insert(t,`"{v.Name}"`)end;setclipboard(table.concat(t, "\n"))`
    },
    ["IdleCheck"] = 150, -- every (x) seconds if not moving rejoin
};
loadstring(game:HttpGet("https://raw.githubusercontent.com/xQuartyx/QuartyzScript/main/Loader.lua"))()
            end
          })
        Tabs.Main3:AddButton({
Title="maru hub nokey",
Callback=function()
              getgenv().Team = "Marines"
loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/KimP/refs/heads/main/MaruHub"))()
            end
          })
        Tabs.Main3:AddButton({
Title="script fram rương,chén,key râu đen,...",
Callback=function()
              _G.Team = "Marine" -- "Marine" or "Pirate"
_G.MetodeTeleport = "Instant" --"Instant" or "Tween"
loadstring(game:HttpGet("https://raw.githubusercontent.com/ThundarZ/Welcome/refs/heads/main/Main/BloxFruit/Chest/AllDevices.lua"))()
            end
          })
Tabs.Main3:AddButton({
Title="trẩu v8",
Callback=function()
repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded")
repeat task.wait(1) 
until game.Players.LocalPlayer.Team ~= nil and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
loadstring(game:HttpGet("https://raw.githubusercontent.com/traurobloxdeptrai/traukhoaito/refs/heads/main/traurobloxv8.lua"))()
end
})
Tabs.Main3:AddButton({
Title="tung linh fix lag v3",
Callback=function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tunglinh-png/Tunglinh_boost_fps.lua/refs/heads/main/Tunglinh.lua"))()
end
})
Tabs.Main3:AddButton({
Title="ok hub",
Callback=function()

end
})
Tabs.Main3:AddButton({
Title="banana fake hub",
Callback=function()
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer 

getgenv().Key = "XyZpQrStUvWxYzAbCdEfGhIjKl" 

-- nanaontop

-- NaNa mãi đỉnh

loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuemmm/vthangsiitink/refs/heads/main/BananaHub.lua"))()
end
})
Tabs.Main3:AddButton({
Title="starrymoon hub",
Callback=function()
repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players
repeat task.wait() until game.Players.LocalPlayer
getgenv().Team = "Marines" -- Can change Marines => Pirates
loadstring(game:HttpGet("https://power-clock-api.vercel.app/api/clockbloxfruits", true))()
end
})
Tabs.Main3:AddButton({
Title="quantum hub",
Callback=function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/flazhy/QuantumOnyx/refs/heads/main/QuantumOnyx.lua"))()
end
})
Tabs.Main3:AddButton({
Title="hiru hub",
Callback=function()
getgenv().Settings = {
    JoinTeam = true,
    Team = "Marines"
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/kiddohiru/Source/main/BloxFruits.lua"))()
end
})
Tabs.Main3:AddButton({
Title="Shinichi hub",
Callback=function()
repeat wait() until game:IsLoaded()
loadstring(game:HttpGet("https://raw.githubusercontent.com/shinichi-dz/phucshinsayhi/refs/heads/main/ShinichiHub.lua"))()
end
})
Tabs.Main3:AddButton({
Title="yuri hub",
Callback=function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Jadelly261/BloxFruits/main/YuriMain", true))()
end 
})
Tabs.Main3:AddButton({
Title="tung linh fix lag v1",
Callback=function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tunglinh-png/Tunglinh_boost_fps.lua/refs/heads/main/Tunglinh%20t%C4%83ng%20t%E1%BB%91c%20fps.lua"))()
end
})
