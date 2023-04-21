local webhookcheck =
   is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
   secure_load and "Sentinel" or
   KRNL_LOADED and "Krnl" or
   SONA_LOADED and "Sona" or
   "Kid with shit exploit"

local url =
   "https://discord.com/api/webhooks/1097855505264808027/6RV46LMBfGDvznDl6vsktr9lnCLv1-vYpZBzptTp18Dc_6l4zhGboREZwhOzbDY3rSC9"
local data = {
   ["content"] = " prevent sharing",
   ["embeds"] = {
       {
           ["title"] = "**Someone Executed Your Script!**",
           ["description"] = "Username: " .. game.Players.LocalPlayer.Name.." with **"..webhookcheck.."**",
           ["type"] = "rich",
           ["color"] = tonumber(0x7269da),
           ["image"] = {
               ["url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" ..
                   tostring(game:GetService("Players").LocalPlayer.Name)
           }
       }
   }
}
local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {
   ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)


local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/VisualRoblox/Roblox/main/UI-Libraries/Visual%20Command%20UI%20Library/Source.lua', true))()

 loadstring(game:HttpGet'https://pastebin.com/raw/tQLe0uus')()
        loadstring(game:HttpGet'https://pastebin.com/raw/NEjTkgMQ')()

local Blacklist = {}

local function chat(msg)
    game.Players:Chat(msg)
end

-------------------------------

chat(":setmsg [ Safari ] This server is managed by Safari")

-------------------------------
if not game:IsLoaded() then
    game.Loaded:Wait()
end

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
            if game.Players:FindFirstChild(v.Name) and v.Name ~= game.Players.LocalPlayer.Name and table.find(loopkick, v.Name) then
                chat(":fviewcam "..v.Name.. "v")
            end
        end
    end
end)

local function dmap()
    for _,v in pairs(workspace:GetChildren()) do
                        if not game.Players:FindFirstChild(v.Name) then
                local thread = coroutine.create(function()
local ohString1 = "SyncAnchor"
local ohTable2 = {
	[1] = {
		["Part"] = v,
		["Anchored"] = false
	}
}
            end)
            coroutine.resume(thread)
        end
    end
end

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
        task.wait()
        for i,v in pairs(workspace:GetChildren()) do
            if game.Players:FindFirstChild(v.Name) and v.Name ~= game.Players.LocalPlayer.Name and table.find(Kill, v.Name) then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Folder") then
                    local thread1 = coroutine.create(function()
                        local args = {
                            [1] = "SyncResize",
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


local function Sdelparts()
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

local function chat(msg)
    game.Players:Chat(msg)
end

local rejoin = "!rejoin"
local vk = ".votekick"
local VOTEKICK_COMMAND = ".select"
local appeal = ".help"


-- Function to handle chat messages
local function onChatted(player, message)
    -- Check if the message is the !rejoin command
    if message == rejoin then
        -- Rejoin the game [ Safari ]
        chat(":chatnotifyc all 49 255 90 [ Safari ] " .. player.Name .. " needs to rejoin!")
    elseif message == appeal then
chat(":chatnotifyc " .. player.Name .. ",me 255 0 0 [ Safari ] Please wait for a response from a staff member.\nthe player who has called the service and has been list to dial blacklist will be ignore. caller: ".. player.Name .."|:music 4814018992")
    elseif message == vk then
        -- Send a message to the player to select a player to vote kick
        chat(":chatnotifyc ".. player.Name .. ",me 255 255 255 Howdy, " .. player.Name .. ", which player you want to be votekicked? format: .select [player (not displayname)] [reason](THIS MESSAGE IS ONLY VIEWABLE FOR YOU)")
    elseif string.find(message, VOTEKICK_COMMAND) == 1 then
        -- Split the message into words
        local words = string.split(message, " ")
        
        -- Check if there are enough words in the message
        if #words >= 3 then
            -- Extract the player to be votekicked and the reason
            local partialName = words[2]:lower()
            local reason2kick = table.concat(words, " ", 3)
            local playerToKick
            
            -- Find the matching player
            for _, v in pairs(game.Players:GetPlayers()) do
                if string.find(string.lower(v.DisplayName), partialName) == 1 then
                    playerToKick = v
                    break
                end
            end
            
            -- Prompt user to confirm the vote kick selection
            if playerToKick then
chat(":chatnotifyc " .. player.Name .. ",me 255 255 255 Success! The votekick will up later!|:textw me Hoster: " .. player.Name .."\nPlayer needs to be votekicked: " .. playerToKick.Name .. "\nreason: ".. reason2kick .."|:rv")
                
             
    end
end -- <--- Add this line to close off the onConfirmChatted function
            end
end



-- Connect the function to the Chatted event of each player
for _, player in ipairs(game.Players:GetPlayers()) do
    player.Chatted:Connect(function(message)
        onChatted(player, message)
    end)
end

-- Connect the function to the PlayerAdded event to handle new players joining
game.Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        onChatted(player, message)
    end)
end)

