
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "KGF TAP HUB", HidePremium = false, SaveConfig = true, ConfigFolder = "KGFHUB"})
-- Vlaues
getgenv().tap = true
getgenv().reb = true

--Functions
function taptap()
while getgenv().tap = true do
   game:GetService("ReplicatedStorage")["SSG Framework"].Shared.Network.tap:FireServer()
   task.wait(0.00000000000000000000000000000001)
   end
end

function rebirth()
while getgenv().reb = true do
   game:GetService("ReplicatedStorage")["SSG Framework"].Shared.Network.rebirth:InvokeServer()
   task.wait(0.00000000000000000000000000000001)
   end
end
-- Tabs
-- Bone
local AutoFarm = Window:MakeTab({
	Name = "AutoFarm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Quest
local Quest = Window:MakeTab({
	Name = "Quest",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Fruit / Raid
local FruitRaid = Window:MakeTab({
	Name = "Fruit & Raid",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Farm Sea
local FarmSea = Window:MakeTab({
	Name = "Farm Sea",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Races
local Races = Window:MakeTab({
	Name = "Races",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Teleports
local Teleports = Window:MakeTab({
	Name = "Teleports",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Shop
local Shop = Window:MakeTab({
	Name = "Shop",
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
AutoFarm:AddToggle({
	Name = "Auto TAP",
	Default = false,
	Callback = function(Value)
		getgenv().tap = Value
		taptap()
	end    
})
AutoFarm:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
		getgenv().reb = Value
		rebirth()
	end    
})

OrionLib:Init()
