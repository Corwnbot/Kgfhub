for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
	v:Disable()
end
local tools = {}

for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
	if v:IsA("Tool") then
		table.insert(tools, v.Name)
	end
end

---autofarm Level
---lv 0-10
function CheckQuest()
	local Lv = game.Players.LocalPlayer.Data.Level.Value
	 if Lv == 0 or Lv <= 10 then
	 Ms = "Bandit [Lv. 5]"
	 NM = "Bandit"
	 LQ = 1
	 NQ = "BanditQuest1"
	 CQ = CFrame.new(1062.64697265625, 16.516624450683594, 1546.55224609375)
	 end
 end
 function PlayerTP(P)
	 Distance = (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	 if Distance < 10 then
		 Speed = 1000
	 elseif Distance < 170 then
		 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
		 Speed = 400
	 elseif Distance < 1000 then
		 Speed = 400
	 elseif Distance >= 1000 then
		 Speed = 400
	 end
	 game:GetService("TweenService"):Create(
		 game.Players.LocalPlayer.Character.HumanoidRootPart,
		 TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
		 {CFrame = P}
	 ):Play()
 end
 
 spawn(function()
	while task.wait() do
		if getgenv().AutoFarm then
			CheckQuest()
			if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				 PlayerTP(CQ)
				 task.wait(0.9)
				 game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NQ,LQ)
				 elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					 for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						 if v.Name == Ms then
						 PlayerTP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
						 v.HumanoidRootPart.Size = Vector3.new(60,60,60)
					 end
				 end
			 end
		 end
	 end
 end)
 spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
		if getgenv().AutoFarm then
		pcall(function()
                game:GetService'VirtualUser':CaptureController()
			    game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
            end)
        end
    end)
end)





local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
        local Window = Library.CreateLib("BloxFruits Script Test", "Ocean")
      
      ---Main
        local Main = Window:NewTab("Main")
        local MainSection = Main:NewSection("Main")


        local toolDropdown = MainSection:NewDropdown("Weapon", "Choose your tool to use!", tools, function(weapon)
        end)
        
game.Players.LocalPlayer.Backpack.DescendantAdded:Connect(function(tool)
	local toolName = tool.Name
	if tool:IsA("Tool") then
		table.insert(tools, toolName)
		toolDropdown:Refresh(tools)
	end
end)
game.Players.LocalPlayer.Backpack.DescendantRemoving:Connect(function(tool)
	local toolName = tool.Name
	if tool:IsA("Tool") then
		for i,v in pairs(tools) do
			if v == toolName then
				table.remove(tools, i)
			end
		end	
	end
	toolDropdown:Refresh(tools)
end)

        MainSection:NewToggle("AutoFarm", "AutoFarm Test", function(state)
            if state then
                getgenv().AutoFarm = true
            else
                getgenv().AutoFarm = false
            end
        end)
        ---Teleport
        local Teleport = Window:NewTab("Teleport")
        local TeleportSection = Teleport:NewSection("Teleport")

        TeleportSection:NewButton("Mansion", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-12471, 374, -7551)}):Play()
        end)

OrionLib:Init()

--[[
```lua
local humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid")

game:GetService("TweenService"):Create(humanoid, TweenInfo.new(2), { Position = asfafag } ```
--[[
