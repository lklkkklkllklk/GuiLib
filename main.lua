local GuiLib = {
	Themes = {},
	errorLog = {},
	onError = nil
}

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

GuiLib.Themes = {
	Dark = {
		Background = Color3.fromRGB(17, 17, 23),
		Sidebar = Color3.fromRGB(21, 21, 29),
		Section = Color3.fromRGB(26, 26, 35),
		Element = Color3.fromRGB(36, 36, 47),
		Hover = Color3.fromRGB(48, 48, 62),
		Accent = Color3.fromRGB(139, 92, 246),
		Text = Color3.fromRGB(255, 255, 255),
		SubText = Color3.fromRGB(210, 214, 228),
		Border = Color3.fromRGB(48, 48, 62)
	},

	Midnight = {
		Background = Color3.fromRGB(10, 14, 25),
		Sidebar = Color3.fromRGB(14, 20, 34),
		Section = Color3.fromRGB(19, 27, 43),
		Element = Color3.fromRGB(27, 39, 59),
		Hover = Color3.fromRGB(38, 52, 75),
		Accent = Color3.fromRGB(56, 189, 248),
		Text = Color3.fromRGB(240, 248, 255),
		SubText = Color3.fromRGB(184, 205, 226),
		Border = Color3.fromRGB(39, 51, 70)
	},

	Ocean = {
		Background = Color3.fromRGB(13, 24, 29),
		Sidebar = Color3.fromRGB(17, 32, 38),
		Section = Color3.fromRGB(22, 40, 46),
		Element = Color3.fromRGB(31, 54, 60),
		Hover = Color3.fromRGB(42, 70, 75),
		Accent = Color3.fromRGB(45, 212, 191),
		Text = Color3.fromRGB(240, 250, 248),
		SubText = Color3.fromRGB(177, 211, 203),
		Border = Color3.fromRGB(42, 67, 70)
	},

	Rose = {
		Background = Color3.fromRGB(25, 17, 24),
		Sidebar = Color3.fromRGB(33, 22, 31),
		Section = Color3.fromRGB(41, 28, 39),
		Element = Color3.fromRGB(56, 37, 52),
		Hover = Color3.fromRGB(73, 47, 66),
		Accent = Color3.fromRGB(244, 114, 182),
		Text = Color3.fromRGB(255, 240, 248),
		SubText = Color3.fromRGB(219, 177, 199),
		Border = Color3.fromRGB(77, 49, 69)
	},

	Light = {
		Background = Color3.fromRGB(242, 243, 248),
		Sidebar = Color3.fromRGB(232, 233, 240),
		Section = Color3.fromRGB(250, 250, 253),
		Element = Color3.fromRGB(225, 227, 235),
		Hover = Color3.fromRGB(211, 214, 225),
		Accent = Color3.fromRGB(116, 78, 210),
		Text = Color3.fromRGB(30, 30, 43),
		SubText = Color3.fromRGB(83, 85, 108),
		Border = Color3.fromRGB(205, 207, 220)
	},

	Crimson = {
		Background = Color3.fromRGB(23, 14, 17),
		Sidebar = Color3.fromRGB(32, 18, 22),
		Section = Color3.fromRGB(41, 23, 28),
		Element = Color3.fromRGB(57, 30, 37),
		Hover = Color3.fromRGB(75, 38, 46),
		Accent = Color3.fromRGB(239, 68, 68),
		Text = Color3.fromRGB(255, 240, 240),
		SubText = Color3.fromRGB(225, 179, 185),
		Border = Color3.fromRGB(80, 43, 49)
	},

	Sakura = {
		Background = Color3.fromRGB(32, 18, 31),
		Sidebar = Color3.fromRGB(40, 24, 39),
		Section = Color3.fromRGB(55, 31, 51),
		Element = Color3.fromRGB(75, 42, 69),
		Hover = Color3.fromRGB(99, 53, 88),
		Accent = Color3.fromRGB(255, 145, 202),
		Text = Color3.fromRGB(255, 241, 249),
		SubText = Color3.fromRGB(235, 185, 215),
		Border = Color3.fromRGB(112, 62, 99)
	},

	Pink = {
		Background = Color3.fromRGB(255, 218, 235),
		Sidebar = Color3.fromRGB(255, 184, 216),
		Section = Color3.fromRGB(255, 232, 243),
		Element = Color3.fromRGB(255, 199, 226),
		Hover = Color3.fromRGB(255, 165, 210),
		Accent = Color3.fromRGB(213, 38, 125),
		Text = Color3.fromRGB(74, 17, 48),
		SubText = Color3.fromRGB(126, 43, 82),
		Border = Color3.fromRGB(235, 103, 164)
	},

	Emerald = {
		Background = Color3.fromRGB(14, 23, 19),
		Sidebar = Color3.fromRGB(19, 31, 25),
		Section = Color3.fromRGB(24, 40, 32),
		Element = Color3.fromRGB(33, 54, 43),
		Hover = Color3.fromRGB(44, 72, 55),
		Accent = Color3.fromRGB(52, 211, 153),
		Text = Color3.fromRGB(238, 255, 245),
		SubText = Color3.fromRGB(181, 218, 192),
		Border = Color3.fromRGB(43, 70, 53)
	},

	Amethyst = {
		Background = Color3.fromRGB(20, 16, 30),
		Sidebar = Color3.fromRGB(28, 21, 42),
		Section = Color3.fromRGB(36, 28, 53),
		Element = Color3.fromRGB(49, 37, 70),
		Hover = Color3.fromRGB(63, 47, 91),
		Accent = Color3.fromRGB(167, 139, 250),
		Text = Color3.fromRGB(248, 244, 255),
		SubText = Color3.fromRGB(205, 190, 231),
		Border = Color3.fromRGB(65, 49, 91)
	},

	Nord = {
		Background = Color3.fromRGB(36, 41, 51),
		Sidebar = Color3.fromRGB(42, 48, 60),
		Section = Color3.fromRGB(48, 55, 68),
		Element = Color3.fromRGB(59, 67, 82),
		Hover = Color3.fromRGB(72, 82, 99),
		Accent = Color3.fromRGB(136, 192, 208),
		Text = Color3.fromRGB(236, 239, 244),
		SubText = Color3.fromRGB(205, 214, 228),
		Border = Color3.fromRGB(75, 85, 102)
	},

	Solarized = {
		Background = Color3.fromRGB(0, 43, 54),
		Sidebar = Color3.fromRGB(4, 51, 63),
		Section = Color3.fromRGB(7, 58, 69),
		Element = Color3.fromRGB(15, 70, 82),
		Hover = Color3.fromRGB(26, 85, 96),
		Accent = Color3.fromRGB(38, 139, 210),
		Text = Color3.fromRGB(238, 232, 213),
		SubText = Color3.fromRGB(183, 202, 204),
		Border = Color3.fromRGB(35, 83, 91)
	}
}

local Theme = GuiLib.Themes.Dark
local ThemeObjects = {}

local function Create(class, properties, parent)
	local object = Instance.new(class)

	for property, value in pairs(properties or {}) do
		object[property] = value
	end

	object.Parent = parent
	return object
end

local function Corner(object, radius)
	Create("UICorner", {
		CornerRadius = UDim.new(0, radius or 6)
	}, object)
end

local RegisterTheme

local function Stroke(object, transparency, borderPosition)
	local stroke = Create("UIStroke", {
		Color = Theme.Border,
		Thickness = 1,
		Transparency = transparency or 0.18,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		BorderStrokePosition = borderPosition or Enum.BorderStrokePosition.Outer
	}, object)
	RegisterTheme(stroke, {Color = "Border"})
	return stroke
end

RegisterTheme = function(object, properties, callback)
	table.insert(ThemeObjects, {
		Object = object,
		Properties = properties or {},
		Callback = callback
	})
end

local function UnregisterThemeTree(root)
	if not root then return end
	for index = #ThemeObjects, 1, -1 do
		local object = ThemeObjects[index].Object
		if not object or object == root or object:IsDescendantOf(root) then
			table.remove(ThemeObjects, index)
		end
	end
end

local AnimationSettings = {
	Enabled = true,
	Speed = 1
}

local function Tween(object, properties, duration)
	if not object or not object.Parent then return end
	if not AnimationSettings.Enabled then
		for property, value in pairs(properties) do
			pcall(function() object[property] = value end)
		end
		return nil
	end

	local tween = TS:Create(
		object,
		TweenInfo.new(
			math.max(0.03, (duration or 0.16) * AnimationSettings.Speed),
			Enum.EasingStyle.Quart,
			Enum.EasingDirection.Out
		),
		properties
	)
	tween:Play()
	return tween
end

local function Protect(callback, ...)
	if not callback then return end

	local success, result = pcall(callback, ...)

	if not success then
		table.insert(GuiLib.errorLog, result)

		if GuiLib.onError then
			pcall(GuiLib.onError, result)
		end
	end
end

local function Clamp(value, minimum, maximum)
	return math.clamp(value, minimum, maximum)
end

local function Round(value, decimals)
	local multiplier = 10 ^ (decimals or 0)
	return math.floor(value * multiplier + 0.5) / multiplier
end

local function Label(parent, text, size, position, textSize, color)
	local label = Create("TextLabel", {
		BackgroundTransparency = 1,
		Size = size,
		Position = position,
		Text = text or "",
		TextColor3 = color or Theme.Text,
		TextSize = textSize or 11,
		Font = Enum.Font.Gotham,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center
	}, parent)
	if color == nil or color == Theme.Text then
		RegisterTheme(label, {TextColor3 = "Text"})
	elseif color == Theme.SubText then
		RegisterTheme(label, {TextColor3 = "SubText"})
	elseif color == Theme.Accent then
		RegisterTheme(label, {TextColor3 = "Accent"})
	end
	return label
end

local function AddPadding(object, left, right, top, bottom)
	return Create("UIPadding", {
		PaddingLeft = UDim.new(0, left or 0),
		PaddingRight = UDim.new(0, right or 0),
		PaddingTop = UDim.new(0, top or 0),
		PaddingBottom = UDim.new(0, bottom or 0)
	}, object)
end

function GuiLib:SetTheme(theme)
	local newTheme = type(theme) == "string"
		and self.Themes[theme]
		or theme

	assert(type(newTheme) == "table", "Invalid Novex theme")

	Theme = newTheme

	for index = #ThemeObjects, 1, -1 do
		local entry = ThemeObjects[index]
		local object = entry.Object
		if not object or not object.Parent then
			table.remove(ThemeObjects, index)
		else
			for property, themeKey in pairs(entry.Properties) do
				local value = Theme[themeKey]
				if value ~= nil then object[property] = value end
			end
		end
	end
	for _, entry in ipairs(ThemeObjects) do
		if entry.Object and entry.Object.Parent and entry.Callback then
			Protect(entry.Callback)
		end
	end
end

function GuiLib:GetTheme()
	return Theme
end

function GuiLib:Notify(title, message, duration)
	local active = self._activeWindow
	if active and active.Notify then
		return active:Notify(title, message, duration)
	end
	return nil
end

local MainGui = Create("ScreenGui", {
	Name = "Novex",
	ResetOnSpawn = false,
	DisplayOrder = 1000,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling
}, PlayerGui)

function GuiLib:CreateWindow(Args)
	Args = Args or {}

	local WindowObject = {}
	local Connections = {}

	local Width = Args.Width or 560
	local Height = Args.Height or 375
	local DefaultScale = Args.Scale or 0.82

	local Destroyed = false

	local function Track(connection)
		table.insert(Connections, connection)
		return connection
	end

	local function AnimateButton(button)
		if not button or button:FindFirstChild("NovexPressScale") then return end
		local pressScale = Create("UIScale", {Name = "NovexPressScale", Scale = 1}, button)
		Track(button.MouseButton1Down:Connect(function()
			Tween(pressScale, {Scale = 0.94}, 0.14)
		end))
		Track(button.MouseButton1Up:Connect(function()
			Tween(pressScale, {Scale = 1}, 0.18)
		end))
		Track(button.MouseLeave:Connect(function()
			Tween(pressScale, {Scale = 1}, 0.18)
		end))
	end


	local function AddGradient(object, firstKey, secondKey, rotation)
		object.BackgroundColor3 = Color3.new(1, 1, 1)
		local gradient
		local function ApplyGradient()
			object.BackgroundColor3 = Color3.new(1, 1, 1)
			gradient.Color = ColorSequence.new(Theme[firstKey], Theme[secondKey])
		end
		gradient = Create("UIGradient", {
			Color = ColorSequence.new(Theme[firstKey], Theme[secondKey]),
			Rotation = rotation or 25
		}, object)
		RegisterTheme(gradient, {}, ApplyGradient)
		return gradient
	end

	local Window = Create("Frame", {
		Name = "Window",
		Size = UDim2.fromOffset(Width, Height),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Theme.Background,
		BorderSizePixel = 0,
		ClipsDescendants = true
	}, MainGui)

	Corner(Window, 16)
	local WindowStroke = Stroke(Window, 0)
	WindowStroke.Thickness = 2.25
	WindowStroke.Color = Theme.Border
	RegisterTheme(WindowStroke, {Color = "Border"})
	AddGradient(Window, "Background", "Sidebar", 35)
	RegisterTheme(Window, {BackgroundColor3 = "Background"})

	local Scale = Create("UIScale", {
		Scale = DefaultScale
	}, Window)

	local OuterBorder = Create("Frame", {
		Name = "NovexOuterBorder", Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1, BorderSizePixel = 0,
		ZIndex = 80, Active = false
	}, Window)
	Corner(OuterBorder, 16)
	local outerStroke = Stroke(OuterBorder, 0)
	outerStroke.Thickness = 2
	RegisterTheme(outerStroke, {Color = "Border"})

	local Header = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 52),
		BackgroundColor3 = Theme.Sidebar,
		BorderSizePixel = 0
	}, Window)
	Corner(Header, 16)
	Stroke(Header, 0)
	RegisterTheme(Header, {
		BackgroundColor3 = "Sidebar"
	})
	AddGradient(Header, "Sidebar", "Background", 0)
	local HeaderPadding = AddPadding(Header, 14, 12, 0, 0)

	local Title = Label(
		Header,
		Args.Title or "Novex",
		UDim2.new(1, -150, 0, 23),
		UDim2.fromOffset(0, 4),
		15
	)
	Title.Font = Enum.Font.GothamBold

	if Args.SubTitle and tostring(Args.SubTitle) ~= "" then
		local Subtitle = Label(
			Header,
			tostring(Args.SubTitle),
			UDim2.new(1, -150, 0, 16),
			UDim2.fromOffset(1, 26),
			9,
			Theme.SubText
		)
		Subtitle.Font = Enum.Font.GothamMedium
	end

	local function HeaderButton(text, position)
		local button = Create("TextButton", {
			Size = UDim2.fromOffset(26, 26),
			Position = position,
			BackgroundColor3 = Theme.Element,
			Text = text,
			TextColor3 = Theme.Text,
			TextSize = 16,
			Font = Enum.Font.GothamBold,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			ZIndex = 5
		}, Header)

		Corner(button, 7)
		Stroke(button, 0)
		AnimateButton(button)
		Track(button.MouseEnter:Connect(function()
			Tween(button, {BackgroundColor3 = Theme.Hover, TextColor3 = Theme.Accent}, 0.12)
		end))
		Track(button.MouseLeave:Connect(function()
			Tween(button, {BackgroundColor3 = Theme.Element, TextColor3 = Theme.Text}, 0.14)
		end))

		RegisterTheme(button, {
			BackgroundColor3 = "Element",
			TextColor3 = "Text"
		})

		return button
	end

	local Close = HeaderButton("×", UDim2.new(1, -40, 0, 12))
	local Minimize = HeaderButton("−", UDim2.new(1, -72, 0, 12))
	local ConfigButton = HeaderButton("⚙", UDim2.new(1, -104, 0, 12))
	ConfigButton.TextSize = 14
	Stroke(Close, 0.12)
	Stroke(Minimize, 0.12)

	local Sidebar = Create("Frame", {
		Size = UDim2.new(0, 125, 1, -52),
		Position = UDim2.fromOffset(0, 52),
		BackgroundColor3 = Theme.Sidebar,
		BorderSizePixel = 0
	}, Window)

	Corner(Sidebar, 16)
	Stroke(Sidebar, 0)
	AddGradient(Sidebar, "Sidebar", "Background", 90)
	RegisterTheme(Sidebar, {
		BackgroundColor3 = "Sidebar"
	})

	local TabList = Create("ScrollingFrame", {
		Size = UDim2.new(1, -12, 1, -14),
		Position = UDim2.fromOffset(6, 7),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 2,
		ScrollBarImageColor3 = Theme.Accent,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y
	}, Sidebar)

	Create("UIListLayout", {
		Padding = UDim.new(0, 5),
		SortOrder = Enum.SortOrder.LayoutOrder
	}, TabList)

	local Content = Create("Frame", {
		Size = UDim2.new(1, -135, 1, -62),
		Position = UDim2.fromOffset(125, 52),
		BackgroundTransparency = 1
	}, Window)

	local IsOpen = true
	local ToggleKey = Args.ToggleKey or Enum.KeyCode.RightShift
	local ListeningForToggleKey = false
	local SearchItems = {}
	local AnimationConnection
	local AnimationId = 0

	local function Lerp(a, b, t)
		return a + (b - a) * t
	end

	local function AnimateScale(target, callback)
		if not AnimationSettings.Enabled then
			AnimationId += 1
			if AnimationConnection then AnimationConnection:Disconnect(); AnimationConnection = nil end
			Scale.Scale = target
			if callback then callback() end
			return
		end
		AnimationId += 1
		local currentId = AnimationId

		if AnimationConnection then
			AnimationConnection:Disconnect()
			AnimationConnection = nil
		end

		AnimationConnection = RunService.RenderStepped:Connect(function(dt)
			if Destroyed or currentId ~= AnimationId then
				return
			end

			local alpha = 1 - math.exp((-16 / math.max(0.25, AnimationSettings.Speed)) * dt)
			Scale.Scale = Lerp(Scale.Scale, target, alpha)

			if math.abs(Scale.Scale - target) < 0.001 then
				Scale.Scale = target
				AnimationConnection:Disconnect()
				AnimationConnection = nil

				if callback then callback() end
			end
		end)
	end

	Track(Scale:GetPropertyChangedSignal("Scale"):Connect(function()
		if TooltipScale then TooltipScale.Scale = Scale.Scale end
	end))

	local ClosedIconSettings = type(Args.ClosedIcon) == "table" and Args.ClosedIcon or {}
local ClosedIconEnabled = Args.ClosedIcon ~= false and ClosedIconSettings.Enabled ~= false
local ClosedIconMobileOnly = ClosedIconSettings.MobileOnly == true

local function IsMobile()
    return UIS.TouchEnabled and not UIS.KeyboardEnabled and not UIS.MouseEnabled
end

local function CanShowClosedIcon()
    return ClosedIconEnabled and (not ClosedIconMobileOnly or IsMobile())
