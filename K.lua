if game.PlaceId == 7449423635 then
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "KGF HUB", HidePremium = false, SaveConfig = true, ConfigFolder = "KGFHUB"})
-- Vlaues
_G.RandomBone = true

--Functions
function RandomBone()
while _G.RandomBone == true do
   
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")

   wait(0.000001)
  end
end
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
	_G.RandomBone = Value
	RandomBone()
end
})


end
OrionLib:Init()
