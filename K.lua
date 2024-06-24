print("Loading Orion library...")
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
if not OrionLib then
error("Failed to load Orion library")
end

print("Creating GUI...")
local Window = OrionLib:MakeWindow({
Name = "KGF TAP HUB",
HidePremium = false,
SaveConfig = true,
ConfigFolder = "KGFHUB"
})

if not Window then
error("Failed to create GUI")
end

-- Vlaues
getgenv().Tap = true
getgenv().reb = true

--Functions
function tap()
print("Tapping...")
while getgenv().Tap == true do
local success, err = pcall(function()
game:GetService("ReplicatedStorage")["SSG Framework"].Shared.Network.tap:FireServer()
end)
if not success then
print("Error tapping:", err)
end
task.wait(0)
end
end

function r()
print("Rebirthing...")
while getgenv().reb == true do
local success, err = pcall(function()
game:GetService("ReplicatedStorage")["SSG Framework"].Shared.Network.rebirth:InvokeServer()
end)
if not success then
print("Error rebirthing:", err)
end
task.wait(0)
end
end

-- Tabs
-- Bone
local AutoFarm = Window:MakeTab({
Name = "AutoFarm",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

if not AutoFarm then
error("Failed to create AutoFarm tab")
end

-- Toggles
AutoFarm:AddToggle({
Name = "Auto Tap",
Default = false,
Callback = function(Value)
_G.tap = Value
print("Auto Tap toggle set to", Value)
tap()
end
})
AutoFarm:AddToggle({
Name = "Auto Rebirth",
Default = false,
Callback = function(Value)
_G.reb = Value
print("Auto Rebirth toggle set to", Value)
r()
end
})

OrionLib:Init()
print("GUI initialized successfully!")
