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
		Background = Color3.fromRGB(15, 15, 20),
		Sidebar = Color3.fromRGB(19, 19, 25),
		Section = Color3.fromRGB(24, 24, 31),
		Element = Color3.fromRGB(33, 33, 42),
		Hover = Color3.fromRGB(44, 44, 55),
		Accent = Color3.fromRGB(139, 92, 246),
		Text = Color3.fromRGB(248, 248, 252),
		SubText = Color3.fromRGB(155, 160, 178),
		Border = Color3.fromRGB(42, 42, 52)
	},
	Midnight = {
		Background = Color3.fromRGB(9, 12, 22),
		Sidebar = Color3.fromRGB(13, 17, 29),
		Section = Color3.fromRGB(17, 23, 37),
		Element = Color3.fromRGB(25, 33, 51),
		Hover = Color3.fromRGB(35, 46, 68),
		Accent = Color3.fromRGB(56, 189, 248),
		Text = Color3.fromRGB(240, 248, 255),
		SubText = Color3.fromRGB(148, 172, 200),
		Border = Color3.fromRGB(33, 44, 62)
	},
	Ocean = {
		Background = Color3.fromRGB(12, 22, 27),
		Sidebar = Color3.fromRGB(16, 29, 35),
		Section = Color3.fromRGB(21, 37, 43),
		Element = Color3.fromRGB(28, 49, 56),
		Hover = Color3.fromRGB(39, 65, 73),
		Accent = Color3.fromRGB(45, 212, 191),
		Text = Color3.fromRGB(240, 250, 248),
		SubText = Color3.fromRGB(150, 190, 185),
		Border = Color3.fromRGB(36, 60, 66)
	},
	Rose = {
		Background = Color3.fromRGB(23, 15, 22),
		Sidebar = Color3.fromRGB(31, 20, 29),
		Section = Color3.fromRGB(39, 25, 36),
		Element = Color3.fromRGB(53, 34, 48),
		Hover = Color3.fromRGB(70, 45, 63),
		Accent = Color3.fromRGB(244, 114, 182),
		Text = Color3.fromRGB(255, 240, 248),
		SubText = Color3.fromRGB(200, 158, 180),
		Border = Color3.fromRGB(72, 46, 64)
	},
	Light = {
		Background = Color3.fromRGB(245, 246, 250),
		Sidebar = Color3.fromRGB(235, 236, 242),
		Section = Color3.fromRGB(252, 252, 255),
		Element = Color3.fromRGB(228, 230, 238),
		Hover = Color3.fromRGB(214, 217, 228),
		Accent = Color3.fromRGB(116, 78, 210),
		Text = Color3.fromRGB(28, 28, 42),
		SubText = Color3.fromRGB(110, 112, 134),
		Border = Color3.fromRGB(210, 213, 225)
	},
	Crimson = {
		Background = Color3.fromRGB(21, 13, 16),
		Sidebar = Color3.fromRGB(30, 17, 21),
		Section = Color3.fromRGB(39, 22, 27),
		Element = Color3.fromRGB(54, 29, 36),
		Hover = Color3.fromRGB(72, 37, 45),
		Accent = Color3.fromRGB(239, 68, 68),
		Text = Color3.fromRGB(255, 240, 240),
		SubText = Color3.fromRGB(205, 160, 168),
		Border = Color3.fromRGB(74, 40, 47)
	},
	Sakura = {
		Background = Color3.fromRGB(30, 17, 29),
		Sidebar = Color3.fromRGB(38, 22, 37),
		Section = Color3.fromRGB(52, 29, 48),
		Element = Color3.fromRGB(72, 40, 66),
		Hover = Color3.fromRGB(96, 51, 84),
		Accent = Color3.fromRGB(255, 145, 202),
		Text = Color3.fromRGB(255, 241, 249),
		SubText = Color3.fromRGB(220, 170, 200),
		Border = Color3.fromRGB(105, 58, 92)
	},
	Pink = {
		Background = Color3.fromRGB(255, 220, 236),
		Sidebar = Color3.fromRGB(255, 187, 218),
		Section = Color3.fromRGB(255, 234, 244),
		Element = Color3.fromRGB(255, 202, 228),
		Hover = Color3.fromRGB(255, 168, 212),
		Accent = Color3.fromRGB(213, 38, 125),
		Text = Color3.fromRGB(74, 17, 48),
		SubText = Color3.fromRGB(150, 60, 100),
		Border = Color3.fromRGB(235, 103, 164)
	},
	Emerald = {
		Background = Color3.fromRGB(13, 21, 18),
		Sidebar = Color3.fromRGB(18, 29, 24),
		Section = Color3.fromRGB(23, 38, 31),
		Element = Color3.fromRGB(31, 51, 41),
		Hover = Color3.fromRGB(41, 68, 53),
		Accent = Color3.fromRGB(52, 211, 153),
		Text = Color3.fromRGB(238, 255, 245),
		SubText = Color3.fromRGB(148, 190, 165),
		Border = Color3.fromRGB(40, 65, 50)
	},
	Amethyst = {
		Background = Color3.fromRGB(19, 15, 28),
		Sidebar = Color3.fromRGB(26, 20, 39),
		Section = Color3.fromRGB(34, 26, 50),
		Element = Color3.fromRGB(46, 35, 66),
		Hover = Color3.fromRGB(60, 44, 86),
		Accent = Color3.fromRGB(167, 139, 250),
		Text = Color3.fromRGB(248, 244, 255),
		SubText = Color3.fromRGB(180, 165, 210),
		Border = Color3.fromRGB(62, 46, 86)
	},
	Nord = {
		Background = Color3.fromRGB(34, 39, 48),
		Sidebar = Color3.fromRGB(40, 46, 57),
		Section = Color3.fromRGB(46, 52, 64),
		Element = Color3.fromRGB(56, 64, 78),
		Hover = Color3.fromRGB(69, 78, 94),
		Accent = Color3.fromRGB(136, 192, 208),
		Text = Color3.fromRGB(236, 239, 244),
		SubText = Color3.fromRGB(170, 182, 200),
		Border = Color3.fromRGB(72, 81, 97)
	},
	Solarized = {
		Background = Color3.fromRGB(0, 40, 51),
		Sidebar = Color3.fromRGB(4, 48, 60),
		Section = Color3.fromRGB(7, 55, 66),
		Element = Color3.fromRGB(14, 66, 78),
		Hover = Color3.fromRGB(24, 80, 91),
		Accent = Color3.fromRGB(38, 139, 210),
		Text = Color3.fromRGB(238, 232, 213),
		SubText = Color3.fromRGB(155, 175, 178),
		Border = Color3.fromRGB(33, 78, 87)
	}
}

local THEME_KEYS = {
	"Background", "Sidebar", "Section", "Element",
	"Hover", "Accent", "Text", "SubText", "Border"
}

GuiLib.CustomThemes = GuiLib.CustomThemes or {}

function GuiLib:RegisterTheme(name, palette)
	assert(type(name) == "string" and name ~= "", "Theme name must be a non-empty string")
	assert(type(palette) == "table", "Theme palette must be a table")
	local resolved = {}
	for _, key in ipairs(THEME_KEYS) do
		local value = palette[key]
		assert(typeof(value) == "Color3", string.format(
			"Theme '%s' is missing Color3 field '%s'", name, key))
		resolved[key] = value
	end
	GuiLib.Themes[name] = resolved
	GuiLib.CustomThemes[name] = resolved
	return resolved
end

function GuiLib:RemoveTheme(name)
	if GuiLib.CustomThemes[name] then
		GuiLib.CustomThemes[name] = nil
		GuiLib.Themes[name] = nil
		return true
	end
	return false
end

function GuiLib:ListCustomThemes()
	local names = {}
	for name in pairs(GuiLib.CustomThemes) do
		table.insert(names, name)
	end
	table.sort(names)
	return names
end

