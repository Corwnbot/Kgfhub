local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "KGF HUB", HidePremium = false, SaveConfig = true, ConfigFolder = "KGFHUB"})

-- Local 
local args = {
    [1] = "Ken",
    [2] = true
}

local SKELETON = {
    [1] = "hit",
    [2] = {
        [1] = workspace.Enemies:FindFirstChild("Reborn Skeleton").HumanoidRootPart,
        [2] = workspace.Enemies:FindFirstChild("Reborn Skeleton").RightUpperArm,
        [3] = workspace.Enemies:FindFirstChild("Reborn Skeleton").RightLowerArm,
        [4] = workspace.Enemies:FindFirstChild("Reborn Skeleton").RightHand,
        [5] = workspace.Enemies:FindFirstChild("Reborn Skeleton").RightFoot,
        [6] = workspace.Enemies:FindFirstChild("Reborn Skeleton").RightLowerLeg,
        [7] = workspace.Enemies:FindFirstChild("Reborn Skeleton").RightUpperLeg,
        [8] = workspace.Enemies:FindFirstChild("Reborn Skeleton").HumanoidRootPart,
        [9] = workspace.Enemies:FindFirstChild("Reborn Skeleton").Head,
        [10] = workspace.Enemies:FindFirstChild("Reborn Skeleton").UpperTorso,
        [11] = workspace.Enemies:FindFirstChild("Reborn Skeleton").LowerTorso,
        [12] = workspace.Enemies:FindFirstChild("Reborn Skeleton").RightUpperArm,
        [13] = workspace.Enemies:FindFirstChild("Reborn Skeleton").RightLowerArm,
        [14] = workspace.Enemies:FindFirstChild("Reborn Skeleton").RightHand,
        [15] = workspace.Enemies:FindFirstChild("Reborn Skeleton").RightFoot,
        [16] = workspace.Enemies:FindFirstChild("Reborn Skeleton").RightLowerLeg,
        [17] = workspace.Enemies:FindFirstChild("Reborn Skeleton").RightUpperLeg,
        [18] = workspace.Enemies:FindFirstChild("Reborn Skeleton").LeftUpperLeg,
        [19] = workspace.Enemies:FindFirstChild("Reborn Skeleton").LeftUpperArm,
        [20] = workspace.Enemies:FindFirstChild("Reborn Skeleton").LeftLowerArm,
        [21] = workspace.Enemies:FindFirstChild("Reborn Skeleton").LeftHand
    },
    [3] = 1,
    [4] = ""
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
		game:GetService("ReplicatedStorage").RigControllerEvent:FireServer(unpack(args))
	end    
})

-- Fast Attack
Setting:AddToggle({
	Name = "Fast Attack",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})

end
OrionLib:Init()