end

	local ReopenButton = Create("ImageButton", {
		Name = "NovexReopen",
		Size = UDim2.fromOffset(48, 48),
		Position = UDim2.new(1, -58, 0.5, -24),
		BackgroundColor3 = Theme.Accent,
		Image = "rbxassetid://80530766105475",
		ImageColor3 = Color3.fromRGB(255, 255, 255),
		ScaleType = Enum.ScaleType.Fit,
		BorderSizePixel = 0,
		Visible = false,
		AutoButtonColor = false,
		ZIndex = 100
	}, MainGui)

	Corner(ReopenButton, 15)
	Stroke(ReopenButton, 0)
	AnimateButton(ReopenButton)
	AddPadding(ReopenButton, 7, 7, 7, 7)

	RegisterTheme(ReopenButton, {
		BackgroundColor3 = "Accent"
	})

	local function SetOpen(state)
		if Destroyed or IsOpen == state then return end

		IsOpen = state

		if state then
			Window.Visible = true
			ReopenButton.Visible = false
			Scale.Scale = DefaultScale * 0.85
			AnimateScale(DefaultScale)
		else
			AnimateScale(DefaultScale * 0.85, function()
				Window.Visible = false
				ReopenButton.Visible = CanShowClosedIcon()
			end)
		end
	end

	local function ToggleWindow()
		SetOpen(not IsOpen)
	end

	Track(ReopenButton.MouseButton1Click:Connect(ToggleWindow))

	Track(ReopenButton.MouseEnter:Connect(function()
		Tween(ReopenButton, {BackgroundColor3 = Theme.Hover, Rotation = 5, Size = UDim2.fromOffset(51, 51)})
	end))

	Track(ReopenButton.MouseLeave:Connect(function()
		Tween(ReopenButton, {BackgroundColor3 = Theme.Accent, Rotation = 0, Size = UDim2.fromOffset(48, 48)})
	end))

	local OptionStates = {}
	local VisibilityBindings = {}
	local TooltipFrame
	local TooltipScale
	local function EnsureTooltip()
		if TooltipFrame then return TooltipFrame end
		TooltipFrame = Create("Frame", {
			Name = "NovexTooltip", AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromOffset(240, 0), BackgroundColor3 = Theme.Section,
			BorderSizePixel = 0, Visible = false, ZIndex = 250
		}, MainGui)
		TooltipScale = Create("UIScale", {Scale = Scale.Scale}, TooltipFrame)
		Corner(TooltipFrame, 7); Stroke(TooltipFrame, 0)
		AddPadding(TooltipFrame, 9, 9, 5, 5)
		local text = Create("TextLabel", {
			Name = "Text", AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0), BackgroundTransparency = 1,
			Text = "", TextColor3 = Theme.Text, TextSize = 11, TextScaled = false,
			Font = Enum.Font.Gotham, TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 251
		}, TooltipFrame)
		RegisterTheme(TooltipFrame, {BackgroundColor3 = "Section"})
		RegisterTheme(text, {TextColor3 = "Text"})
		return TooltipFrame
	end

	local function AttachTooltip(object, message)
		if not message or tostring(message) == "" then return end
		local tip = EnsureTooltip()
		local function show()
			tip:FindFirstChild("Text").Text = tostring(message)
			tip.Visible = true
			local pos = object.AbsolutePosition
			local size = object.AbsoluteSize
			local x = math.clamp(pos.X + math.min(size.X, 24), 4, math.max(4, MainGui.AbsoluteSize.X - 248))
			local y = pos.Y + size.Y + 5
			if y + 50 > MainGui.AbsoluteSize.Y then y = math.max(4, pos.Y - 42) end
			tip.Position = UDim2.fromOffset(x, y)
		end
		Track(object.MouseEnter:Connect(show))
		Track(object.MouseLeave:Connect(function() if tip then tip.Visible = false end end))
	end

	local function ApplyVisibleWhen(holder, args)
		local key = args and args.VisibleWhen
		if not key then return end
		local function refresh()
			holder.Visible = OptionStates[key] == true
		end
		table.insert(VisibilityBindings, {Key = key, Refresh = refresh})
		refresh()
	end

	local RefreshActiveFeatures
	local RefreshActiveFeatures
	local function SetOptionState(name, value)
		if not name then return end
		OptionStates[name] = not not value
		for _, binding in ipairs(VisibilityBindings) do
			if binding.Key == name then binding.Refresh() end
		end
		if RefreshActiveFeatures then
			RefreshActiveFeatures(name, OptionStates[name])
		end
	end

	local WatermarkObject
	function WindowObject:CreateWatermark(options)
		options = options or {}
		if WatermarkObject then WatermarkObject:Destroy() end
		local root = Create("Frame", {
			Name = "NovexWatermark",
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.fromOffset(0, 27),
			Position = options.Position or UDim2.fromOffset(12, 12),
			BackgroundColor3 = Theme.Section,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Active = true,
			ClipsDescendants = true,
			Visible = options.Enabled ~= false,
			ZIndex = 150
		}, MainGui)
		Corner(root, 11)
		local watermarkGradient = Create("UIGradient", {
			Color = ColorSequence.new(Theme.Section, Theme.Element), Rotation = 18
		}, root)
		local outline = Stroke(root, 0)
		outline.Thickness = 1.5
		RegisterTheme(root, {BackgroundColor3 = "Section"}, function()
			watermarkGradient.Color = ColorSequence.new(Theme.Section, Theme.Element)
		end)
		RegisterTheme(watermarkGradient, {}, function()
			watermarkGradient.Color = ColorSequence.new(Theme.Section, Theme.Element)
		end)
		local label = Create("TextLabel", {
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.fromOffset(0, 27),
			Position = UDim2.fromOffset(10, 0),
			BackgroundTransparency = 1,
			Text = tostring(options.Text or "Novex | {fps} fps | {ping} ms"),
			TextColor3 = Theme.Text,
			TextSize = options.TextSize or 11,
			Font = Enum.Font.GothamSemibold,
			TextXAlignment = Enum.TextXAlignment.Left,
			Active = true,
			ZIndex = 151
		}, root)
		AddPadding(root, 10, 12, 0, 0)
		RegisterTheme(label, {TextColor3 = "Text"})
		local alive, elapsed, frames, fps = true, 0, 0, 0
		local connection = RunService.RenderStepped:Connect(function(dt)
			if not alive then return end
			frames += 1
			elapsed += dt
			if elapsed < 0.5 then return end
			fps = math.floor(frames / elapsed + 0.5)
			frames, elapsed = 0, 0
			local ping = "?"
			pcall(function()
				local item = Stats.Network.ServerStatsItem["Data Ping"]
				local value = item:GetValueString():match("[%d%.]+")
				if value then ping = tostring(math.floor(tonumber(value) + 0.5)) end
			end)
			label.Text = tostring(options.Text or "Novex | {fps} fps | {ping} ms")
				:gsub("{fps}", tostring(fps)):gsub("{ping}", ping)
		end)
		local watermarkDragging, dragInput, dragStart, startPos = false, nil, nil, nil
		local dragConnections = {}
		local function addDragConnection(conn) table.insert(dragConnections, conn) end
		local function beginWatermarkDrag(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				watermarkDragging = true
				dragStart = input.Position
				startPos = root.Position
				if input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
			end
		end
		addDragConnection(root.InputBegan:Connect(beginWatermarkDrag))
		addDragConnection(label.InputBegan:Connect(beginWatermarkDrag))

		addDragConnection(root.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
		end))
		addDragConnection(UIS.InputChanged:Connect(function(input)
			if watermarkDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input == dragInput) then
				local delta = input.Position - dragStart
				root.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			end
		end))
		addDragConnection(UIS.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then watermarkDragging = false end
		end))
		WatermarkObject = {Root = root, Label = label, Connection = connection, Outline = outline}
		function WatermarkObject:SetVisible(state) root.Visible = not not state end
		function WatermarkObject:SetText(value) options.Text = tostring(value); label.Text = options.Text end
		function WatermarkObject:Destroy()
			alive = false
			connection:Disconnect()
			for _, dragConnection in ipairs(dragConnections) do dragConnection:Disconnect() end
			UnregisterThemeTree(root)
			root:Destroy()
		end
		return WatermarkObject
	end

	local Tabs = {}
	local SelectedTab
	local TabCount = 0

	function WindowObject:AddTab(TabArgs)
		TabArgs = TabArgs or {}

		local TabObject = {}
		TabCount += 1

		local TabButton = Create("TextButton", {
			Size = UDim2.new(1, 0, 0, 29),
			BackgroundColor3 = Theme.Element,
			BackgroundTransparency = 1,
			Text = TabArgs.Name or "Tab",
			TextXAlignment = Enum.TextXAlignment.Left,
			TextColor3 = Theme.SubText,
			TextSize = 11,
			Font = Enum.Font.GothamMedium,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			LayoutOrder = TabCount
		}, TabList)

		AnimateButton(TabButton)
		AddPadding(TabButton, 11, 7, 0, 0)
		local TabIndicator = nil

		RegisterTheme(TabButton, {
			BackgroundColor3 = "Element",
			TextColor3 = "SubText"
		}, function()
			local active = SelectedTab and SelectedTab.Button == TabButton
			TabButton.BackgroundTransparency = 1
			TabButton.TextColor3 = active and Theme.Accent or Theme.SubText
		end)

		local Page = Create("ScrollingFrame", {
			Name = TabArgs.Name or "Page",
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 3,
			ScrollBarImageColor3 = Theme.Accent,
			CanvasSize = UDim2.new(),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			Visible = false
		}, Content)

		Create("UIListLayout", {
			Padding = UDim.new(0, 7),
			SortOrder = Enum.SortOrder.LayoutOrder
		}, Page)

		AddPadding(Page, 8, 8, 8, 8)

		local CurrentPage = Page
		local SubTabBar
		local SubTabs = {}
		local SelectedSubTab
		local RegisteringSubTab

		local function SelectTab()
			if SelectedTab then
				SelectedTab.Page.Visible = false

				Tween(SelectedTab.Button, {BackgroundTransparency = 1, TextColor3 = Theme.SubText})
			end

			SelectedTab = {
				Page = Page,
				Button = TabButton,
				Indicator = TabIndicator,
				Stroke = tabStroke
			}

			Page.Visible = true
			Page.CanvasPosition = Vector2.zero
			if SelectedSubTab then
				for _, sub in ipairs(SubTabs) do sub.Page.Visible = false end
				SelectedSubTab.Page.Visible = true
			end

			Tween(TabButton, {BackgroundTransparency = 1, TextColor3 = Theme.Accent})

		end

		Track(TabButton.MouseButton1Click:Connect(SelectTab))
		Track(TabButton.MouseEnter:Connect(function()
			if not SelectedTab or SelectedTab.Button ~= TabButton then
				Tween(TabButton, {BackgroundTransparency = 1, TextColor3 = Theme.Text}, 0.12)
			end
		end))
		Track(TabButton.MouseLeave:Connect(function()
			if not SelectedTab or SelectedTab.Button ~= TabButton then
				Tween(TabButton, {BackgroundTransparency = 1, TextColor3 = Theme.SubText}, 0.12)
			end
		end))

		function TabObject:AddSubTab(Name)
			if not SubTabBar then
				SubTabBar = Create("Frame", {Name = "SubTabs", Size = UDim2.new(1, -16, 0, 25), Position = UDim2.fromOffset(8, 6), BackgroundTransparency = 1}, Page)
				Create("UIListLayout", {FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder}, SubTabBar)
				local pageLayout = Page:FindFirstChildOfClass("UIListLayout")
				if pageLayout then pageLayout:Destroy() end
				CurrentPage = Page
			end
			local sub = {}
			local button = Create("TextButton", {Size = UDim2.new(0, 88, 1, 0), BackgroundColor3 = Theme.Element, BackgroundTransparency = 1, Text = Name or "Subtab", TextColor3 = Theme.SubText, TextSize = 9, Font = Enum.Font.GothamSemibold, BorderSizePixel = 0, AutoButtonColor = false}, SubTabBar)
			AnimateButton(button)
			local subIndicator = nil
			RegisterTheme(button, {BackgroundColor3 = "Element", TextColor3 = "SubText"}, function()
				local active = SelectedSubTab and SelectedSubTab.Button == button
				button.BackgroundTransparency = 1
				button.TextColor3 = active and Theme.Accent or Theme.SubText
			end)
			local subPage = Create("ScrollingFrame", {Name = tostring(Name or "Subtab"), Size = UDim2.new(1, 0, 1, -36), Position = UDim2.fromOffset(0, 36), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 3, ScrollBarImageColor3 = Theme.Accent, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, Visible = false}, Page)
			Create("UIListLayout", {Padding = UDim.new(0, 7), SortOrder = Enum.SortOrder.LayoutOrder}, subPage); AddPadding(subPage, 8, 8, 8, 8)
			sub.Page = subPage; sub.Button = button; sub.Indicator = subIndicator;
			local function selectSub()
				if SelectedSubTab then
					SelectedSubTab.Page.Visible = false
					Tween(SelectedSubTab.Button, {BackgroundTransparency = 1, TextColor3 = Theme.SubText})

				end
				SelectedSubTab = sub; subPage.Visible = true; subPage.CanvasPosition = Vector2.zero
				Tween(button, {BackgroundTransparency = 1, TextColor3 = Theme.Accent})

			end
			sub.Select = selectSub
			Track(button.MouseButton1Click:Connect(selectSub)); table.insert(SubTabs, sub)
			if #SubTabs == 1 then selectSub() end
			function sub:AddSection(sectionName)
				local previousPage, previousSub = CurrentPage, RegisteringSubTab
				CurrentPage, RegisteringSubTab = subPage, sub
				local result = TabObject:AddSection(sectionName)
				CurrentPage, RegisteringSubTab = previousPage, previousSub
				return result
			end
			return sub
		end

		function TabObject:AddSubsection(Name)
			return self:AddSubTab(Name)
		end

		function TabObject:AddSection(Name)
			local SectionObject = {}
			local sectionPage, sectionSubTab = CurrentPage, RegisteringSubTab

			local Section = Create("Frame", {
				Name = Name or "Section",
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = Theme.Section,
				BorderSizePixel = 0
			}, CurrentPage)

			Corner(Section, 10)
			Stroke(Section, 0.12, Enum.BorderStrokePosition.Inner)
			AddGradient(Section, "Section", "Sidebar", 25)

			RegisterTheme(Section, {
				BackgroundColor3 = "Section"
			})

			local SectionTitle = Label(
				Section,
				Name or "Section",
				UDim2.new(1, -16, 0, 24),
				UDim2.fromOffset(9, 3),
				11
			)

			SectionTitle.Font = Enum.Font.GothamBold

			local Elements = Create("Frame", {
				Size = UDim2.new(1, -16, 0, 0),
				Position = UDim2.fromOffset(8, 30),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1
			}, Section)

			Create("UIListLayout", {
				Padding = UDim.new(0, 5),
				SortOrder = Enum.SortOrder.LayoutOrder
			}, Elements)

			AddPadding(Elements, 0, 0, 0, 8)

			local function MakeElement(height)
				return Create("Frame", {
					Size = UDim2.new(1, 0, 0, height or 31),
					BackgroundTransparency = 1
				}, Elements)
			end

			local function RegisterSearchItem(itemName, holder)
				local itemPage, itemSubTab = sectionPage, sectionSubTab
				table.insert(SearchItems, {
					Name = tostring(itemName or Name or "Option"),
					Section = tostring(Name or "Section"),
					Holder = holder,
					Navigate = function()
						SelectTab()
						if itemSubTab and itemSubTab.Select then itemSubTab.Select() end
						task.spawn(function()
							RunService.RenderStepped:Wait()
							RunService.RenderStepped:Wait()
							if not holder.Parent or not holder:IsDescendantOf(itemPage) or not itemPage.Parent or not itemPage.Visible then return end
							local y = holder.AbsolutePosition.Y - itemPage.AbsolutePosition.Y + itemPage.CanvasPosition.Y
							local maxY = math.max(0, itemPage.AbsoluteCanvasSize.Y - itemPage.AbsoluteSize.Y)
							itemPage.CanvasPosition = Vector2.new(0, math.clamp(y - 8, 0, maxY))
						end)
					end
				})
			end

			local function MakeButton(parent, text)
				local button = Create("TextButton", {
					Size = UDim2.fromScale(1, 1),
					BackgroundColor3 = Theme.Element,
					BorderSizePixel = 0,
					Text = text or "",
					TextColor3 = Theme.Text,
					TextSize = 10,
					Font = Enum.Font.GothamMedium,
					AutoButtonColor = false
				}, parent)

				Corner(button, 7)
				Stroke(button, 0)
				AnimateButton(button)
				AddPadding(button, 9, 8, 0, 0)

				RegisterTheme(button, {
					BackgroundColor3 = "Element",
					TextColor3 = "Text"
				})

				Track(button.MouseEnter:Connect(function()
					Tween(button, {
						BackgroundColor3 = Theme.Hover
					})
				end))

				Track(button.MouseLeave:Connect(function()
					Tween(button, {
						BackgroundColor3 = Theme.Element
					})
				end))

				return button
			end

			function SectionObject:AddButton(Args)
				Args = Args or {}

				local Holder = MakeElement(31)
				ApplyVisibleWhen(Holder, Args); RegisterSearchItem(Args.Name or Args.Title or "Option", Holder); AttachTooltip(Holder, Args.Tooltip)
				local Button = MakeButton(Holder, Args.Name or "Button")

				Track(Button.MouseButton1Click:Connect(function()
					Protect(Args.Callback)
				end))

				return {
					Instance = Button
				}
			end

			function SectionObject:AddToggle(Args)
				Args = Args or {}

				local Value = Args.Default or false
				local Holder = MakeElement(31)
				ApplyVisibleWhen(Holder, Args); RegisterSearchItem(Args.Name or Args.Title or "Option", Holder); AttachTooltip(Holder, Args.Tooltip)
				local Button = MakeButton(Holder, Args.Name or "Toggle")
				Button.BackgroundTransparency = 1
				local toggleStroke = Button:FindFirstChildOfClass("UIStroke")
				if toggleStroke then toggleStroke.Transparency = 1 end

				local Switch = Create("Frame", {
					Size = UDim2.fromOffset(30, 16),
					Position = UDim2.new(1, -38, 0.5, -8),
					BackgroundColor3 = Theme.Border,
					BorderSizePixel = 0
				}, Button)

				Corner(Switch, 20)
				local SwitchStroke = Stroke(Switch, 0.42)

				RegisterTheme(Switch, {
					BackgroundColor3 = "Border"
				})

				local Knob = Create("Frame", {
					Size = UDim2.fromOffset(10, 10),
					Position = UDim2.fromOffset(3, 3),
					BackgroundColor3 = Theme.Text,
					BorderSizePixel = 0
				}, Switch)

				Corner(Knob, 20)
				local KnobScale = Create("UIScale", {Scale = 1}, Knob)

				RegisterTheme(Knob, {
					BackgroundColor3 = "Text"
				})

				local function Update(state, callback)
					Value = not not state
					SetOptionState(Args.Name, Value)

					Tween(Switch, {
						BackgroundColor3 = Value and Theme.Accent or Theme.Border,
						BackgroundTransparency = Value and 0.04 or 0.28
					}, 0.16)

					Tween(SwitchStroke, {
						Color = Value and Theme.Accent or Theme.Border,
						Transparency = Value and 0.16 or 0.55
					}, 0.16)

					Tween(Knob, {
						Position = Value
							and UDim2.new(1, -13, 0, 3)
							or UDim2.fromOffset(3, 3),
						BackgroundTransparency = Value and 0 or 0.08
					}, 0.16)
					Tween(KnobScale, {Scale = Value and 1.08 or 1}, 0.16)

					if callback then
						Protect(Args.Callback, Value)
					end
				end

				Track(Button.MouseEnter:Connect(function()
					Tween(Switch, {
						BackgroundTransparency = Value and 0 or 0.16
					}, 0.12)
					Tween(KnobScale, {Scale = 1.12}, 0.12)
				end))

				Track(Button.MouseLeave:Connect(function()
					Tween(Switch, {
						BackgroundTransparency = Value and 0.04 or 0.28
					}, 0.14)
					Tween(KnobScale, {Scale = Value and 1.08 or 1}, 0.14)
				end))

				Track(Button.MouseButton1Click:Connect(function()
					Update(not Value, true)
				end))

				Update(Value, false)

				return {
					Instance = Button,

					SetValue = function(_, state)
						Update(state, true)
					end,

					GetValue = function()
						return Value
					end
				}
			end

			function SectionObject:AddSlider(Args)
				Args = Args or {}

				local Min = Args.Min or 0
				local Max = Args.Max or 100

				assert(Max > Min, "Slider Max must be greater than Min")

				local Decimals = Args.Decimals or 0
				local Value = Clamp(Args.Default or Min, Min, Max)

				local Holder = MakeElement(47)
				ApplyVisibleWhen(Holder, Args); RegisterSearchItem(Args.Name or Args.Title or "Option", Holder); AttachTooltip(Holder, Args.Tooltip)

				local SliderName = Label(
					Holder,
					Args.Name or "Slider",
					UDim2.new(0.65, 0, 0, 16),
					UDim2.fromOffset(2, 0),
					10,
					Theme.Text
				)
				RegisterTheme(SliderName, {TextColor3 = "Text"})

				local ValueLabel = Label(
					Holder,
					tostring(Value),
					UDim2.new(0.35, -2, 0, 16),
					UDim2.new(0.65, 0, 0, 0),
					10,
					Theme.Text
				)
				RegisterTheme(ValueLabel, {TextColor3 = "Text"})

				ValueLabel.TextXAlignment = Enum.TextXAlignment.Right

				local Bar = Create("Frame", {
					Size = UDim2.new(1, 0, 0, 5),
					Position = UDim2.fromOffset(0, 29),
					BackgroundColor3 = Theme.Element,
					BorderSizePixel = 0
				}, Holder)

				Corner(Bar, 10)
				Stroke(Bar, 0)
				RegisterTheme(Bar, {
					BackgroundColor3 = "Element"
				})

				local Percentage = (Value - Min) / (Max - Min)

				local Fill = Create("Frame", {
					Size = UDim2.new(Percentage, 0, 1, 0),
					BackgroundColor3 = Theme.Accent,
					BorderSizePixel = 0
				}, Bar)

				Corner(Fill, 10)

				RegisterTheme(Fill, {
					BackgroundColor3 = "Accent"
				})

				local Knob = Create("Frame", {
					Size = UDim2.fromOffset(11, 11),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(Percentage, 0, 0.5, 0),
					BackgroundColor3 = Theme.Text,
					BorderSizePixel = 0
				}, Bar)

				Corner(Knob, 20)

				RegisterTheme(Knob, {
					BackgroundColor3 = "Text"
				})

				local Hitbox = Create("TextButton", {
					Size = UDim2.new(1, 0, 0, 20),
					Position = UDim2.fromOffset(0, 23),
					BackgroundTransparency = 1,
					Text = ""
				}, Holder)

				local function UpdateValue(newValue, callback)
					Value = Round(Clamp(newValue, Min, Max), Decimals)

					local percentage = (Value - Min) / (Max - Min)

					Tween(Fill, {
						Size = UDim2.new(percentage, 0, 1, 0)
					}, 0.06)

					Tween(Knob, {
						Position = UDim2.new(percentage, 0, 0.5, 0)
					}, 0.06)

					ValueLabel.Text = tostring(Value)

					if callback then
						Protect(Args.Callback, Value)
					end
				end

				Hitbox.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1
						or input.UserInputType == Enum.UserInputType.Touch then

						WindowObject.ActiveSlider = function(x)
							local percentage = Clamp(
								(x - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X,
								0,
								1
							)

							UpdateValue(
								Min + (Max - Min) * percentage,
								true
							)
						end

						WindowObject.ActiveSlider(input.Position.X)
					end
				end)

				return {
					Instance = Holder,

					SetValue = function(_, value)
						UpdateValue(value, true)
					end,

					GetValue = function()
						return Value
					end
				}
			end

			function SectionObject:AddDropdown(Args)
				Args = Args or {}

				local Values = Args.Values or {}
				local Multi = Args.Multi == true or Args.MultiSelect == true
				local Selected = {}

				if Multi then
					for _, value in ipairs(Args.Default or {}) do
						Selected[value] = true
					end
				elseif Args.Default ~= nil then
					Selected[Args.Default] = true
				end

				local Holder = Create("Frame", {
					Size = UDim2.new(1, 0, 0, 31),
					BackgroundTransparency = 1,
					ClipsDescendants = true
				}, Elements)
				ApplyVisibleWhen(Holder, Args)
				RegisterSearchItem(Args.Name or "Dropdown", Holder)
				AttachTooltip(Holder, Args.Tooltip)

				local Button = Create("TextButton", {
					Size = UDim2.new(1, 0, 0, 31),
					BackgroundColor3 = Theme.Element,
					BackgroundTransparency = 0,
					BorderSizePixel = 0,
					Text = Args.Name or "Dropdown",
					TextColor3 = Theme.Text,
					TextSize = 10,
					Font = Enum.Font.GothamMedium,
					AutoButtonColor = false
				}, Holder)

				Corner(Button, 7)
				Stroke(Button, 0.18, Enum.BorderStrokePosition.Inner)
				AnimateButton(Button)
				AddPadding(Button, 9, 8, 0, 0)

				RegisterTheme(Button, {
					BackgroundColor3 = "Element",
					TextColor3 = "Text"
				})

				local Selection = Label(
					Button,
					"",
					UDim2.new(0.4, -22, 1, 0),
					UDim2.new(0.6, -22, 0, 0),
					9,
					Theme.SubText
				)

				Selection.TextXAlignment = Enum.TextXAlignment.Right
				Selection.TextTruncate = Enum.TextTruncate.AtEnd

				RegisterTheme(Selection, {
					TextColor3 = "SubText"
				})

				local Arrow = Label(
					Button,
					"^",
					UDim2.fromOffset(20, 27),
					UDim2.new(1, -23, 0, 2),
					14,
					Theme.SubText
				)

				Arrow.TextXAlignment = Enum.TextXAlignment.Center

				RegisterTheme(Arrow, {
					TextColor3 = "SubText"
				})

				local Options = Create("Frame", {
					Size = UDim2.new(1, 0, 0, 0),
					Position = UDim2.fromOffset(0, 36),
					BackgroundColor3 = Theme.Section,
					BorderSizePixel = 0,
					ClipsDescendants = true
				}, Holder)

				Corner(Options, 5)
				Stroke(Options)

				RegisterTheme(Options, {
					BackgroundColor3 = "Section"
				})

				Create("UIListLayout", {
					Padding = UDim.new(0, 3),
					SortOrder = Enum.SortOrder.LayoutOrder
				}, Options)

				AddPadding(Options, 5, 5, 5, 5)

				local Open = false
				local OptionButtons = {}
				local Animation
				local HolderAnimation

				local OptionHeight = 25
				local OptionGap = 3
				local OptionPadding = 10
				local OptionsHeight = 0

				local function CalculateHeight()
					if #Values == 0 then
						return 0
					end

					return #Values * OptionHeight
						+ (#Values - 1) * OptionGap
						+ OptionPadding
				end

				local function GetValue()
					if not Multi then
						for value, selected in pairs(Selected) do
							if selected then
								return value
							end
						end

						return nil
					end

					local result = {}

					for value, selected in pairs(Selected) do
						if selected then
							table.insert(result, value)
						end
					end

					table.sort(result)

					return result
				end

				local function Refresh()
					local result = {}

					for value, selected in pairs(Selected) do
						if selected then
							table.insert(result, tostring(value))
						end
					end

					table.sort(result)

					if Multi and #result > 1 then
						Selection.Text = tostring(#result) .. " selected"
					else
						Selection.Text = #result > 0 and (result[1] or "") or "None"
					end

					for value, option in pairs(OptionButtons) do
						local selected = Selected[value] == true

						option.BackgroundColor3 = selected and Theme.Accent or Theme.Element
						option.TextColor3 = Theme.Text
					end
				end

				local function SetOpen(state)
					if Open == state then return end

					Open = state

					if Animation then
						Animation:Cancel()
					end

					if HolderAnimation then
						HolderAnimation:Cancel()
					end

					local optionsHeight = state and OptionsHeight or 0
					local holderHeight = state and (36 + OptionsHeight) or 31

					if not AnimationSettings.Enabled then
						Options.Size = UDim2.new(1, 0, 0, optionsHeight)
						Holder.Size = UDim2.new(1, 0, 0, holderHeight)
						Animation, HolderAnimation = nil, nil
					else
						local info = TweenInfo.new(0.2 * AnimationSettings.Speed, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						Animation = TS:Create(Options, info, {Size = UDim2.new(1, 0, 0, optionsHeight)})
						HolderAnimation = TS:Create(Holder, info, {Size = UDim2.new(1, 0, 0, holderHeight)})
						Animation:Play()
						HolderAnimation:Play()
					end

					Tween(Arrow, {
						Rotation = state and 180 or 0
					}, 0.18)
				end

				local function Choose(value)
					if Multi then
						Selected[value] = not Selected[value]
					else
						Selected = {
							[value] = true
						}

						SetOpen(false)
					end

					Refresh()
					Protect(Args.Callback, GetValue())
				end

				local function BuildOptions()
					for _, option in pairs(OptionButtons) do
						option:Destroy()
					end

					OptionButtons = {}

					for _, value in ipairs(Values) do
						local Option = Create("TextButton", {
							Size = UDim2.new(1, 0, 0, OptionHeight),
							BackgroundColor3 = Theme.Element,
							BorderSizePixel = 0,
							Text = tostring(value),
							TextColor3 = Theme.Text,
							TextSize = 10,
							Font = Enum.Font.Gotham,
							AutoButtonColor = false
						}, Options)

						Corner(Option, 5)
						Stroke(Option, 0.18, Enum.BorderStrokePosition.Inner)
						AnimateButton(Option)
						AddPadding(Option, 7, 5, 0, 0)

						RegisterTheme(Option, {TextColor3 = "Text"}, function()
							local selected = Selected[value] == true
							Option.BackgroundColor3 = selected and Theme.Accent or Theme.Element
							Option.TextColor3 = Theme.Text
						end)

						OptionButtons[value] = Option

						Track(Option.MouseButton1Click:Connect(function()
							Choose(value)
						end))

						Track(Option.MouseEnter:Connect(function()
							if not Selected[value] then
								Tween(Option, {BackgroundColor3 = Theme.Hover}, 0.1)
							end
						end))

						Track(Option.MouseLeave:Connect(function()
							local selected = Selected[value] == true
							Tween(Option, {BackgroundColor3 = selected and Theme.Accent or Theme.Element}, 0.1)
						end))
					end

					OptionsHeight = CalculateHeight()
					Refresh()
				end

				Track(Button.MouseButton1Click:Connect(function()
					SetOpen(not Open)
				end))

				BuildOptions()

				return {
					Instance = Button,

					SetValue = function(_, value)
						if Multi then
							Selected = {}

							for _, item in ipairs(value or {}) do
								Selected[item] = true
							end
						else
							Selected = {}

							if value ~= nil then
								Selected[value] = true
							end
						end

						Refresh()
						Protect(Args.Callback, GetValue())
					end,

					GetValue = GetValue,

					SetOptions = function(_, newValues)
						Values = newValues or {}
						BuildOptions()

						if Open then
							Options.Size = UDim2.new(
								1, 0, 0, OptionsHeight
							)

							Holder.Size = UDim2.new(
								1, 0, 0, 36 + OptionsHeight
							)
						end
					end
				}
			end

			function SectionObject:AddTextbox(Args)
				Args = Args or {}

				local Holder = MakeElement(47)
				ApplyVisibleWhen(Holder, Args); RegisterSearchItem(Args.Name or Args.Title or "Option", Holder); AttachTooltip(Holder, Args.Tooltip)

				Label(
					Holder,
					Args.Name or "Textbox",
					UDim2.new(1, 0, 0, 16),
					UDim2.fromOffset(2, 0),
					10
				)

				local Box = Create("TextBox", {
					Size = UDim2.new(1, 0, 0, 27),
					Position = UDim2.fromOffset(0, 19),
					BackgroundColor3 = Theme.Element,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Text = Args.Default or "",
					PlaceholderText = Args.Placeholder or "Enter text...",
					PlaceholderColor3 = Theme.SubText,
					TextColor3 = Theme.Text,
					TextSize = 10,
					Font = Enum.Font.Gotham,
					ClearTextOnFocus = Args.ClearOnFocus or false
				}, Holder)

				Corner(Box, 7)
				Stroke(Box, 0)
				AddPadding(Box, 8, 8, 0, 0)

				RegisterTheme(Box, {
					BackgroundColor3 = "Element",
					TextColor3 = "Text",
					PlaceholderColor3 = "SubText"
				})

				Track(Box.FocusLost:Connect(function(enterPressed)
					if Args.FireOnEnter and not enterPressed then
						return
					end

					Protect(Args.Callback, Box.Text)
				end))

				return {
					Instance = Box,

					SetValue = function(_, value)
						Box.Text = tostring(value)
						Protect(Args.Callback, Box.Text)
					end,

					GetValue = function()
						return Box.Text
					end
				}
			end

			function SectionObject:AddKeybind(Args)
				Args = Args or {}

				local Holder = MakeElement(31)
				ApplyVisibleWhen(Holder, Args); RegisterSearchItem(Args.Name or Args.Title or "Option", Holder); AttachTooltip(Holder, Args.Tooltip)
				local Button = MakeButton(Holder, Args.Name or "Keybind")
				Button.BackgroundTransparency = 1
				local keyStroke = Button:FindFirstChildOfClass("UIStroke")
				if keyStroke then keyStroke.Transparency = 1 end

				local Key = Args.Default or Enum.KeyCode.RightShift
				local Listening = false

				local KeyLabel = Label(
					Button,
					Key.Name,
					UDim2.fromOffset(100, 27),
					UDim2.new(1, -108, 0, 2),
					10,
					Theme.Text
				)

				KeyLabel.TextXAlignment = Enum.TextXAlignment.Right

				RegisterTheme(KeyLabel, {
					TextColor3 = "Text"
				})

				Track(Button.MouseButton1Click:Connect(function()
					Listening = true
					KeyLabel.Text = "Press any key.."
				end))

				Track(UIS.InputBegan:Connect(function(input, processed)
					if Listening then
						if input.UserInputType == Enum.UserInputType.Keyboard then
							Key = input.KeyCode
							KeyLabel.Text = Key.Name
							Listening = false

							Protect(Args.Callback, Key)
						end

						return
					end

					if not processed
						and not UIS:GetFocusedTextBox()
						and input.KeyCode == Key then

						Protect(Args.Changed, Key)
					end
				end))

				return {
					Instance = Button,

					SetValue = function(_, newKey)
						Key = newKey
						KeyLabel.Text = Key.Name
						Protect(Args.Callback, Key)
					end,

					GetValue = function()
						return Key
					end
				}
			end

			function SectionObject:AddLabel(Text)
				local Holder = MakeElement(22)

				local TextLabel = Label(
					Holder,
					Text or "Label",
					UDim2.new(1, 0, 1, 0),
					UDim2.fromOffset(2, 0),
					10,
					Theme.SubText
				)

				RegisterTheme(TextLabel, {
					TextColor3 = "SubText"
				})

				return {
					Instance = TextLabel,

					SetText = function(_, text)
						TextLabel.Text = text
					end
				}
			end

			function SectionObject:AddParagraph(Args)
				Args = Args or {}

				local Holder = MakeElement(0)
				ApplyVisibleWhen(Holder, Args); RegisterSearchItem(Args.Name or Args.Title or "Option", Holder); AttachTooltip(Holder, Args.Tooltip)
				Holder.AutomaticSize = Enum.AutomaticSize.Y

				local Heading = Label(
					Holder,
					Args.Title or "Paragraph",
					UDim2.new(1, 0, 0, 17),
					UDim2.fromOffset(2, 0),
					11
				)

				Heading.Font = Enum.Font.GothamBold

				local Description = Label(
					Holder,
					Args.Content or "",
					UDim2.new(1, 0, 0, 0),
					UDim2.fromOffset(2, 18),
					10,
					Theme.SubText
				)

				Description.AutomaticSize = Enum.AutomaticSize.Y
				Description.TextWrapped = true
				Description.TextYAlignment = Enum.TextYAlignment.Top

				RegisterTheme(Description, {
					TextColor3 = "SubText"
				})

				return {
					Instance = Holder,

					SetContent = function(_, content)
						Description.Text = content
					end,

					SetTitle = function(_, title)
						Heading.Text = title
					end
				}
			end

			return SectionObject
		end

		table.insert(Tabs, TabObject)

		if #Tabs == 1 then
			SelectTab()
		end

		return TabObject
	end

	local ConfigPanel
	local SearchInput = Create("TextBox", {
		Name = "NovexSearchInput", Size = UDim2.new(1, -315, 0, 27),
		Position = UDim2.fromOffset(150, 12), BackgroundColor3 = Theme.Element,
		BackgroundTransparency = 0.15, BorderSizePixel = 0, Text = "",
		PlaceholderText = "Search features...", PlaceholderColor3 = Theme.SubText,
		TextColor3 = Theme.Text, TextSize = 10, Font = Enum.Font.Gotham,
		ClearTextOnFocus = false, ZIndex = 8
	}, Header)
	Corner(SearchInput, 7); Stroke(SearchInput, 0.25); AddPadding(SearchInput, 9, 8, 0, 0)
	RegisterTheme(SearchInput, {BackgroundColor3 = "Element", TextColor3 = "Text", PlaceholderColor3 = "SubText"})

	local SearchPanel = Create("Frame", {
		Name = "NovexSearchResults", Size = UDim2.new(1, -315, 0, 220),
		Position = UDim2.fromOffset(150, 43), BackgroundColor3 = Theme.Section,
		BorderSizePixel = 0, Visible = false, ZIndex = 90
	}, Window)
	Corner(SearchPanel, 9); Stroke(SearchPanel, 0); RegisterTheme(SearchPanel, {BackgroundColor3 = "Section"}); AddGradient(SearchPanel, "Section", "Sidebar", 20)
	local SearchResults = Create("ScrollingFrame", {
		Size = UDim2.new(1, -12, 1, -12), Position = UDim2.fromOffset(6, 6),
		BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 2,
		ScrollBarImageColor3 = Theme.Accent, CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y, ZIndex = 91
	}, SearchPanel)
	local SearchLayout = Create("UIListLayout", {Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder}, SearchResults)
	local function RefreshSearch()
		for _, child in ipairs(SearchResults:GetChildren()) do
			if child ~= SearchLayout then child:Destroy() end
		end
		local query = string.lower((SearchInput.Text or ""):match("^%s*(.-)%s*$"))
		if query == "" then SearchPanel.Visible = false; return end
		local matches = {}
		for _, item in ipairs(SearchItems) do
			local haystack = string.lower(item.Name .. " " .. item.Section)
			if item.Holder and item.Holder.Parent and string.find(haystack, query, 1, true) then
				table.insert(matches, item)
			end
		end
		table.sort(matches, function(a, b)
			local an, bn = string.lower(a.Name), string.lower(b.Name)
			local ae, be = an == query, bn == query
			if ae ~= be then return ae end
			return an < bn
		end)
		SearchPanel.Visible = true
		for index, item in ipairs(matches) do
			local result = Create("TextButton", {
				Size = UDim2.new(1, -2, 0, 29), BackgroundColor3 = Theme.Element,
				BorderSizePixel = 0, Text = item.Name .. "   ·   " .. item.Section,
				TextColor3 = Theme.Text, TextSize = 9, Font = Enum.Font.Gotham,
				TextXAlignment = Enum.TextXAlignment.Left, AutoButtonColor = false, LayoutOrder = index, ZIndex = 92
			}, SearchResults)
			Corner(result, 5); AddPadding(result, 8, 5, 0, 0)
			RegisterTheme(result, {BackgroundColor3 = "Element", TextColor3 = "Text"})
			Track(result.MouseEnter:Connect(function() Tween(result, {BackgroundColor3 = Theme.Hover}, 0.1) end))
			Track(result.MouseLeave:Connect(function() Tween(result, {BackgroundColor3 = Theme.Element}, 0.1) end))
			Track(result.MouseButton1Click:Connect(function()
				SearchPanel.Visible = false
				SearchInput:ReleaseFocus()
				item.Navigate()
			end))
		end
		if #matches == 0 then
			local empty = Label(SearchResults, "No matching features", UDim2.new(1, -4, 0, 28), UDim2.fromOffset(2, 0), 9, Theme.SubText)
			empty.ZIndex = 92
		end
	end
	Track(SearchInput:GetPropertyChangedSignal("Text"):Connect(RefreshSearch))
	Track(SearchInput.Focused:Connect(function() if SearchInput.Text ~= "" then RefreshSearch() end end))
	Track(UIS.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and SearchPanel.Visible then
			local p, z = input.Position, SearchPanel.AbsolutePosition
			local size = SearchPanel.AbsoluteSize
			if p.X < z.X or p.X > z.X + size.X or p.Y < z.Y or p.Y > z.Y + size.Y then
				if not SearchInput:IsFocused() then SearchPanel.Visible = false end
			end
		end
	end))

	ConfigPanel = Create("Frame", {
		Name = "NovexConfigPanel", Size = UDim2.fromOffset(238, 226),
		Position = UDim2.new(1, -250, 0, 44), BackgroundColor3 = Theme.Section,
		BorderSizePixel = 0, Visible = false, ZIndex = 90
	}, Window)
	Corner(ConfigPanel, 10); Stroke(ConfigPanel, 0); AddGradient(ConfigPanel, "Section", "Sidebar", 25)
	RegisterTheme(ConfigPanel, {BackgroundColor3 = "Section"})
	local ConfigTitle = Label(ConfigPanel, "Interface settings", UDim2.new(1, -20, 0, 22), UDim2.fromOffset(10, 7), 11)
	ConfigTitle.Font = Enum.Font.GothamBold; ConfigTitle.ZIndex = 92
	local function MakeConfigButton(text, y)
		local b = Create("TextButton", {Size = UDim2.new(1, -20, 0, 29), Position = UDim2.fromOffset(10, y), BackgroundColor3 = Theme.Element, BorderSizePixel = 0, Text = text, TextColor3 = Theme.Text, TextSize = 10, Font = Enum.Font.GothamMedium, AutoButtonColor = false, ZIndex = 92}, ConfigPanel)
		Corner(b, 6); Stroke(b, 0); AddPadding(b, 8, 8, 0, 0)
		RegisterTheme(b, {BackgroundColor3 = "Element", TextColor3 = "Text"})
		Track(b.MouseEnter:Connect(function() Tween(b, {BackgroundColor3 = Theme.Hover}, 0.1) end))
		Track(b.MouseLeave:Connect(function() Tween(b, {BackgroundColor3 = Theme.Element}, 0.1) end))
		return b
	end
	local AnimToggleButton = MakeConfigButton("Animations: ON", 35)
	Track(AnimToggleButton.MouseButton1Click:Connect(function()
		AnimationSettings.Enabled = not AnimationSettings.Enabled
		AnimToggleButton.Text = "Animations: " .. (AnimationSettings.Enabled and "ON" or "OFF")
	end))
	local SpeedLabel = Label(ConfigPanel, "Duration (higher = slower): 1.00x", UDim2.new(1, -20, 0, 18), UDim2.fromOffset(10, 70), 9, Theme.SubText); SpeedLabel.ZIndex = 92
	local SpeedBar = Create("Frame", {Size = UDim2.new(1, -20, 0, 5), Position = UDim2.fromOffset(10, 96), BackgroundColor3 = Theme.Element, BorderSizePixel = 0, ZIndex = 92}, ConfigPanel)
	Corner(SpeedBar, 5); Stroke(SpeedBar, 0); RegisterTheme(SpeedBar, {BackgroundColor3 = "Element"})
	local SpeedFill = Create("Frame", {Size = UDim2.new(0.245, 0, 1, 0), BackgroundColor3 = Theme.Accent, BorderSizePixel = 0, ZIndex = 93}, SpeedBar); Corner(SpeedFill, 5); RegisterTheme(SpeedFill, {BackgroundColor3 = "Accent"}); AddGradient(SpeedFill, "Accent", "Hover", 0)
	local SpeedHitbox = Create("TextButton", {Size = UDim2.new(1, 0, 0, 20), Position = UDim2.fromOffset(0, -7), BackgroundTransparency = 1, Text = "", ZIndex = 94}, SpeedBar)
	local function SetAnimationSpeed(x)
		local pct = math.clamp((x - SpeedBar.AbsolutePosition.X) / math.max(1, SpeedBar.AbsoluteSize.X), 0, 1)
		AnimationSettings.Speed = 0.35 + pct * 2.65
		SpeedFill.Size = UDim2.new(pct, 0, 1, 0)
		SpeedLabel.Text = string.format("Duration (higher = slower): %.2fx", AnimationSettings.Speed)
	end
	local draggingSpeed = false
	Track(SpeedHitbox.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then draggingSpeed = true; SetAnimationSpeed(input.Position.X) end end))
	Track(UIS.InputChanged:Connect(function(input) if draggingSpeed and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then SetAnimationSpeed(input.Position.X) end end))
	Track(UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then draggingSpeed = false end end))
	local KeyButton = MakeConfigButton("Toggle key: " .. ToggleKey.Name, 112)
	Track(KeyButton.MouseButton1Click:Connect(function() ListeningForToggleKey = true; KeyButton.Text = "Press a key..." end))
	local ScaleLabel = Label(ConfigPanel, "UI scale", UDim2.new(1, -20, 0, 18), UDim2.fromOffset(10, 151), 9, Theme.SubText); ScaleLabel.ZIndex = 92
	local ScaleDown = Create("TextButton", {Size = UDim2.fromOffset(30, 25), Position = UDim2.fromOffset(10, 180), BackgroundColor3 = Theme.Element, Text = "−", TextColor3 = Theme.Text, TextSize = 15, BorderSizePixel = 0, ZIndex = 92}, ConfigPanel)
	local ScaleUp = Create("TextButton", {Size = UDim2.fromOffset(30, 25), Position = UDim2.fromOffset(48, 180), BackgroundColor3 = Theme.Element, Text = "+", TextColor3 = Theme.Text, TextSize = 15, BorderSizePixel = 0, ZIndex = 92}, ConfigPanel)
	local ScaleValue = Label(ConfigPanel, string.format("%.2f", DefaultScale), UDim2.fromOffset(65, 25), UDim2.fromOffset(88, 180), 10, Theme.Text); ScaleValue.ZIndex = 92
	for _, b in ipairs({ScaleDown, ScaleUp}) do Corner(b, 5); Stroke(b, 0); RegisterTheme(b, {BackgroundColor3 = "Element", TextColor3 = "Text"}) end
	local function ChangeScale(delta)
		WindowObject:SetScale(math.clamp(DefaultScale + delta, 0.5, 1.5))
		ScaleValue.Text = string.format("%.2f", DefaultScale)
	end
	Track(ScaleDown.MouseButton1Click:Connect(function() ChangeScale(-0.05) end))
	Track(ScaleUp.MouseButton1Click:Connect(function() ChangeScale(0.05) end))
	Track(ConfigButton.MouseButton1Click:Connect(function()
		ConfigPanel.Visible = not ConfigPanel.Visible
		SearchPanel.Visible = false
	end))

	local ConfirmOverlay = Create("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Color3.new(0, 0, 0),
		BackgroundTransparency = 1,
		Visible = false,
		ZIndex = 20
	}, Window)

	local ConfirmBox = Create("Frame", {
		Size = UDim2.fromOffset(255, 122),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Theme.Section,
		BorderSizePixel = 0,
		ZIndex = 21
	}, ConfirmOverlay)

	Corner(ConfirmBox, 8)
	Stroke(ConfirmBox, 0)
	RegisterTheme(ConfirmBox, {
		BackgroundColor3 = "Section"
	})

	local ConfirmTitle = Label(
		ConfirmBox,
		"Close Novex?",
		UDim2.new(1, -20, 0, 22),
		UDim2.fromOffset(11, 9),
		13
	)

	ConfirmTitle.Font = Enum.Font.GothamBold
	ConfirmTitle.ZIndex = 22

	local ConfirmDescription = Label(
		ConfirmBox,
		"Are you sure you want to close the GUI?",
		UDim2.new(1, -20, 0, 25),
		UDim2.fromOffset(11, 32),
		10,
		Theme.SubText
	)

	ConfirmDescription.ZIndex = 22

	RegisterTheme(ConfirmDescription, {
		TextColor3 = "SubText"
	})

	local function ConfirmButton(text, position, color)
		local button = Create("TextButton", {
			Size = UDim2.fromOffset(106, 28),
			Position = position,
			BackgroundColor3 = color,
			Text = text,
			TextColor3 = Theme.Text,
			TextSize = 10,
			Font = Enum.Font.GothamBold,
			BorderSizePixel = 0,
			ZIndex = 22,
			AutoButtonColor = false
		}, ConfirmBox)

		Corner(button, 5)
		Stroke(button, 0)
		AnimateButton(button)

		return button
	end

	local YesButton = ConfirmButton(
		"Yes",
		UDim2.fromOffset(11, 82),
		Color3.fromRGB(220, 65, 75)
	)

	local NoButton = ConfirmButton(
		"Cancel",
		UDim2.fromOffset(138, 82),
		Theme.Element
	)

	RegisterTheme(NoButton, {
		BackgroundColor3 = "Element",
		TextColor3 = "Text"
	})

	local ConfirmOpen = false

	local function OpenConfirmation()
		if ConfirmOpen then return end

		ConfirmOpen = true
		ConfirmOverlay.Visible = true
		ConfirmOverlay.BackgroundTransparency = 1
		ConfirmBox.Size = UDim2.fromOffset(235, 112)

		Tween(ConfirmOverlay, {
			BackgroundTransparency = 0.4
		}, 0.18)

		Tween(ConfirmBox, {
			Size = UDim2.fromOffset(255, 122)
		}, 0.2)
	end

	local function CloseConfirmation()
		if not ConfirmOpen then return end

		ConfirmOpen = false

		Tween(ConfirmOverlay, {
			BackgroundTransparency = 1
		}, 0.14)

		Tween(ConfirmBox, {
			Size = UDim2.fromOffset(235, 112)
		}, 0.14)

		task.delay(0.15, function()
			if ConfirmOverlay.Parent and not ConfirmOpen then
				ConfirmOverlay.Visible = false
			end
		end)
	end

	Track(Close.MouseButton1Click:Connect(OpenConfirmation))
	Track(NoButton.MouseButton1Click:Connect(CloseConfirmation))

	Track(YesButton.MouseButton1Click:Connect(function()
		WindowObject:Destroy()
	end))

	Track(Minimize.MouseButton1Click:Connect(ToggleWindow))

	local Dragging = false
	local DragStart
	local StartPosition

	local function IsInteractive(object)
		local current = object

		while current and current ~= Window do
			if current:IsA("GuiButton") or current:IsA("TextBox") then

				return true
			end

			current = current.Parent
		end

		return false
	end

	Track(UIS.InputBegan:Connect(function(input)
		if not IsOpen or ConfirmOpen or Destroyed then
			return
		end

		if input.UserInputType ~= Enum.UserInputType.MouseButton1
			and input.UserInputType ~= Enum.UserInputType.Touch then

			return
		end

		local objects = PlayerGui:GetGuiObjectsAtPosition(
			input.Position.X,
			input.Position.Y
		)

		local hitWindow, blocked = false, false
		for _, object in ipairs(objects) do
			if object == Window or object:IsDescendantOf(Window) then
				hitWindow = true
				if IsInteractive(object) then blocked = true end
			end
		end
		if not hitWindow or blocked then return end

		Dragging = true
		DragStart = input.Position
		StartPosition = Window.Position
	end))

	Track(UIS.InputChanged:Connect(function(input)
		if not IsOpen then return end

		if input.UserInputType == Enum.UserInputType.MouseMovement
			or input.UserInputType == Enum.UserInputType.Touch then

			if WindowObject.ActiveSlider then
				WindowObject.ActiveSlider(input.Position.X)
			end

			if Dragging then
				local Delta = input.Position - DragStart

				local target = UDim2.new(
					StartPosition.X.Scale,
					StartPosition.X.Offset + Delta.X,
					StartPosition.Y.Scale,
					StartPosition.Y.Offset + Delta.Y
				)

				Window.Position = target
			end
		end
	end))

	Track(UIS.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then

			Dragging = false
			WindowObject.ActiveSlider = nil
		end
	end))

	Track(UIS.InputBegan:Connect(function(input, processed)
		if ListeningForToggleKey and input.UserInputType == Enum.UserInputType.Keyboard then
			ToggleKey = input.KeyCode
			ListeningForToggleKey = false
			if KeyButton and KeyButton.Parent then KeyButton.Text = "Toggle key: " .. ToggleKey.Name end
			return
		end
		if processed or Destroyed then return end
		if UIS:GetFocusedTextBox() then return end

		if input.KeyCode == ToggleKey then
			ToggleWindow()
		end
	end))

	-- Active toggles are shown in the top-right, opposite the default top-left watermark.
	local ActiveFeatureRows = {}
	local activeFeatureOrder = 0
	local ActiveFeaturesHolder = Create("Frame", {
		Name = "NovexActiveFeatures",
		Size = UDim2.fromOffset(220, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = UDim2.new(1, -12, 0, 12),
		AnchorPoint = Vector2.new(1, 0),
		BackgroundColor3 = Theme.Section,
		BackgroundTransparency = 0.06,
		BorderSizePixel = 0,
		Visible = false,
		ZIndex = 180
	}, MainGui)
	Corner(ActiveFeaturesHolder, 10)
	Stroke(ActiveFeaturesHolder, 0.12)
	AddGradient(ActiveFeaturesHolder, "Section", "Sidebar", 0)
	RegisterTheme(ActiveFeaturesHolder, {BackgroundColor3 = "Section"})
	local activeHeader = Label(ActiveFeaturesHolder, "ACTIVE FEATURES", UDim2.new(1, -18, 0, 22), UDim2.fromOffset(9, 4), 9, Theme.SubText)
	activeHeader.Font = Enum.Font.GothamBold
	activeHeader.ZIndex = 181
	RegisterTheme(activeHeader, {TextColor3 = "SubText"})
	local ActiveFeatureList = Create("Frame", {
		Name = "FeatureList",
		Size = UDim2.new(1, -12, 0, 0),
		Position = UDim2.fromOffset(6, 28),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		ZIndex = 181
	}, ActiveFeaturesHolder)
	Create("UIListLayout", {
		Padding = UDim.new(0, 4),
		SortOrder = Enum.SortOrder.LayoutOrder
	}, ActiveFeatureList)
	AddPadding(ActiveFeaturesHolder, 0, 0, 0, 7)

	RefreshActiveFeatures = function(name, enabled)
		if not name or tostring(name) == "" then return end
		local row = ActiveFeatureRows[name]
		if enabled and not row then
			activeFeatureOrder += 1
			row = Create("Frame", {
				Name = "ActiveFeature",
				Size = UDim2.new(1, 0, 0, 21),
				BackgroundColor3 = Theme.Element,
				BackgroundTransparency = 0.28,
				BorderSizePixel = 0,
				LayoutOrder = activeFeatureOrder,
				ZIndex = 182
			}, ActiveFeatureList)
			Corner(row, 6)
			RegisterTheme(row, {BackgroundColor3 = "Element"})
			local dot = Create("Frame", {
				Size = UDim2.fromOffset(6, 6),
				Position = UDim2.fromOffset(8, 7.5),
				BackgroundColor3 = Theme.Accent,
				BorderSizePixel = 0,
				ZIndex = 183
			}, row)
			Corner(dot, 6)
			RegisterTheme(dot, {BackgroundColor3 = "Accent"})
			local label = Label(row, tostring(name), UDim2.new(1, -25, 1, 0), UDim2.fromOffset(20, 0), 9, Theme.Text)
			label.ZIndex = 183
			RegisterTheme(label, {TextColor3 = "Text"})
			ActiveFeatureRows[name] = row
			row.BackgroundTransparency = 1
			Tween(row, {BackgroundTransparency = 0.28}, 0.18)
		elseif not enabled and row then
			ActiveFeatureRows[name] = nil
			Tween(row, {BackgroundTransparency = 1}, 0.14)
			task.delay(0.16, function()
				if row and row.Parent then
					UnregisterThemeTree(row)
					row:Destroy()
				end
			end)
		end
		ActiveFeaturesHolder.Visible = next(ActiveFeatureRows) ~= nil
	end

	local NotificationHolder = Create("Frame", {
		Name = "NovexNotifications", Size = UDim2.fromOffset(320, 0),
		AutomaticSize = Enum.AutomaticSize.Y, Position = UDim2.new(1, -12, 1, -12),
		AnchorPoint = Vector2.new(1, 1), BackgroundTransparency = 1,
		BorderSizePixel = 0, ZIndex = 300, Active = true
	}, MainGui)
	Create("UIListLayout", {Padding = UDim.new(0, 7), SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Bottom, HorizontalAlignment = Enum.HorizontalAlignment.Center}, NotificationHolder)
	local notificationCount, notificationDragging, notificationDragStart, notificationStartPosition = 0, false, nil, nil
	Track(UIS.InputChanged:Connect(function(input)
		if notificationDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - notificationDragStart
			NotificationHolder.Position = UDim2.new(notificationStartPosition.X.Scale, notificationStartPosition.X.Offset + delta.X, notificationStartPosition.Y.Scale, notificationStartPosition.Y.Offset + delta.Y)
		end
	end))
	Track(UIS.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then notificationDragging = false end
	end))
	function WindowObject:Notify(title, message, duration)
		if Destroyed then return nil end
		if type(title) == "table" then
			local data = title
			title = data.Title or data.Name or "Notification"
			message = data.Content or data.Message or data.Description or ""
			duration = data.Duration or data.Time or duration
		end
		title, message, duration = tostring(title or "Notification"), tostring(message or ""), tonumber(duration) or 4
		notificationCount += 1
		local toast = Create("Frame", {
			Name = "NovexNotification", Size = UDim2.new(1, 0, 0, message ~= "" and 66 or 40),
			BackgroundColor3 = Theme.Section, BackgroundTransparency = 0.03,
			BorderSizePixel = 0, ZIndex = 301, LayoutOrder = notificationCount, Active = true
		}, NotificationHolder)
		Corner(toast, 8); Stroke(toast, 0.12); RegisterTheme(toast, {BackgroundColor3 = "Section"}); AddGradient(toast, "Section", "Sidebar", 0)
		local accent = Create("Frame", {Size = UDim2.new(0, 3, 1, -12), Position = UDim2.fromOffset(6, 6), BackgroundColor3 = Theme.Accent, BorderSizePixel = 0, ZIndex = 302}, toast)
		Corner(accent, 3); RegisterTheme(accent, {BackgroundColor3 = "Accent"})
		local titleLabel = Label(toast, title, UDim2.new(1, -48, 0, 19), UDim2.fromOffset(16, 6), 10)
		titleLabel.Font = Enum.Font.GothamBold; titleLabel.ZIndex = 302
		if message ~= "" then
			local body = Label(toast, message, UDim2.new(1, -30, 0, 31), UDim2.fromOffset(16, 27), 9, Theme.SubText)
			body.TextWrapped = true; body.TextYAlignment = Enum.TextYAlignment.Top; body.ZIndex = 302
		end
		local close = Create("TextButton", {
			Size = UDim2.fromOffset(22, 22), Position = UDim2.new(1, -27, 0, 4),
			BackgroundTransparency = 1, BorderSizePixel = 0, Text = "×",
			TextColor3 = Theme.SubText, TextSize = 17, Font = Enum.Font.GothamMedium,
			AutoButtonColor = false, ZIndex = 304
		}, toast)
		RegisterTheme(close, {TextColor3 = "SubText"})
		local dismissed = false
		local fadeProperties = {}
		local function captureFadeProperties(object)
			if object:IsA("GuiObject") then table.insert(fadeProperties, {Object = object, Property = "BackgroundTransparency", Value = object.BackgroundTransparency}) end
			if object:IsA("TextLabel") or object:IsA("TextButton") or object:IsA("TextBox") then table.insert(fadeProperties, {Object = object, Property = "TextTransparency", Value = object.TextTransparency}) end
			if object:IsA("ImageLabel") or object:IsA("ImageButton") then table.insert(fadeProperties, {Object = object, Property = "ImageTransparency", Value = object.ImageTransparency}) end
			if object:IsA("UIStroke") then table.insert(fadeProperties, {Object = object, Property = "Transparency", Value = object.Transparency}) end
		end
		captureFadeProperties(toast)
		for _, child in ipairs(toast:GetDescendants()) do captureFadeProperties(child) end
		local function fadeToast(fadeOut, duration)
			for _, entry in ipairs(fadeProperties) do
				if entry.Object and entry.Object.Parent then
					Tween(entry.Object, {[entry.Property] = fadeOut and 1 or entry.Value}, duration)
				end
			end
		end
		local function dismiss()
			if dismissed or not toast.Parent then return end
			dismissed = true
			fadeToast(true, 0.28)
			task.delay(0.31, function()
				if toast.Parent then
					UnregisterThemeTree(toast)
					toast:Destroy()
				end
			end)
		end
		Track(close.MouseButton1Click:Connect(dismiss))
		Track(toast.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				local point, closePosition, closeSize = input.Position, close.AbsolutePosition, close.AbsoluteSize
				if point.X >= closePosition.X and point.X <= closePosition.X + closeSize.X and point.Y >= closePosition.Y and point.Y <= closePosition.Y + closeSize.Y then return end
				notificationDragging = true
				notificationDragStart = input.Position
				notificationStartPosition = NotificationHolder.Position
			end
		end))
		for _, entry in ipairs(fadeProperties) do
			if entry.Object and entry.Object.Parent then entry.Object[entry.Property] = 1 end
		end
		fadeToast(false, 0.28)
		task.delay(math.max(1, duration), dismiss)
		return toast
	end
	WindowObject.Notification = WindowObject.Notify
	WindowObject.CreateNotification = WindowObject.Notify
	GuiLib._activeWindow = WindowObject

	WindowObject.Instance = Window
	WindowObject.Tabs = Tabs
	WindowObject.ReopenButton = ReopenButton
	if type(Args.Watermark) == "table" then WindowObject:CreateWatermark(Args.Watermark) end

	function WindowObject:SetVisible(state)
		SetOpen(state)
	end

	function WindowObject:Toggle()
		ToggleWindow()
	end

	function WindowObject:GetVisible()
		return IsOpen
	end

	function WindowObject:SetScale(value)
		DefaultScale = Clamp(value, 0.5, 1.5)

		if TooltipScale then TooltipScale.Scale = DefaultScale end
		if IsOpen then
			AnimateScale(DefaultScale)
		end
	end

	function WindowObject:SetTheme(theme)
		GuiLib:SetTheme(theme)
	end

	function WindowObject:SetAnimationsEnabled(enabled)
		AnimationSettings.Enabled = not not enabled
	end

	function WindowObject:SetAnimationSpeed(speed)
		AnimationSettings.Speed = Clamp(tonumber(speed) or 1, 0.35, 3)
	end

	function WindowObject:SetToggleKey(key)
		assert(typeof(key) == "EnumItem" and key.EnumType == Enum.KeyCode, "Toggle key must be an Enum.KeyCode")
		ToggleKey = key
	end

	function WindowObject:GetToggleKey()
		return ToggleKey
	end

	function WindowObject:SetClosedIconEnabled(enabled, mobileOnly)
		ClosedIconEnabled = not not enabled
		if mobileOnly ~= nil then ClosedIconMobileOnly = not not mobileOnly end
		ReopenButton.Visible = not IsOpen and CanShowClosedIcon()
	end

	function WindowObject:SetClosedIconMobileOnly(enabled)
		ClosedIconMobileOnly = not not enabled
		ReopenButton.Visible = not IsOpen and CanShowClosedIcon()
	end

	function WindowObject:GetWatermark()
		return WatermarkObject
	end

	function WindowObject:Destroy()
		if Destroyed then return end

		Destroyed = true
		AnimationId += 1
		Dragging = false
		WindowObject.ActiveSlider = nil

		if AnimationConnection then
			AnimationConnection:Disconnect()
			AnimationConnection = nil
		end

		for _, connection in ipairs(Connections) do
			connection:Disconnect()
		end

		table.clear(Connections)
		if WatermarkObject then WatermarkObject:Destroy(); WatermarkObject = nil end

		MainGui:Destroy()
		table.clear(ThemeObjects)
	end

	return WindowObject
end

return GuiLib
