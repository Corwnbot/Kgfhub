local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Title of the library", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})


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

getgenv().ToTarget = function(p)
        task.spawn(function()
            pcall(function()
                if game:GetService("Players").LocalPlayer:DistanceFromCharacter(p.Position) <= 390 then 
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = p
                elseif not game.Players.LocalPlayer.Character:FindFirstChild("Root")then 
                    local K = Instance.new("Part",game.Players.LocalPlayer.Character)
                    K.Size = Vector3.new(1,0.5,1)
                    K.Name = "Root"
                    K.Anchored = true
                    K.Transparency = 1
                    K.CanCollide = false
                    K.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,0)
                end
                local U = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude
                local z = game:service("TweenService")
                local B = TweenInfo.new((p.Position-game.Players.LocalPlayer.Character.Root.Position).Magnitude/300,Enum.EasingStyle.Linear)
                local S,g = pcall(function()
                local q = z:Create(game.Players.LocalPlayer.Character.Root,B,{CFrame = p})
                q:Play()
            end)
            if not S then 
                return g
            end
            game.Players.LocalPlayer.Character.Root.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                if S and game.Players.LocalPlayer.Character:FindFirstChild("Root") then 
                    pcall(function()
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude >= 20 then 
                            spawn(function()
                                pcall(function()
                                    if (game.Players.LocalPlayer.Character.Root.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 150 then 
                                        game.Players.LocalPlayer.Character.Root.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                    else 
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.Players.LocalPlayer.Character.Root.CFrame
                                    end
                                end)
                            end)
                        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude >= 10 and(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude < 20 then 
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
                        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude < 10 then 
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
                        end
                    end)
                end
            end)
        end)
    end

M:AddButton("Pull Lever", Callback = function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(28576.4688,
            14939.2832,
            76.5164413,
            -1,
            0,
            0,
            0,
            0.707134247,
            -0.707079291,
            -0,
            -0.707079291,
            -0.707134247)}):Play()
        end)

local M = Window:MakeTab({
	Name = "RACE ",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

M:AddToggle({
	Name = "Complet Trial",
	Default = false,
	Callback = function(Value)
		_G.AutoQuestRace = Value
	end    
})

local FullMoon = M:AddLabel({
    Name = "Check Moon Status Work Sea 3"
})

        task.spawn(function()
            while task.wait() do
                pcall(function()
                    if game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149431" then
                        FullMoon:Set("🌑 : Full Moon 100%")
                    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149052" then
                        FullMoon:Set("🌒 : Full Moon 75%")
                    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709143733" then
                        FullMoon:Set("🌓 : Full Moon 50%")
                    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709150401" then
                        FullMoon:Set("🌗 : Full Moon 25%")
                    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149680" then
                        FullMoon:Set("🌖 : Full Moon 15%")
                    else
                        FullMoon:Set("🌚 : Full Moon 0%")
                    end
                end)
            end
        end)

OrionLib:Init()
