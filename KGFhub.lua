local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "KGF HUB", HidePremium = false, SaveConfig = true, ConfigFolder = "KGFHUB"})
-- Values
getgenv().JoinPirate = true
getgenv().JoinMarine = true
getgenv().Titles = true
getgenv().DevilShop = true
getgenv().HakiC = true
getgenv().WalkOnWater
getgenv().AntiAFK
getgenv().AutoEliteHunter
getgenv().FarmTool
getgenv().AutoClick
getgenv().AutoClickDelay
getgenv().FarmTool
getgenv().FarmPos
getgenv().FarmDistance
getgenv().AutoFinishTrial

--Functions
local Enemie = GetProxyNPC()
local function KillAura()
  local function Kill(_,Enemie)
    local EnemieH = Enemie:FindFirstChild("Humanoid")
    
    if EnemieH and EnemieH.Health > 0 then
      local PlayerPP = Player.Character and Player.Character.PrimaryPart
      local EnemiePP = Enemie.PrimaryPart
      
      if PlayerPP and EnemiePP and (EnemiePP.Position - PlayerPP.Position).Magnitude < 1500 then
        EnemieH.Health = 0
        EnemiePP.Size = Vector3.new(75, 75, 75)
        EnemiePP.CanCollide = false
        sethiddenproperty(Player, "SimulationRadius", math.huge)
      end
    else
      local EnemieHead = Enemie:FindFirstChild("Head")
      
      if EnemieHead then
        EnemieHead:Destroy()
      end
    end
  end
  
  table.foreach(Enemies:GetChildren(), Kill)
  table.foreach(ReplicatedStorage:GetChildren(), Kill)
end
-- Race V4
-- Random Fruit
local function PlayerClick()
  local plrPP = Player.Character and Player.Character.PrimaryPart
  if plrPP and TeleportPos and (plrPP.Position - TeleportPos).Magnitude > 25 then return end
  if getgenv().AutoClick and (tick() - time) >= getgenv().AutoClickDelay then
    task.spawn(function()
      VirtualUser:CaptureController()
      VirtualUser:Button1Down(Vector2.new(math.huge, math.huge))
    end)
    time = tick()
  end
end
local function EquipTool()
  local backpack = Player.Backpack
  for _,tool in pairs(backpack:GetChildren()) do
    if tool and tool.ToolTip == getgenv().FarmTool then
      EquipToolName(tool.Name)return
    end
  end
end
local function JoinPirate()
    while getgenv().JoinPirate == true do
			FireRemote("SetTeam", "Pirates")
end
end
local function JoinMarine()
    while getgenv().JoinMarine == true do
			FireRemote("SetTeam", "Marines")
end
end
local function DevilShop()
    while getgenv().DevilShop == true do
			FireRemote("GetFruits")
	Player.PlayerGui.Main.FruitShop.Visible = true
end
end
local function Titles()
    while getgenv().Titles == true do
			FireRemote("getTitles")
  Player.PlayerGui.Main.Titles.Visible = true
end
end
local function HakiC()
    while getgenv().HakiC == true do
		Player.PlayerGui.Main.Colors.Visible = true
end
end

-- Weapon
local Weapon = Window:MakeTab({
	Name = "Weapon",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local RaceV4 = Window:MakeTab({
	Name = "RaceV4",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
-- Setting
local Setting = Window:MakeTab({
	Name = "Setting",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
-- Toggles
-- Weapon 
RaceV4:AddToggle({Title = "Auto Finish Trial [Ghoul & Human ]", Callback = function(Value)
    getgenv().AutoFinishTrial = Value
    task.spawn(function()
      local PlayerRace
      task.spawn(function()
        while getgenv().AutoFinishTrial do task.wait()
          PlayerRace = Player.Data.Race.Value
        end
      end)
      
      while getgenv().AutoFinishTrial do task.wait()
        if PlayerRace and typeof(PlayerRace) == "string" then
         if PlayerRace == "Ghoul" then
            KillAura()
          elseif PlayerRace == "Human" then
            KillAura()
        end
      end
    end)
  end})
end
-- Setting
Setting:AddDropdown({
  Title = "Farm Tool",
  Values = {"Melee", "Sword", "Blox Fruit"},
  Default = 1,
  Callback = function(Value)
    getgenv().FarmTool = Value
  end
})
Misc:AddSlider({Title = "Farm Distance",Min = 5,Max = 50,Default = 20,Rounding = 1,Callback = function(Value)
  getgenv().FarmPos = Vector3.new(0, Value or 15, Value or 10)getgenv().FarmDistance = Value
end})

Misc:AddSlider({Title = "Tween Speed",Min = 50,Max = 300,Default = 170,Rounding = 5,Callback = function(Value)
  getgenv().TweenSpeed = Value
end})

Setting:AddSlider({Title = "Auto Click Delay",Min = 0.01,Max = 1,Default = 0.18,Rounding = 0.01,Callback = function(Value)
  getgenv().AutoClickDelay = Value
end})

Setting:AddToggle({Title = "Auto Click", true, Callback = function(Value)
  getgenv().AutoClick = Value
end})

Setting:AddToggle({
	Name = "WalkOnWater",
	Default = false,
	Callback = function(Value)
		getgenv().WalkOnWater = Value
    task.spawn(function()
      local Map = workspace:WaitForChild("Map", 9e9)
      
      while getgenv().WalkOnWater do task.wait(0.1)
        Map:WaitForChild("WaterBase-Plane", 9e9).Size = Vector3.new(1000, 113, 1000)
      end
      Map:WaitForChild("WaterBase-Plane", 9e9).Size = Vector3.new(1000, 80, 1000)
    end)
  end
})
Setting:AddToggle({
  Title = "Anti AFK",
  Default = true,
  Callback = function(Value)
    getgenv().AntiAFK = Value
    task.spawn(function()
      while getgenv().AntiAFK do
        VirtualUser:CaptureController()
        VirtualUser:ClickButton1(Vector2.new(math.huge, math.huge))task.wait(600)
      end
    end)
  end
})



-- Random Fruit
Setting:AddButton({
	Name = "JoinPirate",
	Callback = function(Value)
		getgenv().JoinPirate = Value
		JoinPirate()
	end    
})

Setting:AddButton({
	Name = "JoinMarine",
	Callback = function(Value)
		getgenv().JoinMarine = Value
		JoinMarine()
	end    
})

Setting:AddButton({
	Name = "Devil Fruit Shop",
	Callback = function(Value)
      		getgenv().DevilShop = Value
      DevilShop()
  	end    
})
Setting:AddButton({
	Name = "Titles",
	Callback = function(Value)
      		getgenv().Titles = Value
      Titles()
  	end    
})
Setting:AddButton({
	Name = "Haki Colors",
	Callback = function(Value)
      		getgenv().HakiC = Value
      HakiC()
  	end    
})

-- Buttons

OrionLib:Init()

--[[
```lua
local humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid")

game:GetService("TweenService"):Create(humanoid, TweenInfo.new(2), { Position = asfafag } ```
--[[
