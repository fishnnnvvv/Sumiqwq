--#region Player Stuff
function JumpPower(Val)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Val
end

getgenv().Speed = 16
function Walkspeed()
    game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().Speed
    end)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().Speed
end

function NoClip(NoClipVal)
    if not NoClipVal then
        Clipping:Disconnect()
        return
    end
    Clipping = game:GetService("RunService").Stepped:connect(function()
        for i, v in next, game.Players.LocalPlayer.Character:GetChildren() do
            if v:IsA("Part") or v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end)
end

--#region Better Graphics
function BetterG()
    local light = game.Lighting
    light:ClearAllChildren()
    local color = Instance.new("ColorCorrectionEffect", light)
    local bloom = Instance.new("BloomEffect", light)
    local sun = Instance.new("SunRaysEffect", light)
    local blur = Instance.new("BlurEffect", light)
    local config = { ColorCorrection = true, Sun = true, Lighting = true, BloomEffect = true, }
    color.Enabled = true
    color.Contrast = 0.15
    color.Brightness = 0.1
    color.Saturation = 0.25
    color.TintColor = Color3.fromRGB(255, 222, 211)
    sun.Enabled = true
    sun.Intensity = 0.2
    sun.Spread = 1
    bloom.Enabled = true
    bloom.Intensity = 1
    bloom.Size = 32
    bloom.Threshold = 1
    blur.Enabled = true
    blur.Size = 3
    light.Ambient = Color3.fromRGB(0, 0, 0)
    light.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
    light.ColorShift_Top = Color3.fromRGB(0, 0, 0)
    light.ExposureCompensation = 0
    light.GlobalShadows = true
    light.OutdoorAmbient = Color3.fromRGB(112, 117, 128)
    light.Outlines = false
end

function Light(Val)
    if Val == false then
        game.Players.LocalPlayer.Character.Head.PointLight:Destroy()
        return
    end
    local PL = Instance.new("PointLight", game.Players.LocalPlayer.Character:FindFirstChild("Head"))
    PL.Range = 100
    PL.Brightness = 1
    PL.Shadows = false
end

local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/fishnnnvvv/Sumi/main/SumiHub.lua"))()

local Window = redzlib:MakeWindow({
  Title = "sumi",
  SubTitle = "伐木大亨2",
  SaveFolder = "Sumi配置"
})

--选项卡

local Tab1 = Window:MakeTab({"设置", "cool"})
local Tab2 = Window:MakeTab({"玩家", "swords"})
local Tab3 = Window:MakeTab({"基地", "frame"})
local Tab4 = Window:MakeTab({"树木", "circle"})

Tab1:AddButton({"浅色主题", function()
  redzlib:SetTheme("Dark")
end})

Tab1:AddButton({"深色主题", function()
  redzlib:SetTheme("Darker")
end})

Tab1:AddButton({"黑紫主题", function()
  redzlib:SetTheme("Purple")
end})
Tab1:AddButton({"粉色主题", function()
  redzlib:SetTheme("Pink")
end})

Tab1:AddDiscordInvite({
  Name = "Sumi Hub",
  Logo = "rbxassetid://17700422463",
  Invite = "QQ2683408667"
})

Window:SelectTab(Tab2)
local Section = Tab2:AddSection({"人物状态"})

getgenv().ison = true
  
    Nspeed = 16
  
    NSspeed = 65

Tab2:AddSlider({
  Name = "速度",
  Min = 16,
  Max = 800,
  Increase = 1,
  Default = false,
  Callback = function(Value)
    if getgenv().ison == true then
      Nspeed = Value
      getgenv().Speed = Value
      Walkspeed()
    else
      getgenv().SprintSpeed = getgenv().Speed
      Nspeed = Value
      getgenv().Speed = Value
      Walkspeed()
    end
  end
})

Tab2:AddSlider({
  Name = "跳跃",
  Min = 50,
  Max = 800,
  Increase = 1,
  Default = false,
  Callback = function(Value)
    JumpPower(Value)
  end
})

game:GetService'Workspace'.Camera.FieldOfView = Fovnum

Tab2:AddSlider({
  Name = "视场",
  Min = 50,
  Max = 600,
  Increase = 1,
  Default = true,
  Callback = function(Value)
  game:GetService'Workspace'.Camera.FieldOfView = Value
      Fovnum = Value
      SaveSettings()
  end
})

local Button = Tab2:AddButton({"飞行", function()
    loadstring(
        "\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
end
})

local Toggle1 = Tab2:AddToggle({
  Name = "灯光",
  Description = "<font color='rgb(255, 0, 0)'>人物</font>周围<font color='rgb(88, 101, 242)'>发光</font>可以在暗的地方<font color='rgb(88, 101, 242)'>照明</font>",
  Default = false,
  Callback = function(Value)
    Light(Value)
  end
})

local Toggle1 = Tab2:AddToggle({
  Name = "穿墙",
  Description = "<font color='rgb(255, 0, 0)'>人物</font>可以无视墙体",
  Default = false,
  Callback = function(Value)
  NoClip(Value)
  end
})

local Button = Tab2:AddButton({"安全死亡", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.000005834005605720449, -398, 0.000011642230674624443)
  end
})
    
Tab2:AddButton({"IY Dex", function()
local __function = loadstring(game:HttpGet("https://github.com/Hosvile/DEX-Explorer/releases/latest/download/main.lua", true))

__function(__function)
end})