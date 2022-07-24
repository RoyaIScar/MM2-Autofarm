-- mm2 autofarm by scartesu
-- updated to stop most fps drops
-- probably wont update again cus of how much i hate this or i will just remake in the future idk screw this

repeat wait() until game:IsLoaded()


game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "MM2 Automeme By Scartesu";
	Text = "autofarm started, go grab a coffee or water your plants idk ";
})

game.Players.LocalPlayer.Character:BreakJoints()

function automeme()

local counter = game.Players.LocalPlayer.PlayerGui.MainGUI.Game.CashBag.CoinIcon.Coins
local me = game.Players.LocalPlayer.Character
local rp = me.HumanoidRootPart
local called = false
local cooldown = 2.1
local endnow = false
if me ~= nil then
me.LowerTorso.Root:Destroy()
end
coroutine.resume(coroutine.create(function()
while wait(cooldown) do
    for _,v in pairs(game.workspace:GetDescendants()) do
        if v:FindFirstChild("CoinContainer") then
            called = true
            end
        end
        if called == true then
    
for _,v in pairs(game.workspace:GetDescendants()) do
    if v.Name == "Coin_Server" then
        rp.CFrame = v.CFrame + Vector3.new(0,3.5,0.5)
   end
end
if counter.Text == "40" then
me:BreakJoints()
         end
        end

 
 for _,v in pairs(game.workspace:GetDescendants()) do
     if not v:FindFirstChild("CoinContainer") then
        called = false
        else
        called = true -- assurance that it runs when round starts
    end
end


if endnow == true then -- stopping dead loops
    break
end

end



me.Humanoid.Died:connect(function()
    endnow = true
end)

end))
end


game.Players.LocalPlayer.CharacterAdded:connect(function()
    wait(5)
    automeme()
    
    for _,v in pairs(game.workspace:GetDescendants()) do
    if v:IsA("Model") and v:FindFirstChild("Map") then -- identify map ye
        v.ChildRemoved:Connect(function(coin)
            
            if coin.Name == "CoinContainer" then
                endnow = true
                
            end
        end)
        else
        repeat wait() until v:FindFirstChild("Map")
        v.ChildRemoved:Connect(function(coin)
            
            if coin.Name == "CoinContainer" then
                endnow = true
            end
        end)
    end
end

end)
for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
v:Disable()
end