function GuiLib:PatchTheme(overrides)
	assert(type(overrides) == "table", "PatchTheme expects a table")
	for key, value in pairs(overrides) do
		if typeof(value) == "Color3" then
			Theme[key] = value
		end
	end
	GuiLib:SetTheme(Theme)
end

function GuiLib:ExportTheme(name)
	local palette = GuiLib.Themes[name or self:GetThemeName()]
	if not palette then return nil end
	local out = {}
	for _, key in ipairs(THEME_KEYS) do
		local c = palette[key]
		out[key] = { math.floor(c.R * 255 + 0.5), math.floor(c.G * 255 + 0.5), math.floor(c.B * 255 + 0.5) }
	end
	return out
end

function GuiLib:GetThemeName()
	for name, palette in pairs(GuiLib.Themes) do
		if palette == Theme then return name end
	end
	return nil
end

local Theme = GuiLib.Themes.Dark
local ThemeObjects = {}
local ThemeObjectMap = {}

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
		Transparency = transparency or 0.35,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		BorderStrokePosition = borderPosition or Enum.BorderStrokePosition.Outer
	}, object)
	RegisterTheme(stroke, {Color = "Border"})
	return stroke
end

RegisterTheme = function(object, properties, callback)
	local entry = {
		Object = object,
		Properties = properties or {},
		Callback = callback
	}
	table.insert(ThemeObjects, entry)
	ThemeObjectMap[object] = entry
end

local function UnregisterThemeTree(root)
	if not root then return end
	local entry = ThemeObjectMap[root]
	if entry then
		ThemeObjectMap[root] = nil
		for index = #ThemeObjects, 1, -1 do
			if ThemeObjects[index] == entry then
				table.remove(ThemeObjects, index)
				break
			end
		end
	end
	for _, descendant in ipairs(root:GetDescendants()) do
		local dEntry = ThemeObjectMap[descendant]
		if dEntry then
			ThemeObjectMap[descendant] = nil
			for index = #ThemeObjects, 1, -1 do
				if ThemeObjects[index] == dEntry then
					table.remove(ThemeObjects, index)
					break
				end
			end
		end
	end
end

local AnimationSettings = {
	Enabled = true,
	Speed = 1
}

local function Tween(object, properties, duration, style, direction)
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
			style or Enum.EasingStyle.Quart,
			direction or Enum.EasingDirection.Out
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

-- ============================================================================
-- Theme API — custom themes from another script
-- ============================================================================
-- Expose the current theme
function GuiLib:GetTheme()
	return Theme
end

-- Register a custom theme by name (callable BEFORE CreateWindow, or any time after)
-- Usage from another script:
--   GuiLib:RegisterTheme("MyTheme", {
--       Background = Color3.fromRGB(...),
--       Sidebar = ...,
--       Section = ...,
--       Element = ...,
--       Hover = ...,
--       Accent = ...,
--       Text = ...,
--       SubText = ...,
--       Border = ...,
--   })
--   GuiLib:SetTheme("MyTheme")
function GuiLib:RegisterTheme(name, palette)
	assert(type(name) == "string" and name ~= "", "Theme name must be a non-empty string")
	assert(type(palette) == "table", "Theme palette must be a table")
	local defaults = GuiLib.Themes.Dark
	local resolved = {}
	for _, key in ipairs({
		"Background", "Sidebar", "Section", "Element", "Hover",
		"Accent", "Text", "SubText", "Border"
	}) do
		assert(typeof(palette[key]) == "Color3", string.format("Theme '%s' missing Color3 field '%s'", name, key))
		resolved[key] = palette[key]
	end
	GuiLib.Themes[name] = resolved
	return resolved
end

-- Merge overrides onto the current theme at runtime (e.g. accent color swap)
-- Usage: GuiLib:PatchTheme({ Accent = Color3.fromRGB(255, 80, 80) })
function GuiLib:PatchTheme(overrides)
	assert(type(overrides) == "table", "PatchTheme expects a table")
	for key, value in pairs(overrides) do
		if typeof(value) == "Color3" then
			Theme[key] = value
		end
	end
	GuiLib:SetTheme(Theme)
end

function GuiLib:SetTheme(theme)
	local newTheme = type(theme) == "string"
		and self.Themes[theme]
		or theme
	assert(type(newTheme) == "table", "Invalid Kyn theme")
	Theme = newTheme
	for index = #ThemeObjects, 1, -1 do
		local entry = ThemeObjects[index]
		local object = entry.Object
		if not object or not object.Parent then
			ThemeObjectMap[object] = nil
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

function GuiLib:Notify(title, message, duration)
	local active = self._activeWindow
	if active and active.Notify then
		return active:Notify(title, message, duration)
	end
	return nil
end

local MainGui = Create("ScreenGui", {
	Name = "Kyn",
	ResetOnSpawn = false,
	DisplayOrder = 1000,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling
}, PlayerGui)