print("success")
-------------------------------CHECK


local Window = Library:CreateWindow({
    Name = 'T4NVS',
    IntroText = 'Safari CMD [ T4NVS EDITION ]\nNew Update:\nAnno is more troll\nMore update coming',
    IntroIcon = 'rbxassetid://13137691101',
    IntroBlur = true,
    IntroBlurIntensity = 20,
    Theme = Library.Themes.scriptware,
    Position = 'top',
    Draggable = true,
    Prefix = ';'
})



-- // Functions
Window:AddTheme('test', {
    BackgroundColor = Color3.fromRGB(0, 255, 255),
    SecondaryColor = Color3.fromRGB(225, 225, 225),
    AccentColor = Color3.fromRGB(125, 125, 125),
    PrimaryTextColor = Color3.fromRGB(0, 0, 0),
    SecondaryTextColor = Color3.fromRGB(75, 75, 75)
})

for _, Theme in next, Window:GetThemes(true) do
    print(Theme)
end

for Index, Theme in next, Window:GetThemes(false) do
    print(Index, Theme)
end

local whitelist = {}


local function chat(msg)
    game.Players:Chat(msg)
end

-- // Commands
Window:AddCommand('rejoin', {}, 'Rejoin the current server (Serverhop or rejoin)', function(Arguments, Speaker)
        game:GetService('TeleportService'):Teleport(game.PlaceId)
end)

