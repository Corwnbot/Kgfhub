-- Define the global settings table if not already defined
_G.Setting_table = _G.Setting_table or {}
_G.Setting_table.Weapon = _G.Setting_table.Weapon or ""
_G.Setting_table.Farm_Bone = _G.Setting_table.Farm_Bone or false
_G.Setting_table.Farm_Random_S = _G.Setting_table.Farm_Random_S or false
if _G.Setting_table.FastAttack_Mode == nil then
    _G.Setting_table.FastAttack_Mode = "Fast"
end

-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KGF hub"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a main frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.3, 0, 0.6, 0)  -- Adjust size as needed
mainFrame.Position = UDim2.new(0.35, 0, 0.2, 0)  -- Adjust position as needed
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = true
mainFrame.Parent = screenGui

-- Function to create a label
local function createLabel(text, position, parent)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.9, 0, 0.1, 0)
    label.Position = position
    label.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Text = text
    label.Parent = parent
end

-- Function to create a toggle button
local function createToggleButton(name, text, position, parent, callback)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(0.9, 0, 0.1, 0)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = text
    button.Parent = parent

    local isActive = false

    button.MouseButton1Click:Connect(function()
        isActive = not isActive
        callback(isActive)
        button.BackgroundColor3 = isActive and Color3.fromRGB(70, 130, 180) or Color3.fromRGB(50, 50, 50)
    end)
end

-- Function to create a button to toggle GUI visibility
local function createVisibilityButton(name, text, position, parent, guiToToggle)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(0.1, 0, 0.05, 0)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = text
    button.Parent = parent

    local isVisible = true

    button.MouseButton1Click:Connect(function()
        isVisible = not isVisible
        guiToToggle.Visible = isVisible
    end)
end

-- Create a button to toggle GUI visibility
createVisibilityButton("ToggleGuiButton", "KGFhub[BETA]", UDim2.new(0.9, 0, 0, 0), screenGui, mainFrame)

-- Populate weapon list
local weaponList = {}
for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
    if v:IsA("Tool") then
        table.insert(weaponList, v.Name)
    end
end
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
    if v:IsA("Tool") then
        table.insert(weaponList, v.Name)
    end
end

local Select_W = General_Tab:Dropdown("Select Weapon", _G.Setting_table.Weapon, weaponList, function(selectedWeapon)
    _G.Setting_table.Weapon = selectedWeapon
    Update_Setting(getgenv()['MyName'])
end)

-- Refresh weapon list button
General_Tab:Button("Refresh Weapon", function()
    Select_W:Clear()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
        if v:IsA("Tool") then
            Select_W:Add(v.Name)
        end
    end
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
        if v:IsA("Tool") then
            Select_W:Add(v.Name)
        end
    end
end)

-- Fast Attack
General_Tab:Toggle("Fast Attack ","9606294253",_G.Setting_table.FastAttack,function(vu)
    _G.Setting_table.FastAttack = vu
    Update_Setting(getgenv()['MyName'])
end)
spawn(function()
    while wait(.5) do
        pcall(function()
            if _G.Setting_table.FastAttack then
                repeat wait(_G.Fast_Delay)
                    AttackNoCD()
                until not _G.Setting_table.FastAttack
            end
        end)
    end
end)
General_Tab:Dropdown("FastAttack","Fast",MIo,function(vu)
    _G.Setting_table.FastAttack_Mode = vu
    Update_Setting(getgenv()['MyName'])
    if _G.Setting_table.FastAttack_Mode == "Fast" then
        _G.Fast_Delay = 0.1
    elseif _G.Setting_table.FastAttack_Mode == "Smooth" then
        _G.Fast_Delay = 0.3
    elseif _G.Setting_table.FastAttack_Mode == "Super Fast" then
        _G.Fast_Delay = 0
    end
end)

-- Create Farm Bone section
createLabel("Farm Bone", UDim2.new(0.05, 0, 0.05, 0), mainFrame)
createToggleButton("AutoFarmBone", "Auto Farm Bone", UDim2.new(0.05, 0, 0.15, 0), mainFrame, function(isActive)
    Auto_Farm_Bone = isActive
    _G.Setting_table.Farm_Bone = isActive
    Update_Setting(getgenv()['MyName'])
end)

-- Create Random Surprise section
createLabel("Random Surprise", UDim2.new(0.05, 0, 0.35, 0), mainFrame)
createToggleButton("AutoBuyRandomSurprise", "Auto Buy Random Surprise", UDim2.new(0.05, 0, 0.45, 0), mainFrame, function(isActive)
    Farm_Random_S = isActive
    _G.Setting_table.Farm_Random_S = isActive
    Update_Setting(getgenv()['MyName'])
end)