function GuiLib:CreateWindow(Args)
	Args = Args or {}
	local WindowObject = {}
	local Connections = {}
	local Width = Args.Width or 560
	local Height = Args.Height or 380
	local DefaultScale = Args.Scale or 0.82
	local Destroyed = false

	local function Track(connection)
		table.insert(Connections, connection)
		return connection
	end

	-- Simple linear Quart press scale (no ripple)
	local function AnimateButton(button)
		if not button or button:FindFirstChild("KynPressScale") then return end
		local pressScale = Create("UIScale", {Name = "KynPressScale", Scale = 1}, button)
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

	Corner(Window, 14)
	local WindowStroke = Stroke(Window, 0)
	WindowStroke.Thickness = 1.5
	WindowStroke.Color = Theme.Border
	RegisterTheme(WindowStroke, {Color = "Border"})
	AddGradient(Window, "Background", "Sidebar", 35)
	RegisterTheme(Window, {BackgroundColor3 = "Background"})

	local Scale = Create("UIScale", {
		Scale = DefaultScale
	}, Window)

	local Header = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 50),
		BackgroundColor3 = Theme.Sidebar,
		BorderSizePixel = 0
	}, Window)
	Corner(Header, 14)
	Stroke(Header, 0.15)
	RegisterTheme(Header, {
		BackgroundColor3 = "Sidebar"
	})
	AddGradient(Header, "Sidebar", "Background", 0)
	AddPadding(Header, 16, 14, 0, 0)

	local Title = Label(
		Header,
		Args.Title or "Kyn",
		UDim2.new(1, -150, 0, 22),
		UDim2.fromOffset(0, 4),
		14
	)
	Title.Font = Enum.Font.GothamBold

	if Args.SubTitle and tostring(Args.SubTitle) ~= "" then
		local Subtitle = Label(
			Header,
			tostring(Args.SubTitle),
			UDim2.new(1, -150, 0, 15),
			UDim2.fromOffset(1, 25),
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
			BackgroundTransparency = 0.15,
			Text = text,
			TextColor3 = Theme.Text,
			TextSize = 15,
			Font = Enum.Font.GothamBold,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			ZIndex = 5
		}, Header)
		Corner(button, 7)
		Stroke(button, 0.3)
		AnimateButton(button)
		Track(button.MouseEnter:Connect(function()
			Tween(button, {BackgroundColor3 = Theme.Hover, BackgroundTransparency = 0, TextColor3 = Theme.Accent}, 0.12)
		end))
		Track(button.MouseLeave:Connect(function()
			Tween(button, {BackgroundColor3 = Theme.Element, BackgroundTransparency = 1, TextColor3 = Theme.Text}, 0.14)
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
	ConfigButton.TextSize = 13

	local Sidebar = Create("Frame", {
		Size = UDim2.new(0, 128, 1, -50),
		Position = UDim2.fromOffset(0, 50),
		BackgroundColor3 = Theme.Sidebar,
		BackgroundTransparency = 0.35,
		BorderSizePixel = 0
	}, Window)
	Corner(Sidebar, 14)
	Stroke(Sidebar, 0.55)
	AddGradient(Sidebar, "Sidebar", "Background", 90)
	RegisterTheme(Sidebar, {
		BackgroundColor3 = "Sidebar"
	})

	local TabList = Create("ScrollingFrame", {
		Size = UDim2.new(1, -16, 1, -18),
		Position = UDim2.fromOffset(8, 9),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 2,
		ScrollBarImageColor3 = Theme.Accent,
		ScrollBarImageTransparency = 0.6,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y
	}, Sidebar)

	Create("UIListLayout", {
		Padding = UDim.new(0, 3),
		SortOrder = Enum.SortOrder.LayoutOrder
	}, TabList)

	local Content = Create("Frame", {
		Size = UDim2.new(1, -138, 1, -60),
		Position = UDim2.fromOffset(128, 50),
		BackgroundTransparency = 1
	}, Window)

	local IsOpen = true
	local ToggleKey = Args.ToggleKey or Enum.KeyCode.RightShift
	local ListeningForToggleKey = false
	local SearchItems = {}
	local AnimationConnection
	local AnimationId = 0

	local InputHandlers = { Changed = {}, Ended = {}, Began = {} }
	local function AddInputHandler(kind, callback)
		table.insert(InputHandlers[kind], callback)
		return callback
	end
	local function RemoveInputHandler(kind, callback)
		local list = InputHandlers[kind]
		for i = #list, 1, -1 do
			if list[i] == callback then
				table.remove(list, i)
			end
		end
	end
	Track(UIS.InputChanged:Connect(function(input)
		for _, cb in ipairs(InputHandlers.Changed) do cb(input) end
	end))
	Track(UIS.InputEnded:Connect(function(input)
		for _, cb in ipairs(InputHandlers.Ended) do cb(input) end
	end))
	Track(UIS.InputBegan:Connect(function(input, processed)
		for _, cb in ipairs(InputHandlers.Began) do cb(input, processed) end
	end))

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
		Name = "KynReopen",
		Size = UDim2.fromOffset(46, 46),
		Position = UDim2.new(1, -56, 0.5, -23),
		BackgroundColor3 = Theme.Accent,
		Image = "rbxassetid://72927002403352",
		ImageColor3 = Color3.fromRGB(255, 255, 255),
		ScaleType = Enum.ScaleType.Fit,
		BorderSizePixel = 0,
		Visible = false,
		AutoButtonColor = false,
		ZIndex = 100
	}, MainGui)
	Corner(ReopenButton, 14)
	Stroke(ReopenButton, 0.2)
	AnimateButton(ReopenButton)
	AddPadding(ReopenButton, 8, 8, 8, 8)
	RegisterTheme(ReopenButton, {BackgroundColor3 = "Accent"})

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
		Tween(ReopenButton, {BackgroundColor3 = Theme.Hover, Size = UDim2.fromOffset(49, 49)})
	end))
	Track(ReopenButton.MouseLeave:Connect(function()
		Tween(ReopenButton, {BackgroundColor3 = Theme.Accent, Size = UDim2.fromOffset(46, 46)})
	end))

	local OptionStates = {}
	local VisibilityBindings = {}
	local TooltipFrame
	local TooltipScale

	local function EnsureTooltip()
		if TooltipFrame then return TooltipFrame end
		TooltipFrame = Create("Frame", {
			Name = "KynTooltip", AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromOffset(240, 0), BackgroundColor3 = Theme.Section,
			BorderSizePixel = 0, Visible = false, ZIndex = 250
		}, MainGui)
		TooltipScale = Create("UIScale", {Scale = Scale.Scale}, TooltipFrame)
		Corner(TooltipFrame, 7); Stroke(TooltipFrame, 0.15)
		AddPadding(TooltipFrame, 9, 9, 6, 6)
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
			Name = "KynWatermark",
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.fromOffset(0, 26),
			Position = options.Position or UDim2.fromOffset(12, 12),
			BackgroundColor3 = Theme.Section,
			BackgroundTransparency = 0.15,
			BorderSizePixel = 0,
			Active = true,
			ClipsDescendants = true,
			Visible = options.Enabled ~= false,
			ZIndex = 150
		}, MainGui)
		Corner(root, 8)
		local watermarkGradient = Create("UIGradient", {
			Color = ColorSequence.new(Theme.Section, Theme.Element), Rotation = 18
		}, root)
		local outline = Stroke(root, 0.25)
		outline.Thickness = 1
		RegisterTheme(root, {BackgroundColor3 = "Section"}, function()
			watermarkGradient.Color = ColorSequence.new(Theme.Section, Theme.Element)
		end)
		RegisterTheme(watermarkGradient, {}, function()
			watermarkGradient.Color = ColorSequence.new(Theme.Section, Theme.Element)
		end)
		local label = Create("TextLabel", {
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.fromOffset(0, 26),
			Position = UDim2.fromOffset(10, 0),
			BackgroundTransparency = 1,
			Text = tostring(options.Text or "Kyn | {fps} fps | {ping} ms"),
			TextColor3 = Theme.Text,
			TextSize = options.TextSize or 11,
			Font = Enum.Font.GothamSemibold,
			TextXAlignment = Enum.TextXAlignment.Left,
			Active = true,
			ZIndex = 151
		}, root)
		AddPadding(root, 11, 13, 0, 0)
		RegisterTheme(label, {TextColor3 = "Text"})

		local alive = true
		local lastUpdate = 0
		local fpsCounter = { frames = 0, since = os.clock(), last = 60 }
		local connection = RunService.Heartbeat:Connect(function()
			if not alive then return end
			local now = os.clock()
			fpsCounter.frames += 1
			if now - lastUpdate < 0.5 then
				return
			end
			lastUpdate = now
			if now - fpsCounter.since >= 0.5 then
				fpsCounter.last = math.floor(fpsCounter.frames / (now - fpsCounter.since) + 0.5)
				fpsCounter.frames = 0
				fpsCounter.since = now
			end
			local ping = "?"
			pcall(function()
				local item = Stats.Network.ServerStatsItem["Data Ping"]
				local value = item:GetValueString():match("[%d%.]+")
				if value then ping = tostring(math.floor(tonumber(value) + 0.5)) end
			end)
			label.Text = tostring(options.Text or "Kyn | {fps} fps | {ping} ms")
				:gsub("{fps}", tostring(fpsCounter.last)):gsub("{ping}", ping)
		end)

		local watermarkDragging, dragStart, startPos = false, nil, nil
		local function beginWatermarkDrag(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				watermarkDragging = true
				dragStart = input.Position
				startPos = root.Position
			end
		end
		local connBegan1 = root.InputBegan:Connect(beginWatermarkDrag)
		local connBegan2 = label.InputBegan:Connect(beginWatermarkDrag)

		local onChanged = function(input)
			if watermarkDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				local delta = input.Position - dragStart
				root.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			end
		end
		local onEnded = function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				watermarkDragging = false
			end
		end
		AddInputHandler("Changed", onChanged)
		AddInputHandler("Ended", onEnded)

		local function cleanupInput()
			connBegan1:Disconnect()
			connBegan2:Disconnect()
			RemoveInputHandler("Changed", onChanged)
			RemoveInputHandler("Ended", onEnded)
		end

		WatermarkObject = {Root = root, Label = label, Connection = connection, Outline = outline}
		function WatermarkObject:SetVisible(state) root.Visible = not not state end
		function WatermarkObject:SetText(value) options.Text = tostring(value); label.Text = options.Text end
		function WatermarkObject:Destroy()
			alive = false
			connection:Disconnect()
			cleanupInput()
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
			Size = UDim2.new(1, 0, 0, 28),
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
		AddPadding(TabButton, 10, 8, 0, 0)

		local TabIndicator = Create("Frame", {
    Size = UDim2.new(0, 2, 1, -8),
    Position = UDim2.fromOffset(-6, 4),
    BackgroundColor3 = Theme.Accent,
    BorderSizePixel = 0,
    ZIndex = TabButton.ZIndex + 1
}, TabButton)
		Corner(TabIndicator, 2)
		RegisterTheme(TabIndicator, {BackgroundColor3 = "Accent"})
		TabIndicator.BackgroundTransparency = 1

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
			ScrollBarThickness = 2,
			ScrollBarImageColor3 = Theme.Accent,
			ScrollBarImageTransparency = 0.5,
			CanvasSize = UDim2.new(),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			Visible = false
		}, Content)

		Create("UIListLayout", {
			Padding = UDim.new(0, 6),
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
				if SelectedTab.Indicator then
					Tween(SelectedTab.Indicator, {BackgroundTransparency = 1}, 0.12)
				end
			end
			SelectedTab = {
				Page = Page,
				Button = TabButton,
				Indicator = TabIndicator
			}
			Page.Visible = true
			Page.CanvasPosition = Vector2.zero
			if AnimationSettings.Enabled then
				Page.Position = UDim2.fromOffset(12, 0)
				TS:Create(Page, TweenInfo.new(0.26 * AnimationSettings.Speed, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
					Position = UDim2.fromOffset(0, 0)
				}):Play()
			end
			if SelectedSubTab then
				for _, sub in ipairs(SubTabs) do sub.Page.Visible = false end
				SelectedSubTab.Page.Visible = true
			end
			Tween(TabButton, {BackgroundTransparency = 1, TextColor3 = Theme.Accent})
			Tween(TabIndicator, {BackgroundTransparency = 0}, 0.14)
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
				SubTabBar = Create("Frame", {Name = "SubTabs", Size = UDim2.new(1, -16, 0, 24), Position = UDim2.fromOffset(8, 6), BackgroundTransparency = 1}, Page)
				Create("UIListLayout", {FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder}, SubTabBar)
				local pageLayout = Page:FindFirstChildOfClass("UIListLayout")
				if pageLayout then pageLayout:Destroy() end
				CurrentPage = Page
			end
			local sub = {}
			local button = Create("TextButton", {Size = UDim2.new(0, 84, 1, 0), BackgroundColor3 = Theme.Element, BackgroundTransparency = 1, Text = Name or "Subtab", TextColor3 = Theme.SubText, TextSize = 9, Font = Enum.Font.GothamSemibold, BorderSizePixel = 0, AutoButtonColor = false}, SubTabBar)
			AnimateButton(button)
			RegisterTheme(button, {BackgroundColor3 = "Element", TextColor3 = "SubText"}, function()
				local active = SelectedSubTab and SelectedSubTab.Button == button
				button.BackgroundTransparency = 1
				button.TextColor3 = active and Theme.Accent or Theme.SubText
			end)
			local subPage = Create("ScrollingFrame", {Name = tostring(Name or "Subtab"), Size = UDim2.new(1, 0, 1, -34), Position = UDim2.fromOffset(0, 34), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 2, ScrollBarImageColor3 = Theme.Accent, ScrollBarImageTransparency = 0.5, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, Visible = false}, Page)
			Create("UIListLayout", {Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder}, subPage); AddPadding(subPage, 8, 8, 8, 8)
			sub.Page = subPage; sub.Button = button
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
				BackgroundTransparency = 0.1,
				BorderSizePixel = 0
			}, CurrentPage)
			Corner(Section, 9)
			Stroke(Section, 0.4, Enum.BorderStrokePosition.Inner)
			AddGradient(Section, "Section", "Sidebar", 25)
			RegisterTheme(Section, {BackgroundColor3 = "Section"})

			local SectionTitle = Label(
				Section,
				Name or "Section",
				UDim2.new(1, -16, 0, 22),
				UDim2.fromOffset(11, 4),
				10,
				Theme.SubText
			)
			SectionTitle.Font = Enum.Font.GothamBold

			local Elements = Create("Frame", {
				Size = UDim2.new(1, -18, 0, 0),
				Position = UDim2.fromOffset(9, 28),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1
			}, Section)
			Create("UIListLayout", {
				Padding = UDim.new(0, 5),
				SortOrder = Enum.SortOrder.LayoutOrder
			}, Elements)
			AddPadding(Elements, 0, 0, 0, 9)

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
					BackgroundTransparency = 0.15,
					BorderSizePixel = 0,
					Text = text or "",
					TextColor3 = Theme.Text,
					TextSize = 10,
					Font = Enum.Font.GothamMedium,
					AutoButtonColor = false
				}, parent)
				Corner(button, 6)
				Stroke(button, 0.35)
				AnimateButton(button)
				AddPadding(button, 10, 9, 0, 0)
				RegisterTheme(button, {
					BackgroundColor3 = "Element",
					TextColor3 = "Text"
				})
				Track(button.MouseEnter:Connect(function()
					Tween(button, {BackgroundColor3 = Theme.Hover, BackgroundTransparency = 0})
				end))
				Track(button.MouseLeave:Connect(function()
					Tween(button, {BackgroundColor3 = Theme.Element, BackgroundTransparency = 1})
				end))
				return button
			end

			function SectionObject:AddButton(Args)
				Args = Args or {}
				local Holder = MakeElement(30)
				ApplyVisibleWhen(Holder, Args); RegisterSearchItem(Args.Name or Args.Title or "Option", Holder); AttachTooltip(Holder, Args.Tooltip)
				local Button = MakeButton(Holder, Args.Name or "Button")
				Track(Button.MouseButton1Click:Connect(function()
					Protect(Args.Callback)
				end))
				return {Instance = Button}
			end

			function SectionObject:AddToggle(Args)
				Args = Args or {}
				local Value = Args.Default or false
				local Holder = MakeElement(30)
				ApplyVisibleWhen(Holder, Args); RegisterSearchItem(Args.Name or Args.Title or "Option", Holder); AttachTooltip(Holder, Args.Tooltip)
				local Button = MakeButton(Holder, Args.Name or "Toggle")
				Button.BackgroundTransparency = 1
				local toggleStroke = Button:FindFirstChildOfClass("UIStroke")
				if toggleStroke then toggleStroke.Transparency = 1 end

				local Switch = Create("Frame", {
					Size = UDim2.fromOffset(28, 15),
					Position = UDim2.new(1, -36, 0.5, -7.5),
					BackgroundColor3 = Theme.Border,
					BorderSizePixel = 0
				}, Button)
				Corner(Switch, 20)
				local SwitchStroke = Stroke(Switch, 0.55)
				RegisterTheme(Switch, {BackgroundColor3 = "Border"})

				local Knob = Create("Frame", {
					Size = UDim2.fromOffset(9, 9),
					Position = UDim2.fromOffset(3, 3),
					BackgroundColor3 = Theme.Text,
					BorderSizePixel = 0
				}, Switch)
				Corner(Knob, 20)
				local KnobScale = Create("UIScale", {Scale = 1}, Knob)
				RegisterTheme(Knob, {BackgroundColor3 = "Text"})

				local function Update(state, callback)
					Value = not not state
					SetOptionState(Args.Name, Value)
					Tween(Switch, {
						BackgroundColor3 = Value and Theme.Accent or Theme.Border,
						BackgroundTransparency = Value and 0 or 0.35
					}, 0.16)
					Tween(SwitchStroke, {
						Color = Value and Theme.Accent or Theme.Border,
						Transparency = Value and 0.4 or 0.65
					}, 0.16)
					Tween(Knob, {
						Position = Value
							and UDim2.new(1, -12, 0, 3)
							or UDim2.fromOffset(3, 3),
						BackgroundTransparency = Value and 0 or 0.15
					}, 0.16)
					Tween(KnobScale, {Scale = Value and 1.05 or 1}, 0.16)
					if callback then
						Protect(Args.Callback, Value)
					end
				end

				Track(Button.MouseEnter:Connect(function()
					Tween(Switch, {BackgroundTransparency = Value and 0 or 0.22}, 0.12)
					Tween(KnobScale, {Scale = 1.1}, 0.12)
				end))
				Track(Button.MouseLeave:Connect(function()
					Tween(Switch, {BackgroundTransparency = Value and 0 or 0.35}, 0.14)
					Tween(KnobScale, {Scale = Value and 1.05 or 1}, 0.14)
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
				local Holder = MakeElement(45)
				ApplyVisibleWhen(Holder, Args); RegisterSearchItem(Args.Name or Args.Title or "Option", Holder); AttachTooltip(Holder, Args.Tooltip)

				local SliderName = Label(Holder, Args.Name or "Slider", UDim2.new(0.65, 0, 0, 16), UDim2.fromOffset(2, 0), 10, Theme.Text)
				RegisterTheme(SliderName, {TextColor3 = "Text"})
				local ValueLabel = Label(Holder, tostring(Value), UDim2.new(0.35, -2, 0, 16), UDim2.new(0.65, 0, 0, 0), 10, Theme.Text)
				RegisterTheme(ValueLabel, {TextColor3 = "Text"})
				ValueLabel.TextXAlignment = Enum.TextXAlignment.Right

				local Bar = Create("Frame", {
					Size = UDim2.new(1, 0, 0, 4),
					Position = UDim2.fromOffset(0, 28),
					BackgroundColor3 = Theme.Element,
					BackgroundTransparency = 0.2,
					BorderSizePixel = 0
				}, Holder)
				Corner(Bar, 10); Stroke(Bar, 0.4)
				RegisterTheme(Bar, {BackgroundColor3 = "Element"})

				local Percentage = (Value - Min) / (Max - Min)
				local Fill = Create("Frame", {
					Size = UDim2.new(Percentage, 0, 1, 0),
					BackgroundColor3 = Theme.Accent,
					BorderSizePixel = 0
				}, Bar)
				Corner(Fill, 10)
				RegisterTheme(Fill, {BackgroundColor3 = "Accent"})

				local Knob = Create("Frame", {
					Size = UDim2.fromOffset(11, 11),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(Percentage, 0, 0.5, 0),
					BackgroundColor3 = Theme.Text,
					BorderSizePixel = 0
				}, Bar)
				Corner(Knob, 20)
				RegisterTheme(Knob, {BackgroundColor3 = "Text"})

				local Hitbox = Create("TextButton", {
					Size = UDim2.new(1, 0, 0, 20),
					Position = UDim2.fromOffset(0, 22),
					BackgroundTransparency = 1,
					Text = ""
				}, Holder)

				local function UpdateValue(newValue, callback)
					Value = Round(Clamp(newValue, Min, Max), Decimals)
					local percentage = (Value - Min) / (Max - Min)
					Tween(Fill, {Size = UDim2.new(percentage, 0, 1, 0)}, 0.06)
					Tween(Knob, {Position = UDim2.new(percentage, 0, 0.5, 0)}, 0.06)
					ValueLabel.Text = tostring(Value)
					if callback then
						Protect(Args.Callback, Value)
					end
				end

				Hitbox.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1
						or input.UserInputType == Enum.UserInputType.Touch then
						WindowObject.ActiveSlider = function(x)
							local percentage = Clamp((x - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
							UpdateValue(Min + (Max - Min) * percentage, true)
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
					Size = UDim2.new(1, 0, 0, 30),
					BackgroundTransparency = 1,
					ClipsDescendants = true
				}, Elements)
				ApplyVisibleWhen(Holder, Args)
				RegisterSearchItem(Args.Name or "Dropdown", Holder)
				AttachTooltip(Holder, Args.Tooltip)

				local Button = Create("TextButton", {
					Size = UDim2.new(1, 0, 0, 30),
					BackgroundColor3 = Theme.Element,
					BackgroundTransparency = 0.15,
					BorderSizePixel = 0,
					Text = Args.Name or "Dropdown",
					TextColor3 = Theme.Text,
					TextSize = 10,
					Font = Enum.Font.GothamMedium,
					AutoButtonColor = false
				}, Holder)
				Corner(Button, 6)
				Stroke(Button, 0.35, Enum.BorderStrokePosition.Inner)
				AnimateButton(Button)
				AddPadding(Button, 10, 9, 0, 0)
				RegisterTheme(Button, {BackgroundColor3 = "Element", TextColor3 = "Text"})

				local Selection = Label(Button, "", UDim2.new(0.4, -22, 1, 0), UDim2.new(0.6, -22, 0, 0), 9, Theme.SubText)
				Selection.TextXAlignment = Enum.TextXAlignment.Right
				Selection.TextTruncate = Enum.TextTruncate.AtEnd
				RegisterTheme(Selection, {TextColor3 = "SubText"})

				local Arrow = Label(Button, "^", UDim2.fromOffset(20, 27), UDim2.new(1, -22, 0, 1), 14, Theme.SubText)
				Arrow.TextXAlignment = Enum.TextXAlignment.Center
				RegisterTheme(Arrow, {TextColor3 = "SubText"})

				local Options = Create("Frame", {
					Size = UDim2.new(1, 0, 0, 0),
					Position = UDim2.fromOffset(0, 34),
					BackgroundColor3 = Theme.Section,
					BackgroundTransparency = 0.1,
					BorderSizePixel = 0,
					ClipsDescendants = true
				}, Holder)
				Corner(Options, 5)
				Stroke(Options, 0.35)
				RegisterTheme(Options, {BackgroundColor3 = "Section"})

				Create("UIListLayout", {
					Padding = UDim.new(0, 2),
					SortOrder = Enum.SortOrder.LayoutOrder
				}, Options)
				AddPadding(Options, 4, 4, 4, 4)

				local Open = false
				local OptionButtons = {}
				local Animation
				local HolderAnimation
				local OptionHeight = 24
				local OptionGap = 2
				local OptionPadding = 8
				local OptionsHeight = 0

				local function CalculateHeight()
					if #Values == 0 then
						return 0
					end
					return #Values * OptionHeight + (#Values - 1) * OptionGap + OptionPadding
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
						option.BackgroundTransparency = selected and 0 or 0.2
						option.TextColor3 = Theme.Text
					end
				end

				local function SetOpen(state)
					if Open == state then return end
					Open = state
					if Animation then Animation:Cancel() end
					if HolderAnimation then HolderAnimation:Cancel() end
					local optionsHeight = state and OptionsHeight or 0
					local holderHeight = state and (34 + OptionsHeight) or 30
					if not AnimationSettings.Enabled then
						Options.Size = UDim2.new(1, 0, 0, optionsHeight)
						Holder.Size = UDim2.new(1, 0, 0, holderHeight)
						Animation, HolderAnimation = nil, nil
					else
						local info = TweenInfo.new(0.22 * AnimationSettings.Speed, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						Animation = TS:Create(Options, info, {Size = UDim2.new(1, 0, 0, optionsHeight)})
						HolderAnimation = TS:Create(Holder, info, {Size = UDim2.new(1, 0, 0, holderHeight)})
						Animation:Play()
						HolderAnimation:Play()
					end
					TS:Create(Arrow, TweenInfo.new(0.22, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = state and 180 or 0}):Play()
				end

				local function Choose(value)
					if Multi then
						Selected[value] = not Selected[value]
					else
						Selected = {[value] = true}
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
							BackgroundTransparency = 0.2,
							BorderSizePixel = 0,
							Text = tostring(value),
							TextColor3 = Theme.Text,
							TextSize = 10,
							Font = Enum.Font.Gotham,
							AutoButtonColor = false
						}, Options)
						Corner(Option, 5)
						Stroke(Option, 0.35, Enum.BorderStrokePosition.Inner)
						AnimateButton(Option)
						AddPadding(Option, 8, 6, 0, 0)
						RegisterTheme(Option, {TextColor3 = "Text"}, function()
							local selected = Selected[value] == true
							Option.BackgroundColor3 = selected and Theme.Accent or Theme.Element
							Option.BackgroundTransparency = selected and 0 or 0.2
							Option.TextColor3 = Theme.Text
						end)
						OptionButtons[value] = Option
						Track(Option.MouseButton1Click:Connect(function()
							Choose(value)
						end))
						Track(Option.MouseEnter:Connect(function()
							if not Selected[value] then
								Tween(Option, {BackgroundColor3 = Theme.Hover, BackgroundTransparency = 0}, 0.1)
							end
						end))
						Track(Option.MouseLeave:Connect(function()
							local selected = Selected[value] == true
							Tween(Option, {BackgroundColor3 = selected and Theme.Accent or Theme.Element, BackgroundTransparency = selected and 0 or 0.2}, 0.1)
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
							Options.Size = UDim2.new(1, 0, 0, OptionsHeight)
							Holder.Size = UDim2.new(1, 0, 0, 34 + OptionsHeight)
						end
					end
				}
			end

			function SectionObject:AddTextbox(Args)
				Args = Args or {}
				local Holder = MakeElement(45)
				ApplyVisibleWhen(Holder, Args); RegisterSearchItem(Args.Name or Args.Title or "Option", Holder); AttachTooltip(Holder, Args.Tooltip)
				Label(Holder, Args.Name or "Textbox", UDim2.new(1, 0, 0, 16), UDim2.fromOffset(2, 0), 10)

				local Box = Create("TextBox", {
					Size = UDim2.new(1, 0, 0, 26),
					Position = UDim2.fromOffset(0, 19),
					BackgroundColor3 = Theme.Element,
					BackgroundTransparency = 0.15,
					BorderSizePixel = 0,
					Text = Args.Default or "",
					PlaceholderText = Args.Placeholder or "Enter text...",
					PlaceholderColor3 = Theme.SubText,
					TextColor3 = Theme.Text,
					TextSize = 10,
					Font = Enum.Font.Gotham,
					ClearTextOnFocus = Args.ClearOnFocus or false
				}, Holder)
				Corner(Box, 6)
				Stroke(Box, 0.35)
				AddPadding(Box, 9, 9, 0, 0)
				RegisterTheme(Box, {BackgroundColor3 = "Element", TextColor3 = "Text", PlaceholderColor3 = "SubText"})
				Track(Box.FocusLost:Connect(function(enterPressed)
					if Args.FireOnEnter and not enterPressed then return end
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
				local Holder = MakeElement(30)
				ApplyVisibleWhen(Holder, Args); RegisterSearchItem(Args.Name or Args.Title or "Option", Holder); AttachTooltip(Holder, Args.Tooltip)
				local Button = MakeButton(Holder, Args.Name or "Keybind")
				Button.BackgroundTransparency = 1
				local keyStroke = Button:FindFirstChildOfClass("UIStroke")
				if keyStroke then keyStroke.Transparency = 1 end

				local Key = Args.Default or Enum.KeyCode.RightShift
				local Listening = false
				local KeyLabel = Label(Button, Key.Name, UDim2.fromOffset(100, 26), UDim2.new(1, -108, 0, 2), 10, Theme.Text)
				KeyLabel.TextXAlignment = Enum.TextXAlignment.Right
				RegisterTheme(KeyLabel, {TextColor3 = "Text"})

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
				local Holder = MakeElement(20)
				local TextLabel = Label(Holder, Text or "Label", UDim2.new(1, 0, 1, 0), UDim2.fromOffset(2, 0), 10, Theme.SubText)
				RegisterTheme(TextLabel, {TextColor3 = "SubText"})
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
				local Heading = Label(Holder, Args.Title or "Paragraph", UDim2.new(1, 0, 0, 16), UDim2.fromOffset(2, 0), 11)
				Heading.Font = Enum.Font.GothamBold
				local Description = Label(Holder, Args.Content or "", UDim2.new(1, 0, 0, 0), UDim2.fromOffset(2, 18), 10, Theme.SubText)
				Description.AutomaticSize = Enum.AutomaticSize.Y
				Description.TextWrapped = true
				Description.TextYAlignment = Enum.TextYAlignment.Top
				RegisterTheme(Description, {TextColor3 = "SubText"})
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
		Name = "KynSearchInput", Size = UDim2.new(1, -315, 0, 26),
		Position = UDim2.fromOffset(150, 12), BackgroundColor3 = Theme.Element,
		BackgroundTransparency = 0.35, BorderSizePixel = 0, Text = "",
		PlaceholderText = "Search features...", PlaceholderColor3 = Theme.SubText,
		TextColor3 = Theme.Text, TextSize = 10, Font = Enum.Font.Gotham,
		ClearTextOnFocus = false, ZIndex = 8
	}, Header)
	Corner(SearchInput, 6); Stroke(SearchInput, 0.4); AddPadding(SearchInput, 10, 9, 0, 0)
	RegisterTheme(SearchInput, {BackgroundColor3 = "Element", TextColor3 = "Text", PlaceholderColor3 = "SubText"})

	local SearchPanel = Create("Frame", {
		Name = "KynSearchResults", Size = UDim2.new(1, -315, 0, 220),
		Position = UDim2.fromOffset(150, 42), BackgroundColor3 = Theme.Section,
		BackgroundTransparency = 0.05,
		BorderSizePixel = 0, Visible = false, ZIndex = 90
	}, Window)
	Corner(SearchPanel, 8); Stroke(SearchPanel, 0.2); RegisterTheme(SearchPanel, {BackgroundColor3 = "Section"}); AddGradient(SearchPanel, "Section", "Sidebar", 20)

	local SearchResults = Create("ScrollingFrame", {
		Size = UDim2.new(1, -12, 1, -12), Position = UDim2.fromOffset(6, 6),
		BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 2,
		ScrollBarImageColor3 = Theme.Accent, ScrollBarImageTransparency = 0.6,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y, ZIndex = 91
	}, SearchPanel)

	local SearchLayout = Create("UIListLayout", {Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder}, SearchResults)

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
				Size = UDim2.new(1, -2, 0, 28), BackgroundColor3 = Theme.Element,
				BackgroundTransparency = 0.25,
				BorderSizePixel = 0, Text = item.Name .. "   ·   " .. item.Section,
				TextColor3 = Theme.Text, TextSize = 9, Font = Enum.Font.Gotham,
				TextXAlignment = Enum.TextXAlignment.Left, AutoButtonColor = false, LayoutOrder = index, ZIndex = 92
			}, SearchResults)
			Corner(result, 5); AddPadding(result, 9, 6, 0, 0)
			RegisterTheme(result, {BackgroundColor3 = "Element", TextColor3 = "Text"})
			Track(result.MouseEnter:Connect(function() Tween(result, {BackgroundColor3 = Theme.Hover, BackgroundTransparency = 0}, 0.1) end))
			Track(result.MouseLeave:Connect(function() Tween(result, {BackgroundColor3 = Theme.Element, BackgroundTransparency = 1}, 0.1) end))
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
	AddInputHandler("Began", function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and SearchPanel.Visible then
			local p, z = input.Position, SearchPanel.AbsolutePosition
			local size = SearchPanel.AbsoluteSize
			if p.X < z.X or p.X > z.X + size.X or p.Y < z.Y or p.Y > z.Y + size.Y then
				if not SearchInput:IsFocused() then SearchPanel.Visible = false end
			end
		end
	end)

	ConfigPanel = Create("Frame", {
		Name = "KynConfigPanel", Size = UDim2.fromOffset(238, 224),
		Position = UDim2.new(1, -250, 0, 42), BackgroundColor3 = Theme.Section,
		BackgroundTransparency = 0.05,
		BorderSizePixel = 0, Visible = false, ZIndex = 90
	}, Window)
	Corner(ConfigPanel, 9); Stroke(ConfigPanel, 0.2); AddGradient(ConfigPanel, "Section", "Sidebar", 25)
	RegisterTheme(ConfigPanel, {BackgroundColor3 = "Section"})

	local ConfigTitle = Label(ConfigPanel, "Interface settings", UDim2.new(1, -20, 0, 22), UDim2.fromOffset(11, 7), 11)
	ConfigTitle.Font = Enum.Font.GothamBold; ConfigTitle.ZIndex = 92

	local function MakeConfigButton(text, y)
		local b = Create("TextButton", {Size = UDim2.new(1, -20, 0, 28), Position = UDim2.fromOffset(10, y), BackgroundColor3 = Theme.Element, BackgroundTransparency = 0.15, BorderSizePixel = 0, Text = text, TextColor3 = Theme.Text, TextSize = 10, Font = Enum.Font.GothamMedium, AutoButtonColor = false, ZIndex = 92}, ConfigPanel)
		Corner(b, 6); Stroke(b, 0.35); AddPadding(b, 9, 9, 0, 0)
		RegisterTheme(b, {BackgroundColor3 = "Element", TextColor3 = "Text"})
		Track(b.MouseEnter:Connect(function() Tween(b, {BackgroundColor3 = Theme.Hover, BackgroundTransparency = 0}, 0.1) end))
		Track(b.MouseLeave:Connect(function() Tween(b, {BackgroundColor3 = Theme.Element, BackgroundTransparency = 1}, 0.1) end))
		return b
	end

	local AnimToggleButton = MakeConfigButton("Animations: ON", 34)
	Track(AnimToggleButton.MouseButton1Click:Connect(function()
		AnimationSettings.Enabled = not AnimationSettings.Enabled
		AnimToggleButton.Text = "Animations: " .. (AnimationSettings.Enabled and "ON" or "OFF")
	end))

	local SpeedLabel = Label(ConfigPanel, "Duration (higher = slower): 1.00x", UDim2.new(1, -20, 0, 18), UDim2.fromOffset(11, 68), 9, Theme.SubText); SpeedLabel.ZIndex = 92

	local SpeedBar = Create("Frame", {Size = UDim2.new(1, -20, 0, 4), Position = UDim2.fromOffset(10, 94), BackgroundColor3 = Theme.Element, BackgroundTransparency = 0.2, BorderSizePixel = 0, ZIndex = 92}, ConfigPanel)
	Corner(SpeedBar, 5); Stroke(SpeedBar, 0.4); RegisterTheme(SpeedBar, {BackgroundColor3 = "Element"})
	local SpeedFill = Create("Frame", {Size = UDim2.new(0.245, 0, 1, 0), BackgroundColor3 = Theme.Accent, BorderSizePixel = 0, ZIndex = 93}, SpeedBar); Corner(SpeedFill, 5); RegisterTheme(SpeedFill, {BackgroundColor3 = "Accent"}); AddGradient(SpeedFill, "Accent", "Hover", 0)
	local SpeedHitbox = Create("TextButton", {Size = UDim2.new(1, 0, 0, 20), Position = UDim2.fromOffset(0, -8), BackgroundTransparency = 1, Text = "", ZIndex = 94}, SpeedBar)

	local function SetAnimationSpeed(x)
		local pct = math.clamp((x - SpeedBar.AbsolutePosition.X) / math.max(1, SpeedBar.AbsoluteSize.X), 0, 1)
		AnimationSettings.Speed = 0.35 + pct * 2.65
		SpeedFill.Size = UDim2.new(pct, 0, 1, 0)
		SpeedLabel.Text = string.format("Duration (higher = slower): %.2fx", AnimationSettings.Speed)
	end

	local draggingSpeed = false
	Track(SpeedHitbox.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			draggingSpeed = true
			SetAnimationSpeed(input.Position.X)
		end
	end))
	AddInputHandler("Changed", function(input)
		if draggingSpeed and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			SetAnimationSpeed(input.Position.X)
		end
	end)
	AddInputHandler("Ended", function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			draggingSpeed = false
		end
	end)

	local KeyButton = MakeConfigButton("Toggle key: " .. ToggleKey.Name, 110)
	Track(KeyButton.MouseButton1Click:Connect(function() ListeningForToggleKey = true; KeyButton.Text = "Press a key..." end))

	local ScaleLabel = Label(ConfigPanel, "UI scale", UDim2.new(1, -20, 0, 18), UDim2.fromOffset(11, 149), 9, Theme.SubText); ScaleLabel.ZIndex = 92
	local ScaleDown = Create("TextButton", {Size = UDim2.fromOffset(28, 24), Position = UDim2.fromOffset(10, 178), BackgroundColor3 = Theme.Element, BackgroundTransparency = 0.15, Text = "−", TextColor3 = Theme.Text, TextSize = 14, BorderSizePixel = 0, ZIndex = 92}, ConfigPanel)
	local ScaleUp = Create("TextButton", {Size = UDim2.fromOffset(28, 24), Position = UDim2.fromOffset(46, 178), BackgroundColor3 = Theme.Element, BackgroundTransparency = 0.15, Text = "+", TextColor3 = Theme.Text, TextSize = 14, BorderSizePixel = 0, ZIndex = 92}, ConfigPanel)
	local ScaleValue = Label(ConfigPanel, string.format("%.2f", DefaultScale), UDim2.fromOffset(65, 24), UDim2.fromOffset(86, 178), 10, Theme.Text); ScaleValue.ZIndex = 92
	for _, b in ipairs({ScaleDown, ScaleUp}) do Corner(b, 5); Stroke(b, 0.35); RegisterTheme(b, {BackgroundColor3 = "Element", TextColor3 = "Text"}) end

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
	Corner(ConfirmBox, 8); Stroke(ConfirmBox, 0.15)
	RegisterTheme(ConfirmBox, {BackgroundColor3 = "Section"})

	local ConfirmTitle = Label(ConfirmBox, "Close Kyn?", UDim2.new(1, -20, 0, 22), UDim2.fromOffset(12, 10), 13)
	ConfirmTitle.Font = Enum.Font.GothamBold; ConfirmTitle.ZIndex = 22
	local ConfirmDescription = Label(ConfirmBox, "Are you sure you want to close the GUI?", UDim2.new(1, -20, 0, 25), UDim2.fromOffset(12, 32), 10, Theme.SubText)
	ConfirmDescription.ZIndex = 22
	RegisterTheme(ConfirmDescription, {TextColor3 = "SubText"})

	local function ConfirmButton(text, position, color)
		local button = Create("TextButton", {
			Size = UDim2.fromOffset(106, 27),
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
		Corner(button, 5); Stroke(button, 0.15); AnimateButton(button)
		return button
	end

	local YesButton = ConfirmButton("Yes", UDim2.fromOffset(12, 82), Color3.fromRGB(220, 65, 75))
	local NoButton = ConfirmButton("Cancel", UDim2.fromOffset(137, 82), Theme.Element)
	RegisterTheme(NoButton, {BackgroundColor3 = "Element", TextColor3 = "Text"})

	local ConfirmOpen = false
	local function OpenConfirmation()
		if ConfirmOpen then return end
		ConfirmOpen = true
		ConfirmOverlay.Visible = true
		ConfirmOverlay.BackgroundTransparency = 1
		ConfirmBox.Size = UDim2.fromOffset(235, 112)
		Tween(ConfirmOverlay, {BackgroundTransparency = 0.4}, 0.18)
		Tween(ConfirmBox, {Size = UDim2.fromOffset(255, 122)}, 0.2)
	end

	local function CloseConfirmation()
		if not ConfirmOpen then return end
		ConfirmOpen = false
		Tween(ConfirmOverlay, {BackgroundTransparency = 1}, 0.14)
		Tween(ConfirmBox, {Size = UDim2.fromOffset(235, 112)}, 0.14)
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

	AddInputHandler("Began", function(input)
		if not IsOpen or ConfirmOpen or Destroyed then return end
		if input.UserInputType ~= Enum.UserInputType.MouseButton1
			and input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		local objects = PlayerGui:GetGuiObjectsAtPosition(input.Position.X, input.Position.Y)
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
	end)

	AddInputHandler("Changed", function(input)
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
	end)

	AddInputHandler("Ended", function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
			Dragging = false
			WindowObject.ActiveSlider = nil
		end
	end)

	AddInputHandler("Began", function(input, processed)
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
	end)

	local ActiveFeatureRows = {}
	local activeFeatureOrder = 0
	local ActiveFeaturesHolder = Create("Frame", {
		Name = "KynActiveFeatures",
		Size = UDim2.fromOffset(220, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = UDim2.new(1, -12, 0, 12),
		AnchorPoint = Vector2.new(1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Visible = false,
		ZIndex = 180
	}, MainGui)
	Corner(ActiveFeaturesHolder, 10)
	AddGradient(ActiveFeaturesHolder, "Section", "Sidebar", 0)
	RegisterTheme(ActiveFeaturesHolder, {BackgroundColor3 = "Section"})
	local activeHeader = Label(ActiveFeaturesHolder, "ACTIVE FEATURES", UDim2.new(1, -18, 0, 22), UDim2.fromOffset(10, 4), 9, Theme.SubText)
	activeHeader.Font = Enum.Font.GothamBold
	activeHeader.ZIndex = 181
	RegisterTheme(activeHeader, {TextColor3 = "SubText"})
	local ActiveFeatureList = Create("Frame", {
		Name = "FeatureList",
		Size = UDim2.new(1, -12, 0, 0),
		Position = UDim2.fromOffset(6, 27),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		ZIndex = 181
	}, ActiveFeaturesHolder)
	Create("UIListLayout", {
		Padding = UDim.new(0, 3),
		SortOrder = Enum.SortOrder.LayoutOrder
	}, ActiveFeatureList)
	AddPadding(ActiveFeaturesHolder, 0, 0, 0, 7)

	local activeDragging, activeDragStart, activeStartPos = false, nil, nil
	local beginActiveDragConn = ActiveFeaturesHolder.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			activeDragging = true
			activeDragStart = input.Position
			activeStartPos = ActiveFeaturesHolder.Position
		end
	end)
	AddInputHandler("Changed", function(input)
		if activeDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - activeDragStart
			ActiveFeaturesHolder.Position = UDim2.new(activeStartPos.X.Scale, activeStartPos.X.Offset + delta.X, activeStartPos.Y.Scale, activeStartPos.Y.Offset + delta.Y)
		end
	end)
	AddInputHandler("Ended", function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			activeDragging = false
		end
	end)

	RefreshActiveFeatures = function(name, enabled)
		if not name or tostring(name) == "" then return end
		local row = ActiveFeatureRows[name]
		if enabled and not row then
			activeFeatureOrder += 1
			row = Create("Frame", {
				Name = "ActiveFeature",
				Size = UDim2.new(1, 0, 0, 20),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = activeFeatureOrder,
				ZIndex = 182
			}, ActiveFeatureList)
			Corner(row, 5)
			local dot = Create("Frame", {
				Size = UDim2.fromOffset(5, 5),
				Position = UDim2.fromOffset(8, 7.5),
				BackgroundColor3 = Theme.Accent,
				BorderSizePixel = 0,
				ZIndex = 183
			}, row)
			Corner(dot, 5)
			RegisterTheme(dot, {BackgroundColor3 = "Accent"})
			local label = Label(row, tostring(name), UDim2.new(1, -25, 1, 0), UDim2.fromOffset(20, 0), 9, Theme.Text)
			label.ZIndex = 183
			RegisterTheme(label, {TextColor3 = "Text"})
			ActiveFeatureRows[name] = row
			row.BackgroundTransparency = 1
			if AnimationSettings.Enabled then
				row.Position = UDim2.fromOffset(16, 0)
				TS:Create(row, TweenInfo.new(0.22, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.fromOffset(0, 0)}):Play()
			end
		elseif not enabled and row then
			ActiveFeatureRows[name] = nil
			UnregisterThemeTree(row)
			row:Destroy()
		end
		ActiveFeaturesHolder.Visible = next(ActiveFeatureRows) ~= nil
	end

	local NotificationHolder = Create("Frame", {
		Name = "KynNotifications", Size = UDim2.fromOffset(320, 0),
		AutomaticSize = Enum.AutomaticSize.Y, Position = UDim2.new(1, -12, 1, -12),
		AnchorPoint = Vector2.new(1, 1), BackgroundTransparency = 1,
		BorderSizePixel = 0, ZIndex = 300, Active = true
	}, MainGui)
	Create("UIListLayout", {Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Bottom, HorizontalAlignment = Enum.HorizontalAlignment.Center}, NotificationHolder)
	local notificationCount, notificationDragging, notificationDragStart, notificationStartPosition = 0, false, nil, nil
	AddInputHandler("Changed", function(input)
		if notificationDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - notificationDragStart
			NotificationHolder.Position = UDim2.new(notificationStartPosition.X.Scale, notificationStartPosition.X.Offset + delta.X, notificationStartPosition.Y.Scale, notificationStartPosition.Y.Offset + delta.Y)
		end
	end)
	AddInputHandler("Ended", function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			notificationDragging = false
		end
	end)

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
			Name = "KynNotification", Size = UDim2.new(1, 0, 0, message ~= "" and 64 or 38),
			BackgroundColor3 = Theme.Section, BackgroundTransparency = 0.05,
			BorderSizePixel = 0, ZIndex = 301, LayoutOrder = notificationCount, Active = true
		}, NotificationHolder)
		Corner(toast, 7); Stroke(toast, 0.25); RegisterTheme(toast, {BackgroundColor3 = "Section"}); AddGradient(toast, "Section", "Sidebar", 0)
		local accent = Create("Frame", {Size = UDim2.new(0, 2, 1, -12), Position = UDim2.fromOffset(7, 6), BackgroundColor3 = Theme.Accent, BorderSizePixel = 0, ZIndex = 302}, toast)
		Corner(accent, 2); RegisterTheme(accent, {BackgroundColor3 = "Accent"})
		local titleLabel = Label(toast, title, UDim2.new(1, -48, 0, 18), UDim2.fromOffset(17, 6), 10)
		titleLabel.Font = Enum.Font.GothamBold; titleLabel.ZIndex = 302
		if message ~= "" then
			local body = Label(toast, message, UDim2.new(1, -30, 0, 31), UDim2.fromOffset(17, 26), 9, Theme.SubText)
			body.TextWrapped = true; body.TextYAlignment = Enum.TextYAlignment.Top; body.ZIndex = 302
		end
		local close = Create("TextButton", {
			Size = UDim2.fromOffset(20, 20), Position = UDim2.new(1, -25, 0, 4),
			BackgroundTransparency = 1, BorderSizePixel = 0, Text = "×",
			TextColor3 = Theme.SubText, TextSize = 16, Font = Enum.Font.GothamMedium,
			AutoButtonColor = false, ZIndex = 304
		}, toast)
		RegisterTheme(close, {TextColor3 = "SubText"})
		local dismissed = false

		toast.Position = UDim2.fromOffset(36, 0)
		TS:Create(toast, TweenInfo.new(0.28, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.fromOffset(0, 0)}):Play()
		toast.BackgroundTransparency = 1
		TS:Create(toast, TweenInfo.new(0.24, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.05}):Play()

		local function dismiss()
			if dismissed or not toast.Parent then return end
			dismissed = true
			TS:Create(toast, TweenInfo.new(0.24, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
				Position = UDim2.fromOffset(50, 0),
				BackgroundTransparency = 1
			}):Play()
			task.delay(0.27, function()
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
		if beginActiveDragConn then beginActiveDragConn:Disconnect() end
		if WatermarkObject then WatermarkObject:Destroy(); WatermarkObject = nil end
		MainGui:Destroy()
		table.clear(ThemeObjects)
		table.clear(ThemeObjectMap)
	end

	return WindowObject
end

return GuiLib
