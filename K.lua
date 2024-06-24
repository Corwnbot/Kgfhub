if game.Place.Id = 15705682243 then
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local Window = OrionLib:MakeWindow({Name = "KGF TAP HUB", HidePremium = false, SaveConfig = true, ConfigFolder = "KGFHUB"})
    -- Vlaues
    getgenv().Tap = true
    getgenv().reb = true

    --Functions
    function tap()
        while getgenv().Tap = true do
            game:GetService("ReplicatedStorage")["SSG Framework"].Shared.Network.tap:FireServer()
            task.wait(0)
        end
    end

    function r()
        while getgenv().reb = true do
            game:GetService("ReplicatedStorage")["SSG Framework"].Shared.Network.rebirth:InvokeServer()
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

    -- Toggles
    AutoFarm:AddToggle({
        Name = "Auto Tap",
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

    OrionLib:Init()
end
