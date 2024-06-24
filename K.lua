if game.Place.Id = 15705682243 then
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "KGF TAP HUB", HidePremium = false, SaveConfig = true, ConfigFolder = "KGFHUB"})
-- Vlaues
_G.Tap = true
_G.reb = true

--Functions
function tap()
while tap = true do
   game:GetService("ReplicatedStorage")["SSG Framework"].Shared.Network.tap:FireServer()
   wait(0.00000000000000000000000000000001)
   end
end

function r()
while _G.reb = true do
   game:GetService("ReplicatedStorage")["SSG Framework"].Shared.Network.rebirth:InvokeServer()
   wait(0.00000000000000000000000000000001)
   end
end
-- Tabs
-- Bone
local AutoFarm = Window:MakeTab({
	Name = "AutoFarm",
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
AutoFarm:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
		_G.reb = Value
		reb()
	end    
})

end
OrionLib:Init()
