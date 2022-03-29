-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Loading = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local ImageLabel = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local Thanks = Instance.new("TextLabel")
local Name = Instance.new("TextLabel")
local Loading_2 = Instance.new("TextLabel")
local True = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Close = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Loading.Name = "Loading"
Loading.Parent = ScreenGui
Loading.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
Loading.Position = UDim2.new(0.34114337, 0, 0.226640165, 0)
Loading.Size = UDim2.new(0, 338, 0, 275)

UICorner.Parent = Loading

ImageLabel.Parent = Loading
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.Position = UDim2.new(0.352071017, 0, 0.181818187, 0)
ImageLabel.Size = UDim2.new(0, 100, 0, 100)
ImageLabel.Image = "http://www.roblox.com/asset/?id=7358272678"

UICorner_2.Parent = ImageLabel

Thanks.Name = "Thanks"
Thanks.Parent = Loading
Thanks.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Thanks.BackgroundTransparency = 1.000
Thanks.Position = UDim2.new(0.204142019, 0, 0.545454502, 0)
Thanks.Size = UDim2.new(0, 200, 0, 50)
Thanks.Font = Enum.Font.FredokaOne
Thanks.Text = "Thanks for using my script!"
Thanks.TextColor3 = Color3.fromRGB(0, 0, 0)
Thanks.TextScaled = true
Thanks.TextSize = 14.000
Thanks.TextWrapped = true

Name.Name = "Name"
Name.Parent = Loading
Name.BackgroundColor3 = Color3.fromRGB(144, 255, 231)
Name.BackgroundTransparency = 1.000
Name.BorderColor3 = Color3.fromRGB(99, 154, 194)
Name.Position = UDim2.new(0.204142019, 0, -2.04890966e-08, 0)
Name.Size = UDim2.new(0, 200, 0, 50)
Name.Font = Enum.Font.FredokaOne
Name.Text = "DxrkestCo's Hub"
Name.TextColor3 = Color3.fromRGB(55, 185, 181)
Name.TextScaled = true
Name.TextSize = 14.000
Name.TextWrapped = true

Loading_2.Name = "Loading"
Loading_2.Parent = Loading
Loading_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Loading_2.BackgroundTransparency = 1.000
Loading_2.Position = UDim2.new(0.0798816606, 0, 0.75272727, 0)
Loading_2.Size = UDim2.new(0, 284, 0, 25)
Loading_2.Font = Enum.Font.FredokaOne
Loading_2.Text = "Are you sure to loading the script?"
Loading_2.TextColor3 = Color3.fromRGB(255, 1, 1)
Loading_2.TextScaled = true
Loading_2.TextSize = 14.000
Loading_2.TextStrokeColor3 = Color3.fromRGB(144, 9, 0)
Loading_2.TextWrapped = true

True.Name = "True"
True.Parent = Loading
True.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
True.BorderSizePixel = 0
True.Position = UDim2.new(0.204142019, 0, 0.843636334, 0)
True.Size = UDim2.new(0, 200, 0, 36)
True.Font = Enum.Font.PatrickHand
True.Text = "True"
True.TextColor3 = Color3.fromRGB(0, 0, 0)
True.TextScaled = true
True.TextSize = 14.000
True.TextWrapped = true
True.MouseButton1Down:connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaQax/WTF/main/Hub/main.lua",true))()
end)


UICorner_3.Parent = True

Close.Name = "Close."
Close.Parent = Loading
Close.BackgroundColor3 = Color3.fromRGB(136, 136, 136)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.87869823, 0, 0.0254545454, 0)
Close.Size = UDim2.new(0, 31, 0, 31)
Close.Font = Enum.Font.PatrickHand
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(0, 0, 0)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextWrapped = true

UICorner_4.Parent = Close

-- Scripts:

local function UJGMVGQ_fake_script() -- True.LocalScript 
	local script = Instance.new('LocalScript', True)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Visible = false
	end)
	
end
coroutine.wrap(UJGMVGQ_fake_script)()
local function TVGRF_fake_script() -- Close.LocalScript 
	local script = Instance.new('LocalScript', Close)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Visible = false
	end)
	
end
coroutine.wrap(TVGRF_fake_script)()

Loading = script.Parent.Frame
Loading.Draggable = true
Loading.Active = true
Loading.Selectable = true
