

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
 function TP(P)
	 Distance = (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	 if Distance < 10 then
		 Speed = 1000
	 elseif Distance < 170 then
		 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
		 Speed = 350
	 elseif Distance < 1000 then
		 Speed = 350
	 elseif Distance >= 1000 then
		 Speed = 300
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
				 TP(CQ)
				 task.wait(0.9)
				 game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NQ,LQ)
				 elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					 for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						 if v.Name == Ms then
						 TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
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

function PlayerClick()
    while getgenv().AutoClick do task.wait(0.1)
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
end
end





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
        
        MainSection:NewToggle("Trade Bone", "AutoFarm Test", function(Value)
            getgenv().AutoTradeBone = Value
      while getgenv().AutoTradeBone do task.wait()
        FireRemote("Bones", "Buy", 1, 1)
      end
        end)
        
        MainSection:NewToggle("Auto Click", "AutoFarm Test", function(Value)
            getgenv().AutoClick = Value
            PlayerClick()
        end)
        
        ---Teleport
        local Teleport = Window:NewTab("Teleport")
        local TeleportSection = Teleport:NewSection("Teleport")

        TeleportSection:NewButton("Mansion", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-12471, 374, -7551)}):Play()
        end)
        TeleportSection:NewButton("Port Town", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-334, 7, 5300)}):Play()
        end)
        TeleportSection:NewButton("Castle ON The Sea", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-5073, 315, -3153)}):Play()
        end)
        TeleportSection:NewButton("Hydra Island", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(5756, 610, -282)}):Play()
        end)
        TeleportSection:NewButton("Greate Tree", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(2681, 1682, -7190)}):Play()
        end)
        TeleportSection:NewButton("Floating Turtle", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-12528, 332, -8658)}):Play()
        end)
        TeleportSection:NewButton("Haunted Castle", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-9517, 142, 5528)}):Play()
        end)
