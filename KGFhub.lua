local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

local Window = redzlib:MakeWindow({
  Title = "redz Hub : Blox Fruits",
  SubTitle = "by redz9999",
  SaveFolder = "testando | redz lib v5.lua"
})
local Tab1 = Window:MakeTab({"Um", "cherry"})

Tab1:AddButton({"Dark Theme", function()
  redzlib:SetTheme("Dark")
end})

Window:SelectTab(Tab1)

getgenv().FastAttack

local function FastAttack()
  while getgenv().FastAttack do task.wait()
    pcall(function()
      local CF = debug.getupvalues(require(Player.PlayerScripts.CombatFramework))[2]
      local AC = CF.activeController
      if AC.increment ~= 3 then AC.increment = 3 end
      if AC.timeToNextAttack ~= 0 then AC.timeToNextAttack = 0 end
      if AC.timeToNextBlock ~= 0 then AC.timeToNextBlock = 0 end
      if AC.focusStart ~= 0 then AC.focusStart = 0 end
      if AC.attacking ~= false then AC.attacking = false end
      if AC.blocking ~= false then AC.blocking = false end
      if AC.humanoid.AutoRotate ~= true then AC.humanoid.AutoRotate = true end
      if AC.currentAttackTrack ~= 0 then AC.currentAttackTrack = 0 end
      sethiddenproperty(Player, "SimulationRaxNerous", math.huge)
    end)task.spawn(AttackHit)
  end
end

local Toggle1 = Tab1:AddToggle({
  Name = "Toggle 1",
  Description = "",
  Default = false
})

Toggle1:Callback(function(Value)
  getgenv().FastAttack = Value
  task.spawn(FastAttack)
end)
