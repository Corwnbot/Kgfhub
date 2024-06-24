if game.PlaceId == 2753915549 then
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "KGF HUB", HidePremium = false, SaveConfig = true, ConfigFolder = "KGFHUB"})

-- Local 
local ken = {
    [1] = "Ken",
    [2] = true
}

-- Tabs
-- Bone
local AutoBone = Window:MakeTab({
	Name = "FarmBone",
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
-- Auto Farm Bones
AutoBone:AddToggle({
	Name = "Auto Farm Bone",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})

-- Fast Attack
Setting:AddToggle({
	Name = "Auto Ken Haki",
	Default = false,
	Callback = function(Value)
		game:GetService("ReplicatedStorage").RigControllerEvent:FireServer(unpack(ken))
	end    
})

end
OrionLib:Init()