-- Auto Farm Bone Logic
spawn(function()
    while wait(0.5) do
        pcall(function()
            if Auto_Farm_Bone then
                if not Mix_Farm then
                    local enemy = game.Workspace.Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]")
                    if enemy then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                        for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == "Reborn Skeleton [Lv. 1975]" and v.Humanoid.Health > 0 then
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                _G.PosMon = v.HumanoidRootPart.CFrame
                                StatrMagnet = true
                                repeat
                                    wait(_G.Fast_Delay)
                                    EquipWeapon(_G.Setting_table.Weapon)
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
                                    AttackNoCD()
                                until v.Humanoid.Health <= 0 or not v.Parent or Mix_Farm or not Auto_Farm_Bone
                                StatrMagnet = false
                            end
                        end
                    elseif game.ReplicatedStorage:FindFirstChild("Reborn Skeleton [Lv. 1975]") then
                        TP(game.ReplicatedStorage:FindFirstChild("Reborn Skeleton [Lv. 1975]").HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                    else
                        for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if not string.find(v.Name, "Boss") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                _G.PosMon = v.HumanoidRootPart.CFrame
                                StatrMagnet = true
                                repeat
                                    wait(_G.Fast_Delay)
                                    EquipWeapon(_G.Setting_table.Weapon)
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
                                    AttackNoCD()
                                until v.Humanoid.Health <= 0 or not v.Parent or Mix_Farm or not Auto_Farm_Bone
                                StatrMagnet = false
                            end
                        end
                    end
                end
            end
        end)
    end
end)

-- Auto Buy Random Surprise Logic
spawn(function()
    while wait(0.5) do
        pcall(function()
            if Farm_Random_S then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
            end
        end)
    end
end)

-- Core logic functions
function AttackNoCD()
    if not Auto_Farm_Bounty and not Auto_Farm_Fruit or Mix_Farm then
        if not Auto_Raid then
            local AC = CbFw2.activeController
            for i = 1, 1 do 
                local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                    plr.Character,
                    {plr.Character.HumanoidRootPart},
                    60
                )
                local cac = {}
                local hash = {}
                for k, v in pairs(bladehit) do
                    if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                        table.insert(cac, v.Parent.HumanoidRootPart)
                        hash[v.Parent] = true
                    end
                end
                bladehit = cac
                if #bladehit > 0 then
                    local u8 = debug.getupvalue(AC.attack, 5)
                    local u9 = debug.getupvalue(AC.attack, 6)
                    local u7 = debug.getupvalue(AC.attack, 4)
                    local u10 = debug.getupvalue(AC.attack, 7)
                    local u12 = (u8 * 798405 + u7 * 727595) % u9
                    local u13 = u7 * 798405
                    (function()
                        u12 = (u12 * u9 + u13) % 1099511627776
                        u8 = math.floor(u12 / u9)
                        u7 = u12 - u8 * u9
                    end)()
                    u10 = u10 + 1
                    debug.setupvalue(AC.attack, 5, u8)
                    debug.setupvalue(AC.attack, 6, u9)
                    debug.setupvalue(AC.attack, 4, u7)
                    debug.setupvalue(AC.attack, 7, u10)
                    pcall(function()
                        if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
                            AC.animator.anims.basic[1]:Play(0.01,0.01,0.01)
                            game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                            game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                            game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "")
                        end
                    end)
                end
            end
        end
    end
    if Auto_Farm_Bounty or Auto_Farm_Fruit and not Mix_Farm then
        local Fast = getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))
        local Lop = Fast[2]
        Lop.activeController.timeToNextAttack = (-math.huge^math.huge*math.huge)
        Lop.activeController.attacking = false
        Lop.activeController.timeToNextBlock = 0
        Lop.activeController.humanoid.AutoRotate = 80
        Lop.activeController.increment = 3
        Lop.activeController.blocking = false
        Lop.activeController.hitboxMagnitude = 80
    end
end