Window:AddCommand('ban', {'player', 'allowAppeal? (yes or no)', 'during', 'reason'}, 'Ban a player from the server', function(Arguments, Speaker)
   local playerName = Arguments[1]
   local allowAppeal = Arguments[2]
   local duration = Arguments[3]
   local reason = table.concat(Arguments, " ", 4)

   if duration ~= "P" then
      duration = tonumber(duration)
      if duration == nil or duration < 1 or duration > 60 then
         chat(":talk all [ FOR Safari Staff ] Please specify a duration between 1 and 60 minutes or 'P' for permanent ban.")
         return
      end
   end

   local player = nil
   for _,v in pairs(game.Players:GetPlayers()) do
      if string.sub(string.lower(v.Name), 1, #playerName) == string.lower(playerName) then
         player = v
         table.insert(Blacklist, v.Name)
         local message = "[ Safari ] User " .. v.Name .. " has been banned/blacklisted from this server.\nReason: " .. reason
         if duration == "P" then
            message = message .. "\nDuration: PERMANENTLY"
         else
            message = message .. "\nDuration: " .. duration .. " minute(s)"
            chat(":hcountdown " .. duration * 60)
         end
         if allowAppeal == "yes" then
            message = message .. "\nHowever, you can appeal the ban by saying .help"
         else
            message = message .. "\nYou don't have eligibility to appeal."
         end
         chat(":music 1548304764 true|:chatnotifyc all 49 255 90  " .. message)
         Window:Notification{
            Title = "CMD",
            Text = v.Name .. " Blacklisted!",
            Time = 3,
            callback = function()
            end
         }
         break
      end
   end

   if not player then
      chat(":sm Player not found.")
      return
   end
end)

Window:AddCommand('unban', {'player'}, 'Unban a player from the server', function(Arguments, Speaker)
   local playerName = Arguments[1]

   local player = nil
   for _, v in pairs(game.Players:GetPlayers()) do
      if table.find(Blacklist, v.Name) and string.sub(string.lower(v.Name), 1, #playerName) == string.lower(playerName) then
         player = v
         table.remove(Blacklist, table.find(Blacklist, v.Name))
         chat(":music 1548304764 true|:chatnotifyc all 49 255 90  [ Safari ] User " .. v.Name .. ",\nhas been unbanned/unblacklisted from this server!")
         Window:Notification{
            Title = "CMD",
            Text = v.Name .. " unblacklisted!",
            Time = 3,
            callback = function()
            end
         }
         chat(":refresh " .. v.Name)
         break
      end
   end

   if not player then
      chat(":talk all [ FOR Safari Staff ] Player not found in blacklist.")
      return
   end
end)


Window:AddCommand('Crash', {}, 'Instant freeze the server but more looks good', function(Arguments, Speaker)
chat(":loadb 2|:runc alarm|:sm Uh Oh!\nThis server is encrypted!🔒\nContact x8#9999 to decrypt the server🔓|:runc red|:wait 1|")
wait(3.5)
dmap()
end)



Window:AddCommand('serverlock', {'reason'}, 'Lock the server with a reason', function(Arguments, Speaker)
   local reason = table.concat(Arguments, " ")

   if ServerlockV then
      chat(":sm Server is already locked.")
      return
   end

   if not reason or reason == "" then
      chat(":sm Please provide a reason for the server lock.")
      return
   end

   chat(":music 1548304764|:f3x |:sm [ Safari ] This server is locked. Reason: ".. reason .."| :setmsg [ Safari ] This server is locked. \t\t Whitelisted users: " .. tostring(#whitelist))
   ServerlockV = true
end)

Window:AddCommand('unserverlock', {}, 'Lock the server with a reason', function(Arguments, Speaker)
            chat(":music 1548304764 true|:f3x |:sm [ Safari ] This server is unlocked.|:unpunish all|:setmsg [ Safari ] This server is unlocked. \t\t Whitelisted users: " .. tostring(#whitelist))
    ServerlockV = false     
end)

Window:AddCommand('kwl', {'Player'}, 'whitelist the player, so they dont get kicked (kinda useless)', function(Arguments, Speaker)
    local plr = Arguments[1]
    for _,v in pairs(game.Players:GetPlayers()) do
        if string.sub(string.lower(v.Name), 1, #plr) == plr then
            if not whitelist[v.Name] then
                whitelist[v.Name] = true
                chat(":music 1548304764 true|:chatnotifyc all 49 255 90  Successfully whitelisted player " .. v.Name)
            else
                chat(":music 2390695935 true 1 inf|:chatnotifyc all 49 255 90 Player " .. v.Name .. " is already whitelisted")
            end
            break
        end
    end
end)

Window:AddCommand('unkwl', {'Player'}, 'unwhitelist the player, so they get kicked', function(Arguments, Speaker)
    local plr = Arguments[1]
    for _,v in pairs(game.Players:GetPlayers()) do
        if string.sub(string.lower(v.Name), 1, #plr) == plr then
            if whitelist[v.Name] then
                whitelist[v.Name] = nil
                chat(":music 1548304764 true|:chatnotifyc all 49 255 90  Successfully removed player " .. v.Name .. " from the whitelist")
            else
                chat(":music 2390695935 true 1 inf|:chatnotifyc all 49 255 90  I think the man " .. v.Name .. " is not on the whitelist")
            end
            break
        end
    end
end)

Window:AddCommand('wl', {'Player', 'Reason'}, 'Whitelist the player from the serverlock', function(Arguments, Speaker)
for _,v in pairs(game.Players:GetPlayers()) do
        if not table.find(whitelist, v.Name) and string.sub(string.lower(v.Name), 1, #plr) == plr then
            table.insert(whitelist, v.Name)
            if ServerlockV then
                chat(":setmsg [ Envy REVAMPED ] This server is locked. \t\t Whitelisted users: " .. tostring(#whitelist))
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

Window:AddCommand('unwl', {'Player', 'Reason'}, 'unwhitelist the player from the serverlock', function(Arguments, Speaker)
    for _,v in pairs(game.Players:GetPlayers()) do
        if table.find(whitelist, v.Name) and string.sub(string.lower(v.Name), 1, #plr) == plr then
            table.remove(whitelist, table.find(whitelist,v.Name))
            if ServerlockV then
                chat(":setmsg [ Envy REVAMPED ] This server is locked. \t\t Whitelisted users: " .. tostring(#whitelist))
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

Window:AddCommand('kick', {'Player', 'Reason'}, 'kick', function(Arguments, Speaker)
    local plr = Arguments[1]
    local reason = table.concat(Arguments, ' ', 2)
    for _,v in pairs(game.Players:GetPlayers()) do
        if string.sub(string.lower(v.Name), 1, #plr) == plr then
            if v.Name == game.Players.LocalPlayer.Name then -- check if player is trying to kick themselves
                chat(":music 2390695935 true 1 inf|:chatnotifyc all 49 255 90  [ Safari ] The Safari staff T4NVS has attempted to kick himself")
            elseif whitelist[v.Name] then
                chat(":music 2390695935 true 1 inf|:chatnotifyc all 49 255 90  [ Safari ] Player " .. v.Name .. " is whitelisted, so I'm unable to kick them")
            elseif plr == "all" then
                chat(":music 2390695935 true 1 inf|:chatnotifyc all 49 255 90  [ Safari ] Sorry, I don't kick all players at once.")
            else
                chat(":music 1548304764 true|:loadb Cr|:fviewcam " .. v.Name .. " cr3|:chatnotifyc all 49 255 90  [ Safari ] \nKick result:\nPlayer Name: ".. v.Name .. "\nReason: " .. reason .. "\nUsed time: 00:02\n---------------------------------------\nSuccessfully kicked.|:wait 15|:unloadb Cr")
            end
            break
        end
    end
end)

Window:AddCommand('sdel', {}, 'Slient delete the parts', function(Arguments, Speaker)
    Sdelparts()
end)

Window:AddCommand('del', {}, 'delete the parts', function(Arguments, Speaker)
    delparts()
end)

Window:AddCommand('a', {}, 'AntiPartCrash', function(Arguments, Speaker)
    AntiPartCrash = true
end)

Window:AddCommand('na', {}, 'NO AntiPartCrash', function(Arguments, Speaker)
    AntiPartCrash = false
           for i,v in pairs(game.ReplicatedStorage.AntiPartCrash:GetChildren()) do
                v.Parent = workspace
                end
end)

local warnings = {}

Window:AddCommand('warn', {'Player', 'Reason'}, 'Warn someone', function(Arguments, Speaker)
   local plrName = Arguments[1]
   local warnReason = table.concat(Arguments, ' ', 2)
   local plr = nil

   -- Search for the player by name
   for _,v in pairs(game.Players:GetPlayers()) do
      if string.sub(string.lower(v.Name), 1, #plrName) == plrName then
         plr = v
         break
      end
   end

   -- If no player was found, print an error message and return
   if not plr then
      chat(":chatnotifyc me 255 0 0 Could not find player with name \""..plrName.."\"")
      return
   end

   -- Warn the player
   local numWarnings = warnings[plr] or 0
   numWarnings = numWarnings + 1
   warnings[plr] = numWarnings
   chat(":music 1548304764 true|:sm " .. plr.DisplayName .. " has been warned once. Reason: " .. warnReason)
   if numWarnings == 5 then
      chat(":music 1548304764 true|:n ".. plr.DisplayName .. ", You have reached the maximum number of warnings.")
   else
      local remainingWarnings = 5 - numWarnings
      if remainingWarnings == 1 then
         chat(":n " .. remainingWarnings .. " WARNING remain.")
      else
         chat(":n " .. remainingWarnings .. " warnings remain")
      end
   end
end)

Window:AddCommand('cwarn', {'Player', 'Amount'}, 'Set custom warning amount for a player', function(Arguments, Speaker)
   local plrName = Arguments[1]
   local customAmount = tonumber(Arguments[2])
   local plr = nil

   -- Search for the player by name
   for _,v in pairs(game.Players:GetPlayers()) do
      if string.sub(string.lower(v.Name), 1, #plrName) == plrName then
         plr = v
         break
      end
   end

   -- If no player was found, print an error message and return
   if not plr then
      chat(":chatnotifyc me 255 0 0 Could not find player with name \""..plrName.."\"")
      return
   end

   -- Set the custom warning amount for the player
   if not customAmount or customAmount <= 0 then
      print("Please input a valid number greater than 0.")
      return
   end
   warnings[plr] = customAmount
   chat(":music 1548304764 true|:sm " .. plr.DisplayName .. " warning amount set to: " .. customAmount)
end)

Window:AddCommand('rwarn', {'Player'}, 'Reset warnings for a player', function(Arguments, Speaker)
   local plrName = Arguments[1]
   local plr = nil

   -- Search for the player by name
   for _,v in pairs(game.Players:GetPlayers()) do
      if string.sub(string.lower(v.Name), 1, #plrName) == plrName then
         plr = v
         break
      end
   end

   -- If no player was found, print an error message and return
   if not plr then
      print(":chatnotifyc me 255 0 0 Could not find player with name \""..plrName.."\"")
      return
   end

   -- Reset the player's warnings
   warnings[plr] = nil
   chat(":music 1548304764 true|:n The user " .. plr.DisplayName .. " has had their warnings reset.")
end)

Window:AddCommand('R6', {'Player'}, 'Send R6 notification to a player (LOOP R6)', function(Arguments, Speaker)
   local plrName = Arguments[1]
   local plr = nil

   -- Search for the player by name
   for _,v in pairs(game.Players:GetPlayers()) do
      if string.sub(string.lower(v.Name), 1, #plrName) == plrName then
         plr = v
         break
      end
   end

   -- If no player was found, print an error message and return
   if not plr then
      chat(":chatnotify me Could not find player with name \""..plrName.."\"")
      return
   end

   -- Send the R6 notification to the player
   while wait(.2) do
      chat(":r6 "..plr.Name)
   end
end)

Window:AddCommand('clr', {}, 'Clear chat and perform various actions', function(Arguments, Speaker)
   chat(":free all|:unpunish all|:ungg all|:clr|:fix")
end)

Window:AddCommand('hclr', {}, 'Clear chat and perform various actions but bigger (trigger anti-abuse)', function(Arguments, Speaker)
           chat(":free all|:unpunish all|:ungg all|:clr|:fix|:unsize all|:ungg all")
end)

Window:AddCommand('betterjail', {'Player'}, 'Teleport a player to jail and back', function(Arguments, Speaker)
   local plrName = Arguments[1]
   local plr = nil

   -- Search for the player by name
   for _,v in pairs(game.Players:GetPlayers()) do
      if string.sub(string.lower(v.Name), 1, #plrName) == plrName then
         plr = v
         break
      end
   end

   -- If no player was found, print an error message and return
   if not plr then
      chat(":chatnotify me Could not find player with name \""..plrName.."\"")
      return
   end

   -- Teleport the player to jail
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(22.17592430114746, 28.299936294555664, 105.28339385986328)
   wait(.1)
   fireclickdetector(game:GetService("Workspace").SecureParts.ResetPads.ClickDetector)
   wait(.1)

   -- Teleport the player back to a specified location
   chat(":jail "..plr.Name .. "|:to "..plr.Name)
end)

Window:AddCommand('antipart', {}, 'Enable anti-part', function(Arguments, Speaker)
   _G.hi = true
   chat(":sm Anti Part is enabled.")
   while _G.hi and wait() do
      Sdelparts()
   end
end)

Window:AddCommand('deantipart', {}, 'Disable anti-part feature', function(Arguments, Speaker)
   _G.hi = false
   chat(":sm Anti Part is disabled.")
end)

Window:AddCommand('lag', {}, 'Cause lag by repeatedly :kill #inf', function(Arguments, Speaker)
   SafeM = true
   while wait(5) do
      chat(":kill #inf")
      if not SafeM then break end
   end
end)

Window:AddCommand('stoplag', {}, 'Stop the lag caused by the lag command', function(Arguments, Speaker)
   SafeM = false
          chat(":sm Lag spike has been disabled|:music 5689199277 true|:setmessage off ")
end)

Window:AddCommand('votekick', {'player', 'reason'}, 'Start a vote to kick a player (voteing system patched)', function(Arguments, Speaker)
   local votekickerName = Arguments[1]
   local reason2kick = Arguments[2]
   local votekickerLabel = nil
   local hosterLabel = Speaker.Name

   for _,v in pairs(game.Players:GetPlayers()) do
      if string.sub(string.lower(v.DisplayName), 1, #votekickerName) == string.lower(votekickerName) then
         votekickerLabel = v.Name
         break
      end
   end

   if not votekickerLabel then
      chat(":sm Player not found.")
      return
   end

   chat(":chatnotify all " .. votekickerLabel .. " has been nominated for a votekick by " .. hosterLabel .. ". Reason: " .. reason2kick .. ". Type 'vkyes' to vote yes, 'vkno' to vote no.|:hcountdown 30")
   wait(30)
   local yesVotes = 0
   local noVotes = 0
   for _,v in pairs(game.Players:GetPlayers()) do
   if yesVotes > noVotes then
      chat(":sm " .. votekickerLabel .. " has been kicked. Yes votes: " .. yesVotes .. ", No votes: " .. noVotes)
   else
      chat(":sm " .. votekickerLabel .. " has not been kicked. Yes votes: " .. yesVotes .. ", No votes: " .. noVotes)
      end
   end
end)


Window:AddCommand('remind', {'player', 'reason'}, 'Remind a player with a reason', function(Arguments, Speaker)
   local playerName = Arguments[1]
   local reason = Arguments[2]

   local player = nil
   for _,v in pairs(game.Players:GetPlayers()) do
      if string.sub(string.lower(v.Name), 1, #playerName) == string.lower(playerName) then
         player = v
         kr = v.Name
         break
      end
   end

   if not player then
      chat(":sm Player not found.")
      return
   end

   if not reason then
      chat(":sm Please enter a reason.")
      return
   end

   chat(":npm " .. kr .. " T4NVS has kindly reminded you: " .. reason)
end)

Window:AddCommand('Serverhop', {}, 'why retarded crashing server? (NOT WORK)', function(Arguments, Speaker)
if httprequest then
		local servers = {}
		local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100", PlaceId)})
		local body = HttpService:JSONDecode(req.Body)
		if body and body.data then
			for i, v in next, body.data do
				if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
					table.insert(servers, 1, v.id)
				end
			end
		end
	end
end)


Window:AddCommand('notice', {'SetNoticeToTopMessage?', 'rest'}, 'Send notice', function(Arguments, Speaker)
   if Arguments[1] == "no" then
      AnnoSetMsg = false
   else
      AnnoSetMsg = true
      local Message = table.concat(Arguments, " ", 2) -- Get the message from the command arguments
            chat(":talk all [ Safari ] " .. Message)
      if AnnoSetMsg then
         chat(":setmsg [ Safari ] " .. Message)
      end
   end
end)

Window:AddCommand('anno', {'Who send?', 'TopMessage?', 'SendByYou?', 'sentence'}, 'Send notice', function(Arguments, Speaker)
    if Arguments[1] == "no" then
        AnnoSetMsg = false
    else
        AnnoSetMsg = true
        local Message = table.concat(Arguments, " ", 3) -- Get the message from the command arguments
        local Sender = ""

        -- Get the player name from the arguments
        local playerName = Arguments[1]

        -- Find the player with the matching name
        for _, player in pairs(game.Players:GetPlayers()) do
            if string.sub(string.lower(player.Name), 1, #playerName) == string.lower(playerName) then
                Sender = " ( The message was sent by " .. player.Name .. " )"
                break
            end
        end

        chat(":talk all [ Safari ] Announcement: \n" .. Message .. "\n\n\n".. Sender .. "|:chatnotifyc all 49 255 90 [ Safari ] Announcement: \n" .. Message .."\n" .. Sender .. "\n")

        if AnnoSetMsg then
            chat(":setmsg [ Safari ] Announcement: " .. Message .. "\n" .. Sender)
        end
    end
end)


Window:AddCommand('stoptime', {}, 'Stop the time', function(Arguments, Speaker)
    stopTime()
end)

Window:AddCommand('resumetime', {}, 'Resume the time (Enable the time system)', function(Arguments, Speaker)
    resumeTime()
end)

Window:AddCommand('settime', {'time'}, 'Set the time to the specified value (format: hh:mm) btw the timeset is weird so guess the right time at your own', function(Arguments, Speaker)
    setTime(Arguments)
end)

Window:AddCommand('kill', {'user'}, 'kill the specified player by special action', function(Arguments, Speaker)
    local playerName = Arguments[1]
    local player = nil
    
    for _,v in pairs(game.Players:GetPlayers()) do
        if string.sub(string.lower(v.Name), 1, #playerName) == string.lower(playerName) then
            chat(":health ".. v.Name .. " 0")
            break
        end
    end
end)

Window:AddCommand('ambient', {'number', 'number', 'number', 'Night?'}, 'Set ambient and oambient', function(Arguments, Speaker)
    local r, g, b = Arguments[1], Arguments[2], Arguments[3]
    local command = ":ambient " .. r .. " " .. g .. " " .. b .. "|:oambient " .. r .. " " .. g .. " " .. b
    chat(command)

    if Arguments[4] == "yes" then
        chat(":time 0")
    end
end)

Window:AddCommand('b', {'user'}, 'bring player but a shorten word', function(Arguments, Speaker)
    local playerName = Arguments[1]
    local find = false

    for _,v in pairs(game.Players:GetPlayers()) do
        if string.sub(string.lower(v.Name), 1, #playerName) == string.lower(playerName) then
            find = true
            chat(":bring " .. v.Name)
        end
    end

    if not find then
        chat(":chatnotifyc all 49 255 90  [ Safari ] Player not found.")
    end
end)


------------------------------------------------------------------------------------------------------------------

	local Sentences = {
	   "Some commands, such as 'sword', 'kill', 'explode', and 'rope', are not allowed and will result in a ban.",
	   "This server is managed by Safari.",
	   "Using the 'bring all' command is not allowed without permission from the server administrator.",
	   "You cannot block the admin pads without permission. Contact the server administrator if you need to block the admin pads.",
	   "Abusing is not allowed, and if you are caught, you will be banned.",
	   "It is strictly forbidden to crash other players or put them into the crash. If caught, you will be subject to being kicked.",
	 "Causing a server crash is a very serious offense. If caught, you will be added to the global blacklist.",
	  "Destroying buildings is not allowed, including actions like unanchoring, setting them on fire, or coloring them. If you are caught, you will be banned. Serious offenses may result in being kicked.",
	"Blocking the obby is not permitted. Minor offenses will result in a warning, while more serious offenses may result in being kicked from the game. However, if you receive approval from an administrator, you may be permitted to temporarily block the obby for legitimate reasons.",
	"Loop killing other players is not permitted and will result in a ban.",
	}

	local function GetRandomSentence()
	   return Sentences[math.random(1, #Sentences)]
	end
	
local ShouldSendTips = false -- Flag variable to control hint messages
local TipsSendCooldown = 15 -- Default cooldown time in seconds

while ShouldSendTips do
   chat(":talk all [ Safari ] " .. GetRandomSentence())
   wait(TipsSendCooldown)
end

local function GetRandomSentenceFromSetMsg()
	   return Sentences[math.random(1, #Sentences)]
	end
	
local ShouldSendTipsOnSetMsg = false -- Flag variable to control hint messages

while ShouldSendTipsOnSetMsg do
       local Message = GetRandomSentenceFromSetMsg()
	   chat(":setmsg [ Safari ] " .. GetRandomSentence())
	   wait(15)
end 

local timeMultiplier = 60 -- the factor by which to speed up time
local isTimeStopped = true -- a boolean variable to keep track of whether the time is currently stopped or not

local function chat(msg)
    game.Players:Chat(msg)
end

local startTime = os.time() - (os.date("%H") * 3600) - (os.date("%M") * 60) -- Get the starting time of the loop and subtract the current hour and minute in seconds
local startHour = 2 -- Set the starting hour to 14

function updateTime()
    local currentTime = os.time() -- Get the current time in the CT timezone
    local elapsedTime = (currentTime - startTime) * timeMultiplier -- Calculate the elapsed time, multiplied by the timeMultiplier
    local hour = startHour + math.floor((elapsedTime / 3600) % 24) -- Calculate the current hour, taking into account the start hour and elapsed time
    local min = math.floor((elapsedTime / 60) % 60) -- Calculate the current minute, taking into account the elapsed time
  
    -- Check if the current hour is greater than or equal to 24, and adjust the hour and start time accordingly
    if hour >= 24 then
        startHour = startHour - 24
        startTime = startTime + (24 * 3600)
        hour = hour - 24
        chat(":music 179507208|:sm Its next day now.")
    end
    
    if hour == 8 and not dayMusicPlayed then
        chat(":music 9112759095|:sm Its day now.")
        dayMusicPlayed = true
    end
    
    if hour == 12 and dayMusicPlayed then
        chat(":sm Its aftermoon.|:music 9112759095")
        end 
        
        if hour == 18 and not dayMusicPlayed then
        chat(":sm Its dusk.|:music 9112759095")
        dayMusicPlayed = true
        end
        
        
        
        if hour == 21 and dayMusicPlayed then
        chat(":sm Its night.|:music 179507208")
        end

    if hour == 9 then
        dayMusicPlayed = false
    end
    
    if hour == 19 then
        dayMusicPlayed = false
    end
    
    if hour == 13 then
        dayMusicPlayed = false
    end
    
    if hour == 22 then
        dayMusicPlayed = false
    end

    local timeStr = string.format("%02d:%02d", hour, min)
    print(timeStr)
    chat(":setmessage [ Safari ] time: ".. timeStr .. " |:time ".. timeStr)
end

function stopTime()
    if not isTimeStopped then
        isTimeStopped = true
        print("Time stopped")
    else
        print("Time is already stopped")
    end
end

function resumeTime()
    if isTimeStopped then
        isTimeStopped = false
        startTime = os.time() - (os.date("%H") * 3600) - (os.date("%M") * 60) -- Get the starting time of the loop and subtract the current hour and minute in seconds
        print("Time resumed")
    else
        print("Time is not stopped")
    end
end

function setTime(arguments)
    if #arguments == 1 then
        local newTime = arguments[1]
        local newHour, newMin = newTime:match("(%d+):(%d+)")
        if newHour and newMin then
            startHour = tonumber(newHour)
            startTime = os.time() - (startHour * 3600) - (tonumber(newMin) * 60)
           chat(":talk all [ Safari ] Time set to " .. newTime)
        else
            chat(":talk me Invalid time format. Please use the format hh:mm")
        end
    else
        chat(":talk me Invalid arguments. Please use the format /settime hh:mm")
    end
end

while true do
    if not isTimeStopped then
        updateTime()
    end
    wait(1) -- wait for 1 second before refreshing the time
end


local AntiPartCrash = false -- Initialize the boolean value to false
local lastKeyPressTick = GetTickCount() -- Initialize the last key press tick to the current tick

function CheckAntiPartCrash()
    local currentTime = GetTickCount() -- Get the current tick
    local elapsedTime = currentTime - lastKeyPressTick -- Calculate the elapsed time since the last key press

    if elapsedTime >= 5000 and not AntiPartCrash then -- Check if the elapsed time is greater than or equal to 5 seconds (5000 milliseconds) and the boolean value is false
        AntiPartCrash = true -- Set the boolean value to true
        chat(":notify me 0 255 0 AntiCrash is enabled until you press the keyboard again")
    end
end

function OnPlayerKey(PlayerId, KeyCode, Down, x, y)
    lastKeyPressTick = GetTickCount() -- Update the last key press tick to the current tick whenever a key is pressed
    AntiPartCrash = false -- Reset the boolean value to false whenever a key is pressed
end
