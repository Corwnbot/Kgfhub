local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "KGF HUB", HidePremium = false, SaveConfig = true, ConfigFolder = "KGFHUB"})
-- Values
getgenv().AntiAFK
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


-- Weapon
local RaceV4 = Window:MakeTab({
	Name = "RaceV4",
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
-- Buttons

OrionLib:Init()

--[[
```lua
local humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid")

game:GetService("TweenService"):Create(humanoid, TweenInfo.new(2), { Position = asfafag } ```
--[[