spawn(function()
    while wait(.1) do
        pcall(function()
            if Auto_Farm then
                if not Mix_Farm then
                    if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        if _G.Farm_Boss then
                            _G.SelectBoss = nil
                            _G.Farm_Boss = nil
                            SelectMonster = nil
                            _G.Farm_Mon = nil
                            wait(1)
                        end
                        if _G.SelectBoss ~= nil and game.Workspace.Enemies:FindFirstChild(_G.SelectBoss) or _G.SelectBoss ~= nil and game.ReplicatedStorage:FindFirstChild(_G.SelectBoss) then
                            CheckQuestBoss()
                            repeat wait(.2)
                                TelePBoss(CFrameQBoss)
                                TP(CFrameQBoss)
                            until (CFrameQBoss.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, QuestLvBoss)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                            _G.Farm_Boss = true
                        elseif SelectMonster ~= nil then
                            CheckLevel2()
                            repeat wait(.2)
                                TelePBoss(CFrameQ)
                                TP(CFrameQ)
                            until (CFrameQ.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                            SelectMonster = nil
                            _G.Farm_Mon = nil
                        else
                            StatrMagnet = nil
                            CheckLevel2()
                            repeat wait(.2)
                                TelePBoss(CFrameQ)
                                TP(CFrameQ)
                            until (CFrameQ.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                        end
                    elseif game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        if _G.Farm_Boss then
                            if game.Workspace.Enemies:FindFirstChild(_G.SelectBoss) then
                                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                    if v.Name == _G.SelectBoss and v.Humanoid.Health > 0 then
                                        if v.Humanoid:FindFirstChild("Animator") then
                                            v.Humanoid.Animator:Destroy()
                                        end
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid.JumpPower = 0
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(5,5,5)
                                        StatrMagnet = nil
                                        repeat wait(_G.Fast_Delay)
                                            TelePBoss(CFrameQBoss)
                                            EquipWeapon(_G.Setting_table.Weapon)
                                            TP(v.HumanoidRootPart.CFrame*CFrame.new(0,30,50))
                                            AttackNoCD()
                                        until game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) or not v.Parent or v.Humanoid.Health <= 0 or not Auto_Farm or Mix_Farm
                                        if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        end
                                    end
                                end
                            else
                                TP(CFrameBoss*CFrame.new(0,30,0))
                                TelePBoss(CFrameBoss)
                            end
                        else
                            if game.Workspace.Enemies:FindFirstChild(Ms) then
                                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                    if v.Name == Ms and v.Humanoid.Health > 0 then
                                        _G.PosMon = v.HumanoidRootPart.CFrame
                                        StatrMagnet = true
                                        if v.Humanoid:FindFirstChild("Animator") then
                                            v.Humanoid.Animator:Destroy()
                                        end
                                        v.Humanoid:ChangeState(11)
                                        v.Humanoid.JumpPower = 0
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(5,5,5)
                                        repeat wait(_G.Fast_Delay)
                                            TelePBoss(CFrameQ)
                                            EquipWeapon(_G.Setting_table.Weapon)
                                            TP(v.HumanoidRootPart.CFrame*CFrame.new(0,30,10))
                                            AttackNoCD()
                                        until game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or not v.Parent or v.Humanoid.Health <= 0 or not Auto_Farm or Mix_Farm
                                        if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        end
                                        Attack = nil
                                    end
                                end
                            elseif game.ReplicatedStorage:FindFirstChild(Ms) then
                                TP(game.ReplicatedStorage:FindFirstChild(Ms).HumanoidRootPart.CFrame*CFrame.new(0,30,0))
                                TelePBoss(CFrameQ)
                            end
                        end
                    end
                end
            else
                wait(2)
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if StatrMagnet then
                if Auto_Farm then
                    if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == Ms and (v.HumanoidRootPart.Position-_G.PosMon.Position).Magnitude <= 350 then
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                v.Humanoid:ChangeState(11)
                                v.Humanoid.JumpPower = 0
                                v.Humanoid.WalkSpeed = 0
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(5,5,5)
                                v.HumanoidRootPart.CFrame = _G.PosMon
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
                                Attack = true
                            end
                        end
                    end
                else
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v.HumanoidRootPart.Position-_G.PosMon.Position).Magnitude <= 350 then
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            v.Humanoid:ChangeState(11)
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(5,5,5)
                            v.HumanoidRootPart.CFrame = _G.PosMon
                            sethiddenproperty(game.Players.LocalPlayer, "MaximumSimulationRadius",  math.huge)
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  9e20)
                        end
                    end
                end
            end
        end)
    end
end)

-- Helper functions to manage quests and teleportation
function CheckQuestBoss()
    -- Function logic to check and set the quest for boss farming
end

function CheckLevel2()
    -- Function logic to check and set the player's level and appropriate quest
end

function TelePBoss(cframe)
    -- Teleport to boss logic
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
end

function TP(cframe)
    -- General teleportation logic
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
end

function EquipWeapon(weapon)
    -- Equip the specified weapon
    local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(weapon)
    if tool then
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end

function GetCurrentBlade()
    -- Retrieve the currently equipped blade
    local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
    return tool and tool.Name or ""
end
