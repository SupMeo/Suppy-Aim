-- Gui to Lua
-- Version: 3.3

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local SuppyAim = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

SuppyAim.Name = "Suppy Aim"
SuppyAim.Parent = ScreenGui
SuppyAim.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SuppyAim.BackgroundTransparency = 1.000
SuppyAim.Position = UDim2.new(0.0738310069, 0, 0.27004078, 0)
SuppyAim.Size = UDim2.new(0, 201, 0, 149)
SuppyAim.Image = "rbxassetid://3570695787"
SuppyAim.ImageColor3 = Color3.fromRGB(54, 54, 54)
SuppyAim.ScaleType = Enum.ScaleType.Slice
SuppyAim.SliceCenter = Rect.new(100, 100, 100, 100)
SuppyAim.SliceScale = 0.120

TextLabel.Parent = SuppyAim
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.PermanentMarker
TextLabel.Text = "Suppy Aim"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

TextButton.Parent = SuppyAim
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0, 0, 0.335570484, 0)
TextButton.Size = UDim2.new(0, 200, 0, 98)
TextButton.Font = Enum.Font.PermanentMarker
TextButton.Text = "Off"
TextButton.TextColor3 = Color3.fromRGB(255, 55, 58)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

-- Scripts:

local function GVPB_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	_G.aimbot = false
	local camera = game.Workspace.CurrentCamera
	local localplayer = game:GetService("Players").LocalPlayer
	local dist = math.huge
	local target = nil
	
	
	script.Parent.MouseButton1Click:Connect(function()
		 if _G.aimbot == false then
			_G.aimbot = true
			script.Parent.Text = "On"
			script.Parent.TextColor3 = Color3.fromRGB(89, 255, 60)
			local function closestplayer()
				local dist = math.huge
				local target = nil
				for i,v in pairs (game:GetService("Players"):GetPlayers()) do
					if v ~= localplayer then
						if v.Character and v.Character:FindFirstChild("Head") and v.TeamColor ~= localplayer.TeamColor and _G.aimbot then
							local magnitude = (v.Character.Head.Posistion - localplayer.Character.Head.Position).magnitude
							if magnitude < dist then
								dist = magnitude
								target = v
							end
							
						end
					end
				end
			return target
		end
		
		else 
			_G.aimbot = false
			script.Parent.Text = "Off"
			script.Parent.TextColor3 = Color3.fromRGB(255, 55, 58)
		end	
	end)
	
	local settings = {
		keybind = Enum.UserInputType.MouseButton2
	}
	
	local UIS = game:GetService("UserInputService")
	local aiming = false
	
	UIS.InputBegan:Connect(function(inp)
		if inp.UserInputType == settings.keybind then
			aiming = true
		end
	end)
	
	UIS.InputEnded:Connect(function(inp)
		if inp.UserInputType == settings.keybind then
			aiming = false
		end
	end)
	
	game:GetService("RunService").RenderStepped:Connect(function()
		if aiming then
		camera.CFrame = CFrame.new(camera.CFrame.Position,closestplayer().Character.Head.Posistion)
		end
	end)
end
coroutine.wrap(GVPB_fake_script)()
