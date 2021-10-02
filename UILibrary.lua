--[=[
	Collaborators: userofwind
	https://userofwind.gitbook.io/luxuilibrary/
]=]

if game.CoreGui:FindFirstChild('LuxUI') then
	game.CoreGui:FindFirstChild('LuxUI'):Destroy()
	
	if game.CoreGui:FindFirstChild('CreatedNotification') then
		game.CoreGui:FindFirstChild('CreatedNotification'):Destroy()
	end
end

-- Services
local UserInputService = game:GetService('UserInputService')
local TweenService = game:GetService('TweenService')
local PlayersService = game:GetService('Players')
local RunService = game:GetService('RunService')

-- Variables
local Library = {}
local UIFunctions = {}
local TabFunctions = {}
local TabData = {}
local UIIsDragging
local KeyDownConnection
local UIInputData
local OriginalUIPosition
local SecondOriginalUIPosition
local DropdownButtons = {}
local LastTabPosition = 0.002
local LocalPlayer = PlayersService.LocalPlayer
local SliderValue = 0
local LastTabFeaturePosition = 0.003
local LocalPlayerMouse = LocalPlayer:GetMouse()

-- Library Functions
function Library:SetupUI(TitleForUI)
	local LuxUI = Instance.new('ScreenGui')
	local LuxUIFrame = Instance.new('Frame')
	local LuxUIFrameUICorner = Instance.new('UICorner')
	local LuxUIFrameHeaderFrame = Instance.new('Frame')
	local LuxUIFrameHeaderFrameUICorner = Instance.new('UICorner')
	local LuxUIFrameHeaderFrameTitleLabel = Instance.new('TextLabel')
	local LuxUIFrameHeaderFrameLuxIcon = Instance.new('ImageLabel')
	local LuxUIFrameHolderFrame = Instance.new('Frame')
	local LuxUIFrameHolderFrameUICorner = Instance.new('UICorner')
	local LuxUIFrameHolderFrameScrollingFrame = Instance.new('ScrollingFrame')
	local LuxUIFrameTabsFrame = Instance.new('Frame')
	local LuxUIFrameTabsFrameUICorner = Instance.new('UICorner')
	local LuxUIFrameTabsFrameScrollingFrame = Instance.new('ScrollingFrame')
	local LuxUIFrameTabsFrameCreditsLabel = Instance.new('TextLabel')

	LuxUI.Name = 'LuxUI'
	LuxUI.Parent = game.CoreGui

	LuxUIFrame.Name = 'LuxUIFrame'
	LuxUIFrame.Parent = LuxUI
	LuxUIFrame.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
	LuxUIFrame.Position = UDim2.new(0.0135716889, 0, 0.487272739, 0)
	LuxUIFrame.Size = UDim2.new(0, 594, 0, 411)

	LuxUIFrameUICorner.CornerRadius = UDim.new(0, 4)
	LuxUIFrameUICorner.Name = 'LuxUIFrameUICorner'
	LuxUIFrameUICorner.Parent = LuxUIFrame

	LuxUIFrameHeaderFrame.Name = 'LuxUIFrameHeaderFrame'
	LuxUIFrameHeaderFrame.Parent = LuxUIFrame
	LuxUIFrameHeaderFrame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
	LuxUIFrameHeaderFrame.Position = UDim2.new(0, 0, -0.048661802, 0)
	LuxUIFrameHeaderFrame.Size = UDim2.new(0, 594, 0, 34)

	LuxUIFrameHeaderFrameUICorner.CornerRadius = UDim.new(0, 4)
	LuxUIFrameHeaderFrameUICorner.Name = 'LuxUIFrameHeaderFrameUICorner'
	LuxUIFrameHeaderFrameUICorner.Parent = LuxUIFrameHeaderFrame

	LuxUIFrameHeaderFrameTitleLabel.Name = 'LuxUIFrameHeaderFrameTitleLabel'
	LuxUIFrameHeaderFrameTitleLabel.Parent = LuxUIFrameHeaderFrame
	LuxUIFrameHeaderFrameTitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LuxUIFrameHeaderFrameTitleLabel.BackgroundTransparency = 1.000
	LuxUIFrameHeaderFrameTitleLabel.Position = UDim2.new(0.0858585909, 0, 0, 0)
	LuxUIFrameHeaderFrameTitleLabel.Size = UDim2.new(0, 492, 0, 34)
	LuxUIFrameHeaderFrameTitleLabel.Font = Enum.Font.JosefinSans
	LuxUIFrameHeaderFrameTitleLabel.Text = TitleForUI
	LuxUIFrameHeaderFrameTitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	LuxUIFrameHeaderFrameTitleLabel.TextSize = 20.000
	LuxUIFrameHeaderFrameTitleLabel.TextXAlignment = Enum.TextXAlignment.Left

	LuxUIFrameHeaderFrameLuxIcon.Name = 'LuxUIFrameHeaderFrameLuxIcon'
	LuxUIFrameHeaderFrameLuxIcon.Parent = LuxUIFrameHeaderFrame
	LuxUIFrameHeaderFrameLuxIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LuxUIFrameHeaderFrameLuxIcon.BackgroundTransparency = 1.000
	LuxUIFrameHeaderFrameLuxIcon.Position = UDim2.new(0.020202022, 0, 0.205882356, 0)
	LuxUIFrameHeaderFrameLuxIcon.Size = UDim2.new(0, 22, 0, 20)
	LuxUIFrameHeaderFrameLuxIcon.Image = 'http://www.roblox.com/asset/?id=5012126105'

	LuxUIFrameHolderFrame.Name = 'LuxUIFrameHolderFrame'
	LuxUIFrameHolderFrame.Parent = LuxUIFrame
	LuxUIFrameHolderFrame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
	LuxUIFrameHolderFrame.Position = UDim2.new(0.234006733, 0, 0.048661802, 0)
	LuxUIFrameHolderFrame.Size = UDim2.new(0, 449, 0, 385)

	LuxUIFrameHolderFrameUICorner.CornerRadius = UDim.new(0, 4)
	LuxUIFrameHolderFrameUICorner.Name = 'LuxUIFrameHolderFrameUICorner'
	LuxUIFrameHolderFrameUICorner.Parent = LuxUIFrameHolderFrame

	LuxUIFrameHolderFrameScrollingFrame.Name = 'LuxUIFrameHolderFrameScrollingFrame'
	LuxUIFrameHolderFrameScrollingFrame.Parent = LuxUIFrameHolderFrame
	LuxUIFrameHolderFrameScrollingFrame.Active = true
	LuxUIFrameHolderFrameScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 201, 73)
	LuxUIFrameHolderFrameScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LuxUIFrameHolderFrameScrollingFrame.BackgroundTransparency = 1.000
	LuxUIFrameHolderFrameScrollingFrame.BorderSizePixel = 0
	LuxUIFrameHolderFrameScrollingFrame.Size = UDim2.new(0, 448, 0, 385)
	LuxUIFrameHolderFrameScrollingFrame.CanvasSize = UDim2.new(0, 0, 2, 1000)
	LuxUIFrameHolderFrameScrollingFrame.ScrollBarThickness = 5

	LuxUIFrameTabsFrame.Name = 'LuxUIFrameTabsFrame'
	LuxUIFrameTabsFrame.Parent = LuxUIFrame
	LuxUIFrameTabsFrame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
	LuxUIFrameTabsFrame.Position = UDim2.new(0.0101010101, 0, 0.048661802, 0)
	LuxUIFrameTabsFrame.Size = UDim2.new(0, 127, 0, 385)

	LuxUIFrameTabsFrameUICorner.CornerRadius = UDim.new(0, 4)
	LuxUIFrameTabsFrameUICorner.Name = 'LuxUIFrameTabsFrameUICorner'
	LuxUIFrameTabsFrameUICorner.Parent = LuxUIFrameTabsFrame

	LuxUIFrameTabsFrameScrollingFrame.Name = 'LuxUIFrameTabsFrameScrollingFrame'
	LuxUIFrameTabsFrameScrollingFrame.Parent = LuxUIFrameTabsFrame
	LuxUIFrameTabsFrameScrollingFrame.Active = true
	LuxUIFrameTabsFrameScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LuxUIFrameTabsFrameScrollingFrame.BackgroundTransparency = 1.000
	LuxUIFrameTabsFrameScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 201, 73)
	LuxUIFrameTabsFrameScrollingFrame.BorderSizePixel = 0
	LuxUIFrameTabsFrameScrollingFrame.Size = UDim2.new(0, 127, 0, 344)
	LuxUIFrameTabsFrameScrollingFrame.CanvasSize = UDim2.new(0, 0, 2, 2000)
	LuxUIFrameTabsFrameScrollingFrame.ScrollBarThickness = 5

	LuxUIFrameTabsFrameCreditsLabel.Name = 'LuxUIFrameTabsFrameCreditsLabel'
	LuxUIFrameTabsFrameCreditsLabel.Parent = LuxUIFrameTabsFrame
	LuxUIFrameTabsFrameCreditsLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LuxUIFrameTabsFrameCreditsLabel.BackgroundTransparency = 1.000
	LuxUIFrameTabsFrameCreditsLabel.Position = UDim2.new(0.0472440943, 0, 0.870129883, 0)
	LuxUIFrameTabsFrameCreditsLabel.Size = UDim2.new(0, 115, 0, 50)
	LuxUIFrameTabsFrameCreditsLabel.Font = Enum.Font.JosefinSans
	LuxUIFrameTabsFrameCreditsLabel.Text = 'LuXSystematic\nUI Library'
	LuxUIFrameTabsFrameCreditsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	LuxUIFrameTabsFrameCreditsLabel.TextSize = 15.000
	LuxUIFrameTabsFrameCreditsLabel.TextXAlignment = Enum.TextXAlignment.Left
	LuxUIFrameTabsFrameCreditsLabel.TextYAlignment = Enum.TextYAlignment.Bottom

	LuxUIFrameHeaderFrame.InputBegan:Connect(function (NewUIPosition)
		if NewUIPosition.UserInputType == Enum.UserInputType.MouseButton1 or NewUIPosition.UserInputType == Enum.UserInputType.Touch then
			UIIsDragging = true
			CurrentNewUIPosition = NewUIPosition.Position
			CurrentUIPosition = LuxUIFrame.Position

			NewUIPosition.Changed:Connect(function ()
				if NewUIPosition.UserInputState == Enum.UserInputState.End then
					UIIsDragging = false
				end
			end)
		end
	end)

	LuxUIFrameHeaderFrame.InputChanged:Connect(function (ChangedUIInput)
		if ChangedUIInput.UserInputType == Enum.UserInputType.MouseMovement or ChangedUIInput.UserInputType == Enum.UserInputType.Touch then
			UIInputData = ChangedUIInput
		end
	end)

	UserInputService.InputChanged:Connect(function (ChangedUIInput)
		if ChangedUIInput == UIInputData and UIIsDragging then
			local DeltaUIPosition = ChangedUIInput.Position - CurrentNewUIPosition

			LuxUIFrame.Position = UDim2.new(CurrentUIPosition.X.Scale, CurrentUIPosition.X.Offset + DeltaUIPosition.X, CurrentUIPosition.Y.Scale, CurrentUIPosition.Y.Offset + DeltaUIPosition.Y)
		end
	end)

	function UIFunctions:SetHotkey(KeyToSet)
		if KeyDownConnection then
			KeyDownConnection:Disconnect()
		end

		KeyDownConnection = LocalPlayerMouse.KeyDown:Connect(function (PressedKey)
			local ReadyToChangePosition = true

			if PressedKey == KeyToSet and ReadyToChangePosition then
				if LuxUIFrame.Position ~= UDim2.new(0.0135716889, 0, 5, 0) then
					TweenService:Create(LuxUIFrame, TweenInfo.new(1), { Position = UDim2.new(0.0135716889, 0, 5, 0) }):Play()
				else
					TweenService:Create(LuxUIFrame, TweenInfo.new(1), { Position = UDim2.new(0.0135716889, 0, 0.487272739, 0) }):Play()
				end
			end
		end)
	end
	
	function UIFunctions:Notify(TitleForNotification, TimeForNotification)
	    local CreatedNotification = Instance.new('ScreenGui')
		local CreatedNotificationFrame = Instance.new("Frame")
		local CreatedNotificationFrameHeaderFrame = Instance.new("Frame")
		local CreatedNotificationFrameHeaderFrameUICorner = Instance.new("UICorner")
		local CreatedNotificationFrameHeaderFrameLuxIcon = Instance.new("ImageButton")
		local CreatedNotificationFrameHeaderFrameTitleLabel = Instance.new("TextLabel")
		local CreatedNotificationFrameUICorner = Instance.new("UICorner")
		local CreatedNotificationFrameDescriptionFrame = Instance.new("Frame")
		local CreatedNotificationFrameDescriptionFrameUICorner = Instance.new("UICorner")
		local CreatedNotificationFrameDescriptionFrameTextLabel = Instance.new("TextLabel")

        	CreatedNotification.Name = 'CreatedNotification'
        	CreatedNotification.Parent = game.CoreGui
        	CreatedNotification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        
		CreatedNotificationFrame.Name = "CreatedNotificationFrame"
		CreatedNotificationFrame.Parent = CreatedNotification
		CreatedNotificationFrame.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
		CreatedNotificationFrame.Position = UDim2.new(1.1, 0, 0.517575741, 0)
		CreatedNotificationFrame.Size = UDim2.new(0, 256, 0, 386)

		CreatedNotificationFrameHeaderFrame.Name = "CreatedNotificationFrameHeaderFrame"
		CreatedNotificationFrameHeaderFrame.Parent = CreatedNotificationFrame
		CreatedNotificationFrameHeaderFrame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
		CreatedNotificationFrameHeaderFrame.Size = UDim2.new(0, 256, 0, 34)

		CreatedNotificationFrameHeaderFrameUICorner.Name = "CreatedNotificationFrameHeaderFrameUICorner"
		CreatedNotificationFrameHeaderFrameUICorner.Parent = CreatedNotificationFrameHeaderFrame

		CreatedNotificationFrameHeaderFrameLuxIcon.Name = "CreatedNotificationFrameHeaderFrameLuxIcon"
		CreatedNotificationFrameHeaderFrameLuxIcon.Parent = CreatedNotificationFrameHeaderFrame
		CreatedNotificationFrameHeaderFrameLuxIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CreatedNotificationFrameHeaderFrameLuxIcon.BackgroundTransparency = 1.000
		CreatedNotificationFrameHeaderFrameLuxIcon.Position = UDim2.new(0.0553582683, 0, 0.176470593, 0)
		CreatedNotificationFrameHeaderFrameLuxIcon.Size = UDim2.new(0, 22, 0, 21)
		CreatedNotificationFrameHeaderFrameLuxIcon.Image = "http://www.roblox.com/asset/?id=5012126105"

		CreatedNotificationFrameHeaderFrameTitleLabel.Name = "CreatedNotificationFrameHeaderFrameTitleLabel"
		CreatedNotificationFrameHeaderFrameTitleLabel.Parent = CreatedNotificationFrameHeaderFrame
		CreatedNotificationFrameHeaderFrameTitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CreatedNotificationFrameHeaderFrameTitleLabel.BackgroundTransparency = 1.000
		CreatedNotificationFrameHeaderFrameTitleLabel.Position = UDim2.new(0.192076683, 0, 0, 0)
		CreatedNotificationFrameHeaderFrameTitleLabel.Size = UDim2.new(0, 191, 0, 34)
		CreatedNotificationFrameHeaderFrameTitleLabel.Font = Enum.Font.JosefinSans
		CreatedNotificationFrameHeaderFrameTitleLabel.Text = "Notification"
		CreatedNotificationFrameHeaderFrameTitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		CreatedNotificationFrameHeaderFrameTitleLabel.TextSize = 23.000
		CreatedNotificationFrameHeaderFrameTitleLabel.TextXAlignment = Enum.TextXAlignment.Left

		CreatedNotificationFrameUICorner.Name = "CreatedNotificationFrameUICorner"
		CreatedNotificationFrameUICorner.Parent = CreatedNotificationFrame

		CreatedNotificationFrameDescriptionFrame.Name = "CreatedNotificationFrameDescriptionFrame"
		CreatedNotificationFrameDescriptionFrame.Parent = CreatedNotificationFrame
		CreatedNotificationFrameDescriptionFrame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
		CreatedNotificationFrameDescriptionFrame.Position = UDim2.new(0.0234375, 0, 0.103626944, 0)
		CreatedNotificationFrameDescriptionFrame.Size = UDim2.new(0, 244, 0, 340)

		CreatedNotificationFrameDescriptionFrameUICorner.Name = "CreatedNotificationFrameDescriptionFrameUICorner"
		CreatedNotificationFrameDescriptionFrameUICorner.Parent = CreatedNotificationFrameDescriptionFrame

		CreatedNotificationFrameDescriptionFrameTextLabel.Name = "CreatedNotificationFrameDescriptionFrameTextLabel"
		CreatedNotificationFrameDescriptionFrameTextLabel.Parent = CreatedNotificationFrameDescriptionFrame
		CreatedNotificationFrameDescriptionFrameTextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CreatedNotificationFrameDescriptionFrameTextLabel.BackgroundTransparency = 1.000
		CreatedNotificationFrameDescriptionFrameTextLabel.Position = UDim2.new(0.033490289, 0, 0.0176764987, 0)
		CreatedNotificationFrameDescriptionFrameTextLabel.Size = UDim2.new(0, 226, 0, 327)
		CreatedNotificationFrameDescriptionFrameTextLabel.Font = Enum.Font.JosefinSans
		CreatedNotificationFrameDescriptionFrameTextLabel.Text = TitleForNotification
		CreatedNotificationFrameDescriptionFrameTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		CreatedNotificationFrameDescriptionFrameTextLabel.TextSize = 17.000
		CreatedNotificationFrameDescriptionFrameTextLabel.TextWrapped = true
		CreatedNotificationFrameDescriptionFrameTextLabel.TextXAlignment = Enum.TextXAlignment.Left
		CreatedNotificationFrameDescriptionFrameTextLabel.TextYAlignment = Enum.TextYAlignment.Top
		
		TweenService:Create(CreatedNotificationFrame, TweenInfo.new(TimeForNotification or 1), { Position = UDim2.new(0.851, 0, 0.518, 0) }):Play()
		
		wait(5)
		
		TweenService:Create(CreatedNotificationFrame, TweenInfo.new(1), { Position = UDim2.new(1.1, 0, 0.518) }):Play()
		
		wait(1)
		
		CreatedNotificationFrame:Destroy()
	end

	function UIFunctions:DestroyUI()
		if KeyDownConnection then
			KeyDownConnection:Disconnect()
		end

		LuxUI:Destroy()
	end

	function UIFunctions:CreateTab(TitleForTab)
		local CreatedTab = Instance.new('TextButton')
		local CreatedTabUICorner = Instance.new('UICorner')

		CreatedTab.Name = 'CreatedTab'
		CreatedTab.Parent = LuxUIFrameTabsFrameScrollingFrame
		CreatedTab.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
		CreatedTab.Position = UDim2.new(0.04, 0, LastTabPosition, 0)
		CreatedTab.Size = UDim2.new(0, 110, 0, 23)
		CreatedTab.Font = Enum.Font.JosefinSans
		CreatedTab.Text = TitleForTab
		CreatedTab.TextColor3 = Color3.fromRGB(255, 255, 255)
		CreatedTab.TextSize = 13
		CreatedTab.TextWrapped = true
		CreatedTab.MouseButton1Click:Connect(function ()
			LastTabFeaturePosition = 0.003

			for _, Child in ipairs(LuxUIFrameHolderFrameScrollingFrame:GetChildren()) do
				pcall(function ()
					Child.Visible = false
					Child.Active = false

					TweenService:Create(Child, TweenInfo.new(1), { Transparency = 1 }):Play()
				end)
			end

			for _, Child in ipairs(TabData[TitleForTab]) do
				pcall(function ()
					Child.Position = UDim2.new(0.02, 0, LastTabFeaturePosition, 0)
					Child.Active = true
					Child.BackgroundTransparency = 1
					Child.Visible = true

					TweenService:Create(Child, TweenInfo.new(1), { Transparency = 0 }):Play()

					if Child.Name == 'CreatedSlider' then
						LastTabFeaturePosition = LastTabFeaturePosition + 0.032
					elseif Child.Name == 'CreatedBox' then
						LastTabFeaturePosition = LastTabFeaturePosition + 0.0377
					else
						LastTabFeaturePosition = LastTabFeaturePosition + 0.020
					end
				end)
			end
		end)

		CreatedTabUICorner.Name = 'CreatedTabUICorner'
		CreatedTabUICorner.Parent = CreatedTab

		CreatedTabUICorner.Name = 'CreatedButtonUICorner'
		CreatedTabUICorner.Parent = CreatedTab

		LastTabPosition = LastTabPosition + 0.01
		TabFunctions = {}
		TabData[TitleForTab] = {}

		function TabFunctions:CreateButton(TitleForButton, FunctionForButton)
			local CreatedButton = Instance.new('TextButton')
			local CreatedButtonUICorner = Instance.new('UICorner')

			CreatedButton.Name = 'CreatedButton'
			CreatedButton.Parent = LuxUIFrameHolderFrameScrollingFrame
			CreatedButton.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
			CreatedButton.Position = UDim2.new(0.02, 0, LastTabFeaturePosition, 0)
			CreatedButton.Size = UDim2.new(0, 425, 0, 30)
			CreatedButton.Font = Enum.Font.JosefinSans
			CreatedButton.Visible = false
			CreatedButton.Text = TitleForButton
			CreatedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			CreatedButton.TextSize = 15
			CreatedButton.MouseButton1Click:Connect(function ()
				coroutine.wrap(FunctionForButton)()
			end)

			CreatedButtonUICorner.Name = 'CreatedButtonUICorner'
			CreatedButtonUICorner.Parent = CreatedButton

			TabData[TitleForTab][#TabData[TitleForTab] + 1] = CreatedButton
		end

		function TabFunctions:CreateLabel(TitleForLabel)
			local CreatedLabel = Instance.new('TextLabel')
			local CreatedLabelUICorner = Instance.new('UICorner')

			CreatedLabel.Name = 'CreatedLabel'
			CreatedLabel.Parent = LuxUIFrameHolderFrameScrollingFrame
			CreatedLabel.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
			CreatedLabel.Position = UDim2.new(0.02, 0, LastTabFeaturePosition, 0)
			CreatedLabel.Size = UDim2.new(0, 425, 0, 30)
			CreatedLabel.Font = Enum.Font.JosefinSans
			CreatedLabel.Visible = false
			CreatedLabel.Text = TitleForLabel
			CreatedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			CreatedLabel.TextSize = 15

			CreatedLabelUICorner.Name = 'CreatedLabelUICorner'
			CreatedLabelUICorner.Parent = CreatedLabel

			TabData[TitleForTab][#TabData[TitleForTab] + 1] = CreatedLabel
		end

		function TabFunctions:CreateToggle(TitleForToggle, FunctionForToggle)
			local CreatedToggle = Instance.new('TextButton')
			local CreatedToggleUICorner = Instance.new('UICorner')
			local CreatedToggleIconLabel = Instance.new('TextLabel')
			local CreatedToggleIconLabelUICorner = Instance.new('UICorner')

			CreatedToggle.Name = 'CreatedToggle'
			CreatedToggle.Parent = LuxUIFrameHolderFrameScrollingFrame
			CreatedToggle.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
			CreatedToggle.Position = UDim2.new(0.0199999996, 0, LastTabFeaturePosition, 0)
			CreatedToggle.Size = UDim2.new(0, 425, 0, 30)
			CreatedToggle.Font = Enum.Font.JosefinSans
			CreatedToggle.Visible = false
			CreatedToggle.Text = TitleForToggle
			CreatedToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
			CreatedToggle.TextSize = 15
			CreatedToggle.MouseButton1Click:Connect(function ()
				if CreatedToggleIconLabel.Text == 'OFF' then
					coroutine.wrap(FunctionForToggle)(true)
						
					CreatedToggleIconLabel.BackgroundColor3 = Color3.fromRGB(30, 255, 120)
					CreatedToggleIconLabel.Text = 'ON'
				else
					coroutine.wrap(FunctionForToggle)(false)
						
					CreatedToggleIconLabel.BackgroundColor3 = Color3.fromRGB(255, 7, 85)
					CreatedToggleIconLabel.Text = 'OFF'
				end
			end)

			CreatedToggleUICorner.Name = 'CreatedToggleUICorner'
			CreatedToggleUICorner.Parent = CreatedToggle

			CreatedToggleIconLabel.Name = 'CreatedToggleIconLabel'
			CreatedToggleIconLabel.Parent = CreatedToggle
			CreatedToggleIconLabel.BackgroundColor3 = Color3.fromRGB(255, 7, 85)
			CreatedToggleIconLabel.Position = UDim2.new(0.858823538, 0, 0.233333334, 0)
			CreatedToggleIconLabel.Size = UDim2.new(0, 46, 0, 16)
			CreatedToggleIconLabel.Font = Enum.Font.SourceSans
			CreatedToggleIconLabel.Text = 'OFF'
			CreatedToggleIconLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
			CreatedToggleIconLabel.TextSize = 15

			CreatedToggleIconLabelUICorner.Name = 'CreatedToggleIconLabelUICorner'
			CreatedToggleIconLabelUICorner.Parent = CreatedToggleIconLabel

			TabData[TitleForTab][#TabData[TitleForTab] + 1] = CreatedToggle
		end

		function TabFunctions:CreateSlider(TitleForSlider, MinimumNumber, MaximimNumber, SliderReleaseFunction)
			local CreatedSlider = Instance.new('Frame')
			local CreatedSliderUICorner = Instance.new('UICorner')
			local CreatedSliderTitleLabel = Instance.new('TextLabel')
			local CreatedSliderTitleLabelUICorner = Instance.new('UICorner')
			local CreatedSliderLineFrame = Instance.new('Frame')
			local CreatedSliderLineFrameUICorner = Instance.new('UICorner')
			local CreatedSliderLineFrameOrbFrame = Instance.new('Frame')
			local CreatedSliderLineFrameOrbFrameUICorner = Instance.new('UICorner')

			CreatedSlider.Name = 'CreatedSlider'
			CreatedSlider.Parent = LuxUIFrameHolderFrameScrollingFrame
			CreatedSlider.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
			CreatedSlider.Position = UDim2.new(0.0199999996, 0, LastTabFeaturePosition, 0)
			CreatedSlider.Size = UDim2.new(0, 425, 0, 50)
			CreatedSlider.Visible = false

			CreatedSliderUICorner.Name = 'CreatedSliderUICorner'
			CreatedSliderUICorner.Parent = CreatedSlider

			CreatedSliderTitleLabel.Name = 'CreatedSliderTitleLabel'
			CreatedSliderTitleLabel.Parent = CreatedSlider
			CreatedSliderTitleLabel.BackgroundColor3 = Color3.fromRGB(255, 7, 85)
			CreatedSliderTitleLabel.BackgroundTransparency = 1.000
			CreatedSliderTitleLabel.Position = UDim2.new(0, 0, 0.00460021989, 0)
			CreatedSliderTitleLabel.Size = UDim2.new(0, 125, 0, 50)
			CreatedSliderTitleLabel.Font = Enum.Font.JosefinSans
			CreatedSliderTitleLabel.Text = '    ' .. TitleForSlider .. ' (0)'
			CreatedSliderTitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			CreatedSliderTitleLabel.TextSize = 14

			CreatedSliderTitleLabelUICorner.Name = 'CreatedSliderTitleLabelUICorner'
			CreatedSliderTitleLabelUICorner.Parent = CreatedSliderTitleLabel

			CreatedSliderLineFrame.Name = 'CreatedSliderLineFrame'
			CreatedSliderLineFrame.Parent = CreatedSlider
			CreatedSliderLineFrame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
			CreatedSliderLineFrame.Position = UDim2.new(0.374117643, 0, 0.424600184, 0)
			CreatedSliderLineFrame.Size = UDim2.new(0, 248, 0, 6)

			CreatedSliderLineFrameUICorner.CornerRadius = UDim.new(0, 4)
			CreatedSliderLineFrameUICorner.Name = 'CreatedSliderLineFrameUICorner'
			CreatedSliderLineFrameUICorner.Parent = CreatedSliderLineFrame

			CreatedSliderLineFrameOrbFrame.Name = 'CreatedSliderLineFrameOrbFrame'
			CreatedSliderLineFrameOrbFrame.Parent = CreatedSliderLineFrame
			CreatedSliderLineFrameOrbFrame.BackgroundColor3 = Color3.fromRGB(252, 201, 73)
			CreatedSliderLineFrameOrbFrame.Position = UDim2.new(0, 0, -1, 0)
			CreatedSliderLineFrameOrbFrame.Size = UDim2.new(0, 20, 0, 17)
			CreatedSliderLineFrameOrbFrame.InputBegan:Connect(function (InputFromOrb)
				if InputFromOrb.UserInputType == Enum.UserInputType.MouseButton1 or InputFromOrb.UserInputType == Enum.UserInputType.Touch then
					local OrbIsDragging = true
					local OrbXPosition = InputFromOrb.Position.X
					local OrbInitialPosition = CreatedSliderLineFrameOrbFrame.Position.X.Offset
					local OrbArithimeticPosition = CreatedSliderLineFrameOrbFrame.AbsolutePosition.X - OrbInitialPosition
					local ConnectionToOrb

					RunService.Stepped:Connect(function()
						if OrbIsDragging then
							local CurrentOrbOffset = LocalPlayerMouse.X - OrbArithimeticPosition - 3

							if CurrentOrbOffset > 228 then
								CurrentOrbOffset = 228
							elseif CurrentOrbOffset < 0 then
								CurrentOrbOffset = 0
							end

							CreatedSliderLineFrameOrbFrame.Position = UDim2.new(0, CurrentOrbOffset , -1, 0);
							CreatedSliderTitleLabel.Text = '    ' .. TitleForSlider .. ' (' .. math.round(MinimumNumber + (MaximimNumber - MinimumNumber) * CreatedSliderLineFrameOrbFrame.Position.X.Offset/(CreatedSliderLineFrame.Size.X.Offset - 20)) .. ')'
						else 
							RunService.Stepped:Disconnect();
						end
					end)

					InputFromOrb.Changed:Connect(function()
						if InputFromOrb.UserInputState == Enum.UserInputState.End then
							OrbIsDragging = false
						end
					end)
				end
			end)

			CreatedSliderLineFrameOrbFrame.InputEnded:Connect(function (InputFromOrb)
				if InputFromOrb.UserInputType == Enum.UserInputType.MouseButton1 or InputFromOrb.UserInputType == Enum.UserInputType.Touch then
					coroutine.wrap(SliderReleaseFunction)(math.round(MinimumNumber + (MaximimNumber - MinimumNumber) * CreatedSliderLineFrameOrbFrame.Position.X.Offset/(CreatedSliderLineFrame.Size.X.Offset - 20)))
				end
			end)

			CreatedSliderLineFrameOrbFrameUICorner.CornerRadius = UDim.new(0, 10)
			CreatedSliderLineFrameOrbFrameUICorner.Name = 'CreatedSliderLineFrameOrbFrameUICorner'
			CreatedSliderLineFrameOrbFrameUICorner.Parent = CreatedSliderLineFrameOrbFrame

			TabData[TitleForTab][#TabData[TitleForTab] + 1] = CreatedSlider
		end

		function TabFunctions:CreateDropdown(TitleForDropdown, Values, ValueChosenFunction)
			local CreatedDropdown = Instance.new('TextButton')
			local CreatedDropdownUICorner = Instance.new('UICorner')
			local CreatedDropdownIconLabel = Instance.new('TextLabel')
			local CreatedDropdownIconLabelUICorner = Instance.new('UICorner')

			CreatedDropdown.Name = 'CreatedDropdown'
			CreatedDropdown.Parent = LuxUIFrameHolderFrameScrollingFrame
			CreatedDropdown.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
			CreatedDropdown.Position = UDim2.new(0.0199999996, 0, LastTabFeaturePosition, 0)
			CreatedDropdown.Size = UDim2.new(0, 425, 0, 30)
			CreatedDropdown.Font = Enum.Font.JosefinSans
			CreatedDropdown.Text = TitleForDropdown
			CreatedDropdown.Visible = false
			CreatedDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
			CreatedDropdown.TextSize = 15
			CreatedDropdown.MouseButton1Click:Connect(function ()
				local BeginTweening = false

				if CreatedDropdownIconLabel.Text == '+' then
					for _, Child in ipairs(TabData[TitleForTab]) do
						if Child.Text:find(TitleForDropdown) then
							BeginTweening = true

							continue
						end

						if BeginTweening then
							Child.Active = false

							TweenService:Create(Child, TweenInfo.new(1), { Transparency = 1 }):Play()
						end
					end

					local DropdownButtonPositionToUse = 0

					for _, Option in ipairs(Values) do
						DropdownButtons[#DropdownButtons + 1] = Instance.new('TextButton')

						local CurrentDropdownButton = DropdownButtons[#DropdownButtons]
						local FrameToUseInstead = CreatedDropdown:FindFirstChild('CurrentDropdownButtonScrollingFrame')
						local CurrentDropdownButtonUICorner = Instance.new('UICorner')
						local DropdownPositionToUse = 0
						
						print(FrameToUseInstead)

						if not FrameToUseInstead then
							FrameToUseInstead = Instance.new('ScrollingFrame')

							FrameToUseInstead.Name = 'CurrentDropdownButtonScrollingFrame'
							FrameToUseInstead.Parent = CreatedDropdown
							FrameToUseInstead.Active = true
							FrameToUseInstead.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							FrameToUseInstead.BorderSizePixel = 0
							FrameToUseInstead.Position = UDim2.new(0.014117647, 0, 1.2, 0)
							FrameToUseInstead.Size = UDim2.new(0, 425, 0, 0)
							FrameToUseInstead.CanvasSize = UDim2.new(0, 0, 2, 2500)
							FrameToUseInstead.ScrollBarImageTransparency = 1
							FrameToUseInstead.ScrollBarImageColor3 = Color3.fromRGB(255, 201, 73)
							FrameToUseInstead.ScrollBarThickness = 5
							FrameToUseInstead.BackgroundTransparency = 1
						end

						CurrentDropdownButton.Name = 'CurrentDropdownButton'
						CurrentDropdownButton.Parent = FrameToUseInstead
						CurrentDropdownButton.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
						CurrentDropdownButton.Position = UDim2.new(0, 0, DropdownPositionToUse, 0)
						CurrentDropdownButton.Size = UDim2.new(0, 401, 0, 21)
						CurrentDropdownButton.Font = Enum.Font.JosefinSans
						CurrentDropdownButton.Text = Option
						CurrentDropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
						CurrentDropdownButton.TextSize = 14.000
						CurrentDropdownButton.BackgroundTransparency = 1
						CurrentDropdownButton.MouseButton1Click:Connect(function ()
							BeginTweening = false
							CreatedDropdown.Text = TitleForDropdown
							CreatedDropdown.Text = CreatedDropdown.Text .. ' (' .. CurrentDropdownButton.Text .. ')'

							for _, Child in ipairs(DropdownButtons) do
								coroutine.wrap(function ()
									TweenService:Create(Child, TweenInfo.new(0.2), { Transparency = 1 }):Play()
									TweenService:Create(FrameToUseInstead, TweenInfo.new(1), { Size = UDim2.new(0, 425, 0, 0) }):Play()
									TweenService:Create(FrameToUseInstead, TweenInfo.new(0.2), { ScrollBarImageTransparency = 1 }):Play()
								end)()
							end


							for _, Child in ipairs(TabData[TitleForTab]) do
								pcall(function ()
									if Child.Text:find(TitleForDropdown) and not BeginTweening then
										BeginTweening = true
									end

									Child.Active = true

									TweenService:Create(Child, TweenInfo.new(1), { Transparency = 0 }):Play()
								end)
							end

							coroutine.wrap(ValueChosenFunction)(CurrentDropdownButton.Text)

							CreatedDropdownIconLabel.Text = '+'
						end)

						CurrentDropdownButtonUICorner.Name = 'CurrentDropdownButtonUICorner'
						CurrentDropdownButtonUICorner.Parent = CurrentDropdownButton

						DropdownPositionToUse = DropdownPositionToUse + 0.011

						pcall(function ()
							TweenService:Create(FrameToUseInstead, TweenInfo.new(1), { Size = UDim2.new(0, 425, 0, 270) }):Play()
							TweenService:Create(FrameToUseInstead, TweenInfo.new(1), { ScrollBarImageTransparency = 0 }):Play()
						end)

						coroutine.wrap(function ()
							TweenService:Create(CurrentDropdownButton, TweenInfo.new(1), { Transparency  = 0 }):Play()
						end)()
					end

					CreatedDropdownIconLabel.Text = '-'
				else
					local FrameToTween = CreatedDropdown:FindFirstChild('CurrentDropdownButtonScrollingFrame')

					for _, Child in ipairs(DropdownButtons) do
						coroutine.wrap(function ()
							TweenService:Create(Child, TweenInfo.new(0.2), { Transparency = 1 }):Play()
							TweenService:Create(FrameToTween, TweenInfo.new(1), { Size = UDim2.new(0, 425, 0, 0) }):Play()
							TweenService:Create(FrameToTween, TweenInfo.new(0.2), { ScrollBarImageTransparency = 1 }):Play()
						end)()
					end
					
					BeginTweening = false
					
					for _, Child in ipairs(TabData[TitleForTab]) do
						pcall(function ()
							if Child.Text:find(TitleForDropdown) and not BeginTweening then
								BeginTweening = false
							else
								Child.Active = true

								TweenService:Create(Child, TweenInfo.new(1), { Transparency = 0 }):Play()
							end
						end)
					end

					CreatedDropdownIconLabel.Text = '+'
				end
			end)

			CreatedDropdownUICorner.Name = 'CreatedDropdownUICorner'
			CreatedDropdownUICorner.Parent = CreatedDropdown

			CreatedDropdownIconLabel.Name = 'CreatedDropdownIconLabel'
			CreatedDropdownIconLabel.Parent = CreatedDropdown
			CreatedDropdownIconLabel.BackgroundColor3 = Color3.fromRGB(252, 201, 73)
			CreatedDropdownIconLabel.Position = UDim2.new(0.858823538, 0, 0.233333334, 0)
			CreatedDropdownIconLabel.Size = UDim2.new(0, 46, 0, 16)
			CreatedDropdownIconLabel.Font = Enum.Font.SourceSans
			CreatedDropdownIconLabel.Text = '+'
			CreatedDropdownIconLabel.TextColor3 = Color3.fromRGB(34, 34, 34)
			CreatedDropdownIconLabel.TextSize = 20.000

			CreatedDropdownIconLabelUICorner.CornerRadius = UDim.new(0, 10)
			CreatedDropdownIconLabelUICorner.Name = 'CreatedDropdownIconLabelUICorner'
			CreatedDropdownIconLabelUICorner.Parent = CreatedDropdownIconLabel

			TabData[TitleForTab][#TabData[TitleForTab] + 1] = CreatedDropdown
		end

		function TabFunctions:CreateBox(TitleForBox, FunctionForBox)
			local CreatedBox = Instance.new('Frame')
			local CreatedBoxUICorner = Instance.new('UICorner')
			local CreatedBoxTitleLabel = Instance.new('TextLabel')
			local CreatedBoxInputBox = Instance.new('TextBox')
			local CreatedBoxInputBoxUICorner = Instance.new('UICorner')

			CreatedBox.Name = 'CreatedBox'
			CreatedBox.Parent = LuxUIFrameHolderFrameScrollingFrame
			CreatedBox.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
			CreatedBox.Position = UDim2.new(0.0199999996, 0, 0.00300000003, 0)
			CreatedBox.Size = UDim2.new(0, 425, 0, 60)
			CreatedBox.Visible = false

			CreatedBoxUICorner.Name = 'CreatedBoxUICorner'
			CreatedBoxUICorner.Parent = CreatedBox

			CreatedBoxTitleLabel.Name = 'CreatedBoxTitleLabel'
			CreatedBoxTitleLabel.Parent = CreatedBox
			CreatedBoxTitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			CreatedBoxTitleLabel.BackgroundTransparency = 1.000
			CreatedBoxTitleLabel.Size = UDim2.new(0, 425, 0, 30)
			CreatedBoxTitleLabel.Font = Enum.Font.JosefinSans
			CreatedBoxTitleLabel.Text = TitleForBox
			CreatedBoxTitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			CreatedBoxTitleLabel.TextSize = 20.000

			CreatedBoxInputBox.Name = 'CreatedBoxInputBox'
			CreatedBoxInputBox.Parent = CreatedBox
			CreatedBoxInputBox.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
			CreatedBoxInputBox.Position = UDim2.new(0.014117647, 0, 0.5, 0)
			CreatedBoxInputBox.Size = UDim2.new(0, 413, 0, 23)
			CreatedBoxInputBox.Font = Enum.Font.JosefinSans
			CreatedBoxInputBox.Text = 'Enter Text Here And Press Enter'
			CreatedBoxInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			CreatedBoxInputBox.TextSize = 14.000
			CreatedBoxInputBox.FocusLost:Connect(function (EnterWasPressed)
				if EnterWasPressed then
					coroutine.wrap(FunctionForBox)(CreatedBoxInputBox.Text)

					CreatedBoxInputBox.Text = 'Enter Text Here And Press Enter'
				end
			end)

			CreatedBoxInputBoxUICorner.Name = 'CreatedBoxInputBoxUICorner'
			CreatedBoxInputBoxUICorner.Parent = CreatedBoxInputBox

			TabData[TitleForTab][#TabData[TitleForTab] + 1] = CreatedBox
		end

		return TabFunctions
	end

	return UIFunctions
end

-- Export
return Library
