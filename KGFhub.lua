local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "KGF HUB", HidePremium = false, SaveConfig = true, ConfigFolder = "KGFHUB"})
getgenv().AutoFinishTrial = true
getgenv().AutoKillAura = true
-- Weapon
local RaceV4 = Window:MakeTab({
	Name = "RaceV4",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Toggles
function PlayerTP(P)
	 Distance = (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	 if Distance < 10 then
		 Speed = 1000
	 elseif Distance < 170 then
		 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
		 Speed = 400
	 elseif Distance < 1000 then
		 Speed = 400
	 elseif Distance >= 1000 then
		 Speed = 400
	 end
	 game:GetService("TweenService"):Create(
		 game.Players.LocalPlayer.Character.HumanoidRootPart,
		 TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
		 {CFrame = P}
	 ):Play()
 end
 
function KillAura()
  function Kill(_,Enemie)
    EnemieH = Enemie:FindFirstChild("Humanoid")
    
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

function AutoKillAura()
  while getgenv().AutoKillAura == true do task.wait()
    KillAura()
  end
end

-- Setting
-- Buttons
RaceV4:AddToggle("Toggle", {Title = "Auto Finish CYBORG", Callback = function(Value)
getgenv().AutoFinishTrial = Value
PlayerTP(CFrame.new(28654, 14898, -30))
end
RaceV4:AddToggle("Toggle", {Title = "Auto Finish GHOUL", Callback = function(Value)
getgenv().AutoFinishTrial = Value
KillAura()
end
RaceV4:AddToggle("Toggle", {Title = "Auto Finish HUMAN", Callback = function(Value)
getgenv().AutoFinishTrial = Value
KillAura()
end
RaceV4:AddToggle("Toggle", {Title = "Auto Finish MINK", Callback = function(Value)
getgenv().AutoFinishTrial = Value
for _,part in pairs(workspace:GetDescendants()) do
              if part.Name == "StartPoint" then
                PlayerTP(part.CFrame)
              end
            end
end
RaceV4:AddToggle("Toggle", {Title = "Auto Finish ANGEL", Callback = function(Value)
getgenv().AutoFinishTrial = Value
for _,part in pairs(workspace.Map.SkyTrial.Model:GetDescendants()) do
                if part.Name ==  "snowisland_Cylinder.081" then
                  PlayerTP(part.CFrame)
                end
              end
end

OrionLib:Init()

--[[
```lua
local humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid")

game:GetService("TweenService"):Create(humanoid, TweenInfo.new(2), { Position = asfafag } ```
--[[
