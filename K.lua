local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "KGF TAP HUB", HidePremium = false, SaveConfig = true, ConfigFolder = "KGFHUB"})

-- Values
getgenv().tap = true
getgenv().reb = true

-- Functions
function taptap()
while getgenv().tap == true do
game:GetService("ReplicatedStorage")["SSG Framework"].Shared.Network.tap:FireServer()
task.wait(0.1) -- added a delay to prevent spamming
end
end

function rebirth()
while getgenv().reb == true do
game:GetService("ReplicatedStorage")["SSG Framework"].Shared.Network.rebirth:InvokeServer()
task.wait(0.1) -- added a delay to prevent spamming
end
end

-- Tabs
-- AutoFarm
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
getgenv().tap = Value
if Value then
taptap()
end
end
})
AutoFarm:AddToggle({
Name = "Auto Rebirth",
Default = false,
Callback = function(Value)
getgenv().reb = Value
if Value then
rebirth()
end
end
})

OrionLib:Init()
