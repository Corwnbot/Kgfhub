
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "KGF HUB", HidePremium = false, SaveConfig = true, ConfigFolder = "KGFHUB"})
-- Vlaues
_G.Tap = true

--Functions
function tap()
while tap = true do
   game:GetService("ReplicatedStorage")["SSG Framework"].Shared.Network.tap:FireServer()
   wait(0.000000]]]]]]0000000000000000001)
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
		_G.tap = Value
		tap()
	end    
})

OrionLib:Init()
