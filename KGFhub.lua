local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "KGF HUB", HidePremium = false, SaveConfig = true, ConfigFolder = "KGFHUB"})
-- Values
getgenv().randomfruit = true
getgenv().ac = true
getgenv().sea1 = true
getgenv().sea2 = true
getgenv().sea3 = true

--Functions
-- Random Fruit
function randomfruit()
 while getgenv().randomfruit == true do 
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
    task.wait(0.1)
    end
 end
 
-- Auto Click
function autoclick()
    while getgenv().s == true do
        game:GetService('VirtualUser'):CaptureController()
        game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
        task.wait(0.00000000000000000000001)
    end
end
-- Teleport To sea 1
function sea1()
    while getgenv().sea1 == true do
        local args = {
				[1] = "TravelMain" -- OLD WORLD to NEW WORLD
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			task.wait(0.1)
		end)
end
-- Sea 2
function sea2()
    while getgenv().sea2 == true do
        local args = {
				[1] = "TravelDressrosa" -- NEW WORLD to OLD WORLD
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			task.wait(0.1)
		end)
end
-- sea 3
function sea3()
    while getgenv().sea3 == true do
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
			task.wait(0.1)
		end)
end

-- Tabs
-- Fruit
local Fruit = Window:MakeTab({
	Name = "Fruit",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
-- Teleports
local Teleportsb = Window:MakeTab({
	Name = "Teleports",
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
-- Random Fruit
Fruit:AddToggle({
	Name = "Buy Random Fruit",
	Default = false,
	Callback = function(Value)
		getgenv().randomfruit = Value
		randomfruit()
	end    
})
-- Auto Click
Fruit:AddToggle({
	Name = "Auto Click",
	Default = false,
	Callback = function(Value)
		getgenv().autoclick = Value
		autoclick()
	end    
})

-- Buttons
Teleportsb:AddButton({
	Name = "Teleport To Sea 1",
	Callback = function(Value)
      		getgenv().sea1 = Value
      sea1()
  	end    
})
Teleportsb:AddButton({
	Name = "Teleport To Sea 2",
	Callback = function(Value)
      		getgenv().sea2 = Value
      sea2()
  	end    
})
Teleportsb:AddButton({
	Name = "Teleport To Sea 3",
	Callback = function(Value)
      		getgenv().sea3 = Value
      sea3()
  	end    
})

OrionLib:Init()

--[[
```lua
local humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid")

game:GetService("TweenService"):Create(humanoid, TweenInfo.new(2), { Position = asfafag } ```
--[[
