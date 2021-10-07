--[=[
	Collaborators: userofwind, LeadMarker
	https://userofwind.gitbook.io/ui-library
]=]

-- Before
if game.CoreGui:FindFirstChild('UI') then
	game.CoreGui:FindFirstChild('UI'):Destroy()
end

-- Services
local UserInputService = game:GetService('UserInputService')
local TweenService = game:GetService('TweenService')

-- Table Variables
local Library = {}

-- Player Variables
local LocalMouse = game:GetService('Players').LocalPlayer:GetMouse()

-- Connection Variables
local KeyDownConnection

-- External Functions
local function Ripple(UIObject)
	coroutine.wrap(function()
		local Circle = Instance.new('ImageLabel')
		
		Circle.Name = 'Circle' 
		Circle.Parent = UIObject
		Circle.BackgroundColor3 = Color3.fromRGB(255,255,255)
		Circle.BackgroundTransparency = 1.000
		Circle.ZIndex = 10
		Circle.Image = 'rbxassetid://266543268'
		Circle.ImageColor3 = Color3.fromRGB(211, 211, 211)
		Circle.ImageTransparency = 0.6
		local NewX, NewY = LocalMouse.X - Circle.AbsolutePosition.X, LocalMouse.Y - Circle.AbsolutePosition.Y
		Circle.Position = UDim2.new(0, NewX, 0, NewY)
		local Size = 0

		if UIObject.AbsoluteSize.X > UIObject.AbsoluteSize.Y then
			Size = UIObject.AbsoluteSize.X * 1
		elseif UIObject.AbsoluteSize.X < UIObject.AbsoluteSize.Y then
			Size = UIObject.AbsoluteSize.Y * 1
		elseif UIObject.AbsoluteSize.X == UIObject.AbsoluteSize.Y then
			Size = UIObject.AbsoluteSize.X * 1
		end

		Circle:TweenSizeAndPosition(UDim2.new(0, Size, 0, Size),UDim2.new(0.5, -Size / 2, 0.5, -Size / 2),'Out', 'Quad', 0.2, false)

		for i = 1, 15 do
			Circle.ImageTransparency = Circle.ImageTransparency + 0.05
			task.wait()
		end
		
		Circle:Destroy()
	end)()
end

local function AddDraggability(HigherUIObject, UIObject)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil

    local function Update(InputToUpdate)
        local DeltaPosition = InputToUpdate.Position - DragStart
        local PositionToUse =
            UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + DeltaPosition.X,
            StartPosition.Y.Scale,
            StartPosition.Y.Offset + DeltaPosition.Y
        )

        TweenService:Create(UIObject, TweenInfo.new(0.2), { Position = PositionToUse }):Play()
    end

    HigherUIObject.InputBegan:Connect(function(BeganInput)
		if BeganInput.UserInputType == Enum.UserInputType.MouseButton1 or BeganInput.UserInputType == Enum.UserInputType.Touch then
			Dragging = true
			DragStart = BeganInput.Position
			StartPosition = UIObject.Position

			BeganInput.Changed:Connect(function()
				if BeganInput.UserInputState == Enum.UserInputState.End then
					Dragging = false
					end
			end)
		end
	end)

    HigherUIObject.InputChanged:Connect(function(ChangedInput)
        if ChangedInput.UserInputType == Enum.UserInputType.MouseMovement or ChangedInput.UserInputType == Enum.UserInputType.Touch then
            DragInput = ChangedInput
        end
    end)

    UserInputService.InputChanged:Connect(function(ChangedInput)
        if ChangedInput == DragInput and Dragging then
            Update(ChangedInput)
        end
    end)
end

local bruh = Color3.fromRGB(255, 0, 127)
-- Library Functions
function Library:SetupUI(title,Bruh)
	bruh = Bruh or bruh
	local UI = Instance.new('ScreenGui')
	local UICarrier = Instance.new('Frame')
	local UICarrierShape = Instance.new('UICorner')
	local UIScreen = Instance.new('Frame')
	local UIScreenShape = Instance.new('UICorner')
	local UITabHolderLayout = Instance.new('UIListLayout')
	local UITabHolder = Instance.new('Frame')
	local UITabHolderShape = Instance.new('UICorner')
	local UICreationsHolder = Instance.new('Frame')
	local UICreationsHolderShape = Instance.new('UICorner')
	local UITabScroll = Instance.new('ScrollingFrame')
	local UIPageHolder = Instance.new('Frame')
	local UIPageHolderShape = Instance.new('UICorner')
	local UIPageShape = Instance.new('UICorner')
	local UITitle = Instance.new('TextLabel')

	UI.Name = 'UI'
	UI.Parent = game.CoreGui

	UICarrier.Name = 'UICarrier'
	UICarrier.Parent = UI
	UICarrier.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	UICarrier.BorderSizePixel = 0
	UICarrier.Position = UDim2.new(0.263398856, 0, 0.342380494, 0)
	UICarrier.Size = UDim2.new(0, 600, 0, 39)

	UICarrierShape.CornerRadius = UDim.new(0, 4)
	UICarrierShape.Name = 'UICarrier'
	UICarrierShape.Parent = UICarrier

	UIScreen.Name = 'UIScreen'
	UIScreen.Parent = UICarrier
	UIScreen.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	UIScreen.BorderSizePixel = 0
	UIScreen.Position = UDim2.new(0, 0, 0.769230008, 0)
	UIScreen.Size = UDim2.new(0, 600, 0, 348)
	UIScreen.ZIndex = 0

	UIScreenShape.CornerRadius = UDim.new(0, 4)
	UIScreenShape.Name = 'UIScreenShape'
	UIScreenShape.Parent = UIScreen

	UITabHolder.Name = 'UITabHolder'
	UITabHolder.Parent = UIScreen
	UITabHolder.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	UITabHolder.Position = UDim2.new(0.00999999978, 0, 0.0459770113, 0)
	UITabHolder.Size = UDim2.new(0, 154, 0, 326)

	UITabHolderShape.CornerRadius = UDim.new(0, 5)
	UITabHolderShape.Name = 'UITabHolderShape'
	UITabHolderShape.Parent = UITabHolder

	UICreationsHolder.Name = 'UICreationsHolder'
	UICreationsHolder.Parent = UIScreen
	UICreationsHolder.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	UICreationsHolder.Position = UDim2.new(0.283333331, 0, 0.0459770113, 0)
	UICreationsHolder.Size = UDim2.new(0, 424, 0, 326)

	UICreationsHolderShape.CornerRadius = UDim.new(0, 4)
	UICreationsHolderShape.Name = 'UICreationsHolderShape'
	UICreationsHolderShape.Parent = UICreationsHolder

	UIPageHolder.Name = 'UIPageHolder'
	UIPageHolder.Parent = UICreationsHolder
	UIPageHolder.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	UIPageHolder.BorderSizePixel = 0
	UIPageHolder.Position = UDim2.new(0.5, -206, 0.0122699384, 2)
	UIPageHolder.Size = UDim2.new(0, 412, 0, 314)

	UIPageHolderShape.CornerRadius = UDim.new(0, 4)
	UIPageHolderShape.Name = 'UIPageHolder'
	UIPageHolderShape.Parent = UIPageHolder

	UIPageShape.CornerRadius = UDim.new(0, 4)
	UIPageShape.Name = 'UIPageShape'
	UIPageShape.Parent = UIPageHolder
	
	UITabScroll.Name = 'UITabScroll'
	UITabScroll.Parent = UITabHolder
	UITabScroll.Active = true
	UITabScroll.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	UITabScroll.BackgroundTransparency = 1.000
	UITabScroll.BorderSizePixel = 0
	UITabScroll.Position = UDim2.new(0, 0, 0.0184049085, 0)
	UITabScroll.Size = UDim2.new(0, 153, 0, 318)
	UITabScroll.ScrollBarThickness = 4
	UITabScroll.CanvasSize = UDim2.new(0,0,0,0)
	
	UITabHolderLayout.Name = 'UITabHolderLayout'
	UITabHolderLayout.Parent = UITabScroll
	UITabHolderLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UITabHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UITabHolderLayout.Padding = UDim.new(0, 1)

	UITitle.Name = 'UITitle'
	UITitle.Parent = UICarrier
	UITitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UITitle.BackgroundTransparency = 1.000
	UITitle.Position = UDim2.new(0.0233333334, 0, 0.256410271, 0)
	UITitle.Size = UDim2.new(0, 200, 0, 18)
	UITitle.Font = Enum.Font.Gotham
	UITitle.Text = title or 'Title'
	UITitle.TextColor3 = bruh
	UITitle.TextSize = 24.000
	UITitle.TextXAlignment = Enum.TextXAlignment.Left

	AddDraggability(UICarrier, UICarrier)

	local UIFunctions = {}
	
	function UIFunctions:SetHotkey(Hotkey)
	    print(1)
	    if KeyDownConnection then
	        KeyDownConnection:Disconnect()
	    end
	    
	    KeyDownConnection = LocalMouse.KeyDown:Connect(function (Key)
	        if Key == Hotkey then
	            UIScreen.Visible = not UIScreen.Visible
	        end
	    end)
	end
	
	function UIFunctions:Destroy()
	    if KeyDownConnection then
	        KeyDownConnection:Disconnect()
	    end
	    
	    UI:Destroy()
	end
	
	function UIFunctions:CreateTab(TabTitle)
		local CreatedTab = Instance.new('TextButton')
		local CreatedTabShape = Instance.new('UICorner')
		local CreatedTabPage = Instance.new('ScrollingFrame')
		local CreatedTabUILayout = Instance.new('UIListLayout')

		CreatedTab.Name = 'CreatedTab'
		CreatedTab.Parent = UITabScroll
		CreatedTab.BackgroundColor3 = bruh
		CreatedTab.BackgroundTransparency = 1
		CreatedTab.Position = UDim2.new(1.71241832, 0, -0.130368099, 0)
		CreatedTab.Size = UDim2.new(0, 137, 0, 30)
		CreatedTab.AutoButtonColor = false
		CreatedTab.Font = Enum.Font.Gotham
		CreatedTab.TextColor3 = bruh
		CreatedTab.TextSize = 14.000
		CreatedTab.Text = TabTitle or 'New Tab'
	
		CreatedTabShape.CornerRadius = UDim.new(0, 4)
		CreatedTabShape.Name = 'CreatedTabShape'
		CreatedTabShape.Parent = CreatedTab
	
		CreatedTabPage.Name = 'CreatedTabPage'
		CreatedTabPage.Parent = UIPageHolder
		CreatedTabPage.Active = true
		CreatedTabPage.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		CreatedTabPage.BorderSizePixel = 0
		CreatedTabPage.Position = UDim2.new(0.487864077, -198, 0.00636942685, 5)
		CreatedTabPage.Size = UDim2.new(0, 405, 0, 297)
		CreatedTabPage.ScrollBarThickness = 3
		CreatedTabPage.Visible = false
		CreatedTabPage.CanvasSize = UDim2.new(0,0,0,0)

		CreatedTabUILayout.Name = 'UIPageLayout'
		CreatedTabUILayout.Parent = CreatedTabPage
		CreatedTabUILayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		CreatedTabUILayout.SortOrder = Enum.SortOrder.LayoutOrder
		CreatedTabUILayout.Padding = UDim.new(0, 5)

		CreatedTab.MouseButton1Click:Connect(function()
		    for _, Child in ipairs(UITabScroll:GetChildren()) do
		        if Child.Name == 'CreatedTab' then
		            TweenService:Create(Child, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
			        TweenService:Create(Child, TweenInfo.new(.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = bruh}):Play()
		        end
		    end
		    
			for _, Child in ipairs(UIPageHolder:GetChildren()) do
			    if Child:IsA('ScrollingFrame') then
				    Child.Visible = false 
				end
			end

			CreatedTabPage.Visible = true

			for _, Child in ipairs(UIPageHolder:GetChildren()) do
				if Child:IsA('TextButton') then
					TweenService:Create(Child, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
					TweenService:Create(Child, TweenInfo.new(.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.new(255, 0, 127)}):Play()
				end
			end

			TweenService:Create(CreatedTab, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
			TweenService:Create(CreatedTab, TweenInfo.new(.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.new(0, 0, 0)}):Play()
		end)

		CreatedTabPage.CanvasSize = UDim2.new(0, 0, 0, CreatedTabUILayout.AbsoluteContentSize.Y)
		UITabScroll.CanvasSize = UDim2.new(0, 0, 0, UITabHolderLayout.AbsoluteContentSize.Y)

		local TabFunctions = {}

		function TabFunctions:CreateButton(ButtonTitle, ButtonCallback)
			local CreatedButton = Instance.new('TextButton')
			local CreatedButtonShape = Instance.new('UICorner')

			CreatedButton.Name = 'CreatedButton'
			CreatedButton.Parent = CreatedTabPage
			CreatedButton.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
			CreatedButton.BorderSizePixel = 0
			CreatedButton.Position = UDim2.new(-0.0148148146, 0, 0, 0)
			CreatedButton.Size = UDim2.new(0, 393, 0, 30)
			CreatedButton.AutoButtonColor = false
			CreatedButton.Font = Enum.Font.Gotham
			CreatedButton.TextColor3 = bruh
			CreatedButton.TextSize = 17.000
			CreatedButton.Text = ButtonTitle or 'Button'
			CreatedButton.ClipsDescendants = true
			
			CreatedButtonShape.CornerRadius = UDim.new(0, 4)
			CreatedButtonShape.Name = 'CreatedButtonShape'
			CreatedButtonShape.Parent = CreatedButton

			CreatedButton.MouseEnter:Connect(function()
				TweenService:Create(CreatedButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(29,29,29)}):Play()
			end)

			CreatedButton.MouseLeave:Connect(function() 
				TweenService:Create(CreatedButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(26,26,26)}):Play()
			end)

			CreatedButton.MouseButton1Click:Connect(function() 
				local StatusOfCallback, Error = pcall(ButtonCallback)

				if not StatusOfCallback then
					print(Error)
				end

				Ripple(CreatedButton)
			end)
		end

		function TabFunctions:CreateToggle(ToggleTitle, ToggleCallback)
			local Toggled = false 

			local CreatedToggle = Instance.new('TextButton')
			local CreatedToggleShape = Instance.new('UICorner')
			local CreatedToggleInside = Instance.new('Frame')
			local CreatedToggleInsideShape = Instance.new('UICorner')

			CreatedToggle.Name = 'CreatedToggle'
			CreatedToggle.Parent = CreatedTabPage
			CreatedToggle.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
			CreatedToggle.BorderSizePixel = 0
			CreatedToggle.Position = UDim2.new(-0.0148148146, 0, 0, 0)
			CreatedToggle.Size = UDim2.new(0, 393, 0, 30)
			CreatedToggle.AutoButtonColor = false
			CreatedToggle.Font = Enum.Font.Gotham
			CreatedToggle.Text = ToggleTitle or 'Toggle'
			CreatedToggle.TextColor3 = bruh
			CreatedToggle.TextSize = 17.000
			CreatedToggle.ClipsDescendants = true
			
			CreatedToggleShape.CornerRadius = UDim.new(0, 4)
			CreatedToggleShape.Name = 'CreatedToggleShape'
			CreatedToggleShape.Parent = CreatedToggle
			
			CreatedToggleInside.Name = 'CreatedToggleInside'
			CreatedToggleInside.Parent = CreatedToggle
			CreatedToggleInside.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			CreatedToggleInside.BorderSizePixel = 0
			CreatedToggleInside.Position = UDim2.new(0.926208675, 0, 0.166666672, 0)
			CreatedToggleInside.Size = UDim2.new(0, 20, 0, 20)
			
			CreatedToggleInsideShape.CornerRadius = UDim.new(0, 4)
			CreatedToggleInsideShape.Name = 'CreatedToggleInsideShape'
			CreatedToggleInsideShape.Parent = CreatedToggleInside

			CreatedToggle.MouseEnter:Connect(function()
				TweenService:Create(CreatedToggle, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(29,29,29)}):Play()
			end)

			CreatedToggle.MouseLeave:Connect(function() 
				TweenService:Create(CreatedToggle, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(26,26,26)}):Play()
			end)

			CreatedToggle.MouseButton1Click:Connect(function() 
				if not Toggled then
					Toggled = not Toggled

					TweenService:Create(CreatedToggleInside, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = bruh}):Play()
				else    
					Toggled = not Toggled 

					TweenService:Create(CreatedToggleInside, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 0, 0)}):Play()
				end

				local StatusOfCallback, Error = pcall(ToggleCallback, Toggled)

				if not StatusOfCallback then
					print(Error)
				end

				Ripple(CreatedToggle)
			end)
		end

		function TabFunctions:CreateSlider(SliderTitle, MinimumNumber, MaximumNumber, DefaultNumber, SliderCallback)
            local SliderDragging = false

            local CreatedSlider = Instance.new('TextButton')
            local CreatedSliderShape = Instance.new('UICorner')
            local CreatedSliderInside = Instance.new('TextLabel')
            local CreatedSliderHolder = Instance.new('Frame')
            local CreatedSliderHolderShape = Instance.new('UICorner')
            local CreatedSliderInner = Instance.new('Frame')
            local CreatedSliderInnerShape = Instance.new('UICorner')
            local CreatedSliderCount = Instance.new('TextLabel')

            CreatedSlider.Name = 'CreatedSlider'
            CreatedSlider.Parent = CreatedTabPage
            CreatedSlider.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
            CreatedSlider.BorderColor3 = Color3.fromRGB(27, 42, 53)
            CreatedSlider.BorderSizePixel = 0
            CreatedSlider.Position = UDim2.new(-0.0271604937, 0, 0.00796178356, 0)
            CreatedSlider.Size = UDim2.new(0, 393, 0, 30)
            CreatedSlider.AutoButtonColor = false
            CreatedSlider.Font = Enum.Font.Gotham
            CreatedSlider.Text = ''
            CreatedSlider.TextColor3 = bruh
            CreatedSlider.TextSize = 17.000
            
            CreatedSliderShape.CornerRadius = UDim.new(0, 4)
            CreatedSliderShape.Name = 'CreatedSliderShape'
            CreatedSliderShape.Parent = CreatedSlider
            
            CreatedSliderInside.Name = 'CreatedSliderInside'
            CreatedSliderInside.Parent = CreatedSlider
            CreatedSliderInside.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
            CreatedSliderInside.BackgroundTransparency = 1.000
            CreatedSliderInside.BorderColor3 = Color3.fromRGB(27, 42, 53)
            CreatedSliderInside.BorderSizePixel = 0
            CreatedSliderInside.Position = UDim2.new(0.0199039839, 0, -0.0299580898, 0)
            CreatedSliderInside.Size = UDim2.new(0, 119, 0, 30)
            CreatedSliderInside.SizeConstraint = Enum.SizeConstraint.RelativeXX
            CreatedSliderInside.Font = Enum.Font.Gotham
            CreatedSliderInside.Text = SliderTitle or 'Slider'
            CreatedSliderInside.TextColor3 = bruh
            CreatedSliderInside.TextSize = 17.000
            CreatedSliderInside.TextWrapped = true
            CreatedSliderInside.TextXAlignment = Enum.TextXAlignment.Left
            
            CreatedSliderHolder.Name = 'CreatedSliderHolder'
            CreatedSliderHolder.Parent = CreatedSlider
            CreatedSliderHolder.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            CreatedSliderHolder.BorderSizePixel = 0
            CreatedSliderHolder.Position = UDim2.new(0.524173021, 0, 0.303333551, 0)
            CreatedSliderHolder.Size = UDim2.new(0, 170, 0, 10)
            
            CreatedSliderHolderShape.CornerRadius = UDim.new(0, 4)
            CreatedSliderHolderShape.Name = 'CreatedSliderHolderShape'
            CreatedSliderHolderShape.Parent = CreatedSliderHolder
            
            CreatedSliderInner.Name = 'CreatedSliderInner'
            CreatedSliderInner.Parent = CreatedSliderHolder
            CreatedSliderInner.BackgroundColor3 = bruh
            CreatedSliderInner.Size = UDim2.new((DefaultNumber or 0) / MaximumNumber, 0, 0, 10)
            CreatedSliderInner.BorderSizePixel = 0
            
            CreatedSliderInnerShape.CornerRadius = UDim.new(0, 4)
            CreatedSliderInnerShape.Name = 'CreatedSliderInnerShape'
            CreatedSliderInnerShape.Parent = CreatedSliderInner
            
            CreatedSliderCount.Name = 'CreatedSliderCount'
            CreatedSliderCount.Parent = CreatedSlider
            CreatedSliderCount.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            CreatedSliderCount.BackgroundTransparency = 1.000
            CreatedSliderCount.Position = UDim2.new(0.463104337, 0, 0.233333349, 0)
            CreatedSliderCount.Size = UDim2.new(0, 20, 0, 14)
            CreatedSliderCount.Font = Enum.Font.Gotham
            CreatedSliderCount.Text = tostring(DefaultNumber and math.floor((DefaultNumber / MaximumNumber) * (MaximumNumber - MinimumNumber) + MinimumNumber) or 0)
            CreatedSliderCount.TextColor3 = bruh
            CreatedSliderCount.TextScaled = true
            CreatedSliderCount.TextSize = 14.000
            CreatedSliderCount.TextWrapped = true

            local function CreateSlide(input)
                local SliderPosition = UDim2.new(math.clamp((input.Position.X - CreatedSliderHolder.AbsolutePosition.X) / CreatedSliderHolder.AbsoluteSize.X, 0, 1), 0, 0, 10)

                CreatedSliderInner:TweenSize(SliderPosition, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)

                local Value = math.floor(((SliderPosition.X.Scale * MaximumNumber) / MaximumNumber) * (MaximumNumber - MinimumNumber) + MinimumNumber)
				
                CreatedSliderCount.Text = tostring(Value)
				
                local StatusOfCallback, Error = pcall(SliderCallback, Value)

				if not StatusOfCallback then
					print(Error)
				end
			end

            CreatedSliderHolder.InputBegan:Connect(function(BeganInput)
                if BeganInput.UserInputType == Enum.UserInputType.MouseButton1 then
                    CreateSlide(BeganInput)
                    SliderDragging = true
                end
            end)

            CreatedSliderHolder.InputEnded:Connect(function(EndedInput)
                if EndedInput.UserInputType == Enum.UserInputType.MouseButton1 then
                    SliderDragging = false
                end
            end)

            UserInputService.InputChanged:Connect(function(ChangedInput)
                if SliderDragging and ChangedInput.UserInputType == Enum.UserInputType.MouseMovement then
                    CreateSlide(ChangedInput)
                end
            end)

		end

		function TabFunctions:CreateDropdown(DropdownTitle, DropdownValues, DropdownCallback)
			local ItemCount = 0 
			local FrameSize = 9 
			local DropToggled = false
			
			local DropLabel = Instance.new('TextLabel')
			local DropImageLabel = Instance.new('ImageLabel')
			local DropFrame = Instance.new('Frame')
			local DropFrameCorner = Instance.new('UICorner')
			local DropFrameLayout = Instance.new('UIListLayout')
			local DropInnerFrame = Instance.new('ScrollingFrame')
			local DropInnerLayout = Instance.new('UIListLayout')
			local CreatedDropdown = Instance.new('TextButton')
			local CreatedDropdownShape = Instance.new('UICorner')

			CreatedDropdown.Name = 'CreatedDropdown'
			CreatedDropdown.Parent = CreatedTabPage
			CreatedDropdown.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
			CreatedDropdown.BorderSizePixel = 0
			CreatedDropdown.Position = UDim2.new(-0.0148148146, 0, 0, 0)
			CreatedDropdown.Size = UDim2.new(0, 393, 0, 30)
			CreatedDropdown.AutoButtonColor = false
			CreatedDropdown.Font = Enum.Font.Gotham
			CreatedDropdown.Text = ''
			CreatedDropdown.TextColor3 = bruh
			CreatedDropdown.TextSize = 17.000

			CreatedDropdownShape.CornerRadius = UDim.new(0, 4)
			CreatedDropdownShape.Name = 'CreatedButtonShape'
			CreatedDropdownShape.Parent = CreatedDropdown

			DropLabel.Name = 'DropLabel'
			DropLabel.Parent = CreatedDropdown
			DropLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropLabel.BackgroundTransparency = 1.000
			DropLabel.Position = UDim2.new(0.0178117044, 0, 0.100000001, 0)
			DropLabel.Size = UDim2.new(0, 386, 0, 24)
			DropLabel.Font = Enum.Font.Gotham
			DropLabel.Text = DropdownTitle or 'Dropdown'
			DropLabel.TextColor3 = bruh
			DropLabel.TextSize = 17.000
			
			DropImageLabel.Name = 'DropImageLabel'
			DropImageLabel.Parent = CreatedDropdown
			DropImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropImageLabel.BackgroundTransparency = 1.000
			DropImageLabel.Position = UDim2.new(0.900763333, 0, 0, 0)
			DropImageLabel.Size = UDim2.new(0, 30, 0, 30)
			DropImageLabel.Image = 'rbxassetid://3926305904'
			DropImageLabel.ImageRectOffset = Vector2.new(44, 404)
			DropImageLabel.ImageRectSize = Vector2.new(36, 36)
			
			DropFrame.Name = 'DropFrame'
			DropFrame.Parent = CreatedTabPage
			
			DropFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
			DropFrame.Position = UDim2.new(0.0148148146, 0, 0.202020198, 0)
			DropFrame.Size = UDim2.new(0, 393, 0, 40)
			DropFrame.Visible = false
			
			DropFrameCorner.CornerRadius = UDim.new(0, 4)
			DropFrameCorner.Name = 'DropFrameCorner'
			DropFrameCorner.Parent = DropFrame
			
			DropFrameLayout.Name = 'DropFrameLayout'
			DropFrameLayout.Parent = DropFrame
			DropFrameLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			DropFrameLayout.SortOrder = Enum.SortOrder.LayoutOrder
			DropFrameLayout.VerticalAlignment = Enum.VerticalAlignment.Center
			
			DropInnerFrame.Name = 'DropInnerFrame'
			DropInnerFrame.Parent = DropFrame
			DropInnerFrame.Active = true
			DropInnerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropInnerFrame.BackgroundTransparency = 1.000
			DropInnerFrame.BorderSizePixel = 0
			DropInnerFrame.Size = UDim2.new(0, 385, 0, 30)
			DropInnerFrame.ScrollBarThickness = 3
			DropInnerFrame.CanvasSize = UDim2.new(0,0,0,0)
			
			DropInnerLayout.Name = 'DropInnerLayout'
			DropInnerLayout.Parent = DropInnerFrame
			DropInnerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
			CreatedDropdown.ClipsDescendants = true
			
			CreatedDropdown.MouseEnter:Connect(function()
				TweenService:Create(CreatedDropdown, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(29,29,29)}):Play()
			end)

			CreatedDropdown.MouseLeave:Connect(function() 
				TweenService:Create(CreatedDropdown, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(26,26,26)}):Play()
			end)

			CreatedDropdown.MouseButton1Click:Connect(function()
				Ripple(CreatedDropdown)
				
				if DropToggled == false then
					DropFrame.Visible = true 
					DropFrame:TweenSize(UDim2.new(0, 393, 0, FrameSize), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.1, true)
				
					DropInnerFrame:TweenSize(UDim2.new(0, 385, 0, FrameSize), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.1, true)
				
					TweenService:Create(DropImageLabel, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Rotation = 180}):Play()
					repeat task.wait() until DropFrame.Size == UDim2.new(0, 393, 0, FrameSize)
					CreatedTabPage.CanvasSize = UDim2.new(0,0,0,CreatedTabUILayout.AbsoluteContentSize.Y)
				else    
					DropFrame:TweenSize(UDim2.new(0, 393, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.1, true)
				
					DropInnerFrame:TweenSize(UDim2.new(0, 385, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.1, true)
				
					TweenService:Create(DropImageLabel, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Rotation = 0}):Play()
					repeat task.wait() until DropFrame.Size == UDim2.new(0, 393, 0, 0)
					DropFrame.Visible = false
					CreatedTabPage.CanvasSize = UDim2.new(0, 0, 0,CreatedTabUILayout.AbsoluteContentSize.Y)
				end
				DropToggled = not DropToggled
			end)

			for _, Child in next, DropdownValues do

				ItemCount = ItemCount + 1 
				
				if ItemCount <= 2 then
					FrameSize = FrameSize + 30
				elseif ItemCount >= 3 then
					FrameSize = 100
				end

				local DropdownOption = Instance.new('TextButton')
				local DropdownOptionCorner = Instance.new('UICorner')

				DropdownOption.Name = 'DropdownOption'
				DropdownOption.Parent = DropInnerFrame
				DropdownOption.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
				DropdownOption.BorderSizePixel = 0
				DropdownOption.Position = UDim2.new(0.00649350649, 0, 0, 0)
				DropdownOption.Size = UDim2.new(0, 369, 0, 30)
				DropdownOption.AutoButtonColor = false
				DropdownOption.Font = Enum.Font.Gotham
				DropdownOption.Text = Child
				DropdownOption.TextColor3 = bruh
				DropdownOption.TextSize = 17.000
				
				DropdownOptionCorner.CornerRadius = UDim.new(0, 4)
				DropdownOptionCorner.Name = 'DropdownOptionCorner'
				DropdownOptionCorner.Parent = DropdownOption

				DropdownOption.MouseEnter:Connect(function()
					TweenService:Create(DropdownOption, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(29,29,29)}):Play()
				end)

				DropdownOption.MouseLeave:Connect(function() 
					TweenService:Create(DropdownOption, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(26,26,26)}):Play()
				end)

				DropdownOption.MouseButton1Click:Connect(function()
					local StatusOfCallback, Error = pcall(DropdownCallback, Child)

					if not StatusOfCallback then -- im missing an end \mvm
						print(Error)
					end

					DropLabel.Text = DropdownTitle .. ': ' .. Child
					DropFrame:TweenSize(UDim2.new(0, 393, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.1, true)
				
					DropInnerFrame:TweenSize(UDim2.new(0, 385, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.1, true)
					TweenService:Create(DropImageLabel, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Rotation = 0}):Play()
					repeat
						task.wait()
					until DropFrame.Size == UDim2.new(0, 393, 0, 0)
					DropFrame.Visible = false 
					CreatedTabPage.CanvasSize = UDim2.new(0, 0, 0,CreatedTabUILayout.AbsoluteContentSize.Y)
					DropToggled = not DropToggled
				end)
				
				DropInnerFrame.CanvasSize = UDim2.new(0,0,0, DropInnerLayout.AbsoluteContentSize.Y + 15)
			end

			CreatedTabPage.CanvasSize = UDim2.new(0, 0, 0,CreatedTabUILayout.AbsoluteContentSize.Y)
		end 
	
		function TabFunctions:CreateLabel(LabelTitle)
			local CreatedLabel = Instance.new('TextButton')
			local CreatedLabelShape = Instance.new('UICorner')
			local CreatedLabelInside = Instance.new('TextLabel')

			CreatedLabel.Name = 'CreatedLabel'
			CreatedLabel.Parent = CreatedTabPage
			CreatedLabel.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
			CreatedLabel.BorderSizePixel = 0
			CreatedLabel.Position = UDim2.new(-0.0148148146, 0, 0, 0)
			CreatedLabel.Size = UDim2.new(0, 393, 0, 30)
			CreatedLabel.AutoButtonColor = false
			CreatedLabel.Font = Enum.Font.Gotham
			CreatedLabel.Text = ''
			CreatedLabel.TextColor3 = bruh
			CreatedLabel.TextSize = 17.000
			
			CreatedLabelShape.CornerRadius = UDim.new(0, 4)
			CreatedLabelShape.Name = 'CreatedLabelShape'
			CreatedLabelShape.Parent = CreatedLabel
			
			CreatedLabelInside.Name = 'CreatedLabelInside'
			CreatedLabelInside.Parent = CreatedLabel
			CreatedLabelInside.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
			CreatedLabelInside.BackgroundTransparency = 1.000
			CreatedLabelInside.BorderColor3 = Color3.fromRGB(27, 42, 53)
			CreatedLabelInside.BorderSizePixel = 0
			CreatedLabelInside.Position = UDim2.new(0.0148148146, 0, -0.0309764445, 0)
			CreatedLabelInside.Size = UDim2.new(0, 393, 0, 30)
			CreatedLabelInside.SizeConstraint = Enum.SizeConstraint.RelativeXX
			CreatedLabelInside.Font = Enum.Font.Gotham
			CreatedLabelInside.TextColor3 = bruh
			CreatedLabelInside.TextSize = 17.000
			CreatedLabelInside.TextWrapped = true
			CreatedLabelInside.TextXAlignment = Enum.TextXAlignment.Left
			CreatedLabelInside.Text = LabelTitle or ''
		end
		
		function TabFunctions:CreateTextBox(TextBoxTitle, TextBoxHolder, TextBoxCallback)
            local CreatedTextBox = Instance.new('TextButton')
            local CreatedTextBoxShape = Instance.new('UICorner')
            local CreatedTextBoxInside = Instance.new('TextLabel')
            local CreatedTextBoxReality = Instance.new('TextBox')
            local CreatedTextBoxRealityShape = Instance.new('UICorner')

            CreatedTextBox.Name = 'CreatedTextBox'
            CreatedTextBox.Parent = CreatedTabPage
            CreatedTextBox.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
            CreatedTextBox.BorderColor3 = Color3.fromRGB(27, 42, 53)
            CreatedTextBox.BorderSizePixel = 0
            CreatedTextBox.Position = UDim2.new(-0.0148148146, 0, 0, 0)
            CreatedTextBox.Size = UDim2.new(0, 393, 0, 30)
            CreatedTextBox.AutoButtonColor = false
            CreatedTextBox.Font = Enum.Font.Gotham
            CreatedTextBox.Text = ''
            CreatedTextBox.TextColor3 = bruh
            CreatedTextBox.TextSize = 17.000
            
            CreatedTextBoxShape.CornerRadius = UDim.new(0, 4)
            CreatedTextBoxShape.Name = 'CreatedTextBoxShape'
            CreatedTextBoxShape.Parent = CreatedTextBox
            
            CreatedTextBoxInside.Name = 'CreatedTextBoxInside'
            CreatedTextBoxInside.Parent = CreatedTextBox
            CreatedTextBoxInside.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
            CreatedTextBoxInside.BorderColor3 = Color3.fromRGB(27, 42, 53)
            CreatedTextBoxInside.BorderSizePixel = 0
            CreatedTextBoxInside.Position = UDim2.new(0.0199039839, 0, -0.0299580898, 0)
            CreatedTextBoxInside.Size = UDim2.new(0, 369, 0, 30)
            CreatedTextBoxInside.SizeConstraint = Enum.SizeConstraint.RelativeXX
            CreatedTextBoxInside.Font = Enum.Font.Gotham
            CreatedTextBoxInside.Text = TextBoxTitle or 'TextBox'
            CreatedTextBoxInside.TextColor3 = bruh
            CreatedTextBoxInside.TextSize = 17.000
            CreatedTextBoxInside.TextWrapped = true
            CreatedTextBoxInside.TextXAlignment = Enum.TextXAlignment.Left
            CreatedTextBoxInside.BackgroundTransparency = 1
            
            CreatedTextBoxReality.Name = 'CreatedTextBoxReality'
            CreatedTextBoxReality.Parent = CreatedTextBox
            CreatedTextBoxReality.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            CreatedTextBoxReality.BorderSizePixel = 0
            CreatedTextBoxReality.Position = UDim2.new(0.707379162, 0, 0.13333334, 0)
            CreatedTextBoxReality.Size = UDim2.new(0, 106, 0, 20)
            CreatedTextBoxReality.Font = Enum.Font.Gotham
            CreatedTextBoxReality.PlaceholderColor3 = bruh
            CreatedTextBoxReality.PlaceholderText = TextBoxHolder or 'Text here'
            CreatedTextBoxReality.Text = ''
            CreatedTextBoxReality.TextColor3 = bruh
            CreatedTextBoxReality.TextSize = 14.000
            CreatedTextBoxReality.TextScaled = true
            
            CreatedTextBoxRealityShape.CornerRadius = UDim.new(0, 4)
            CreatedTextBoxRealityShape.Parent = CreatedTextBoxReality

			CreatedTextBox.MouseEnter:Connect(function()
				TweenService:Create(CreatedTextBox, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(29,29,29)}):Play()
			end)

			CreatedTextBox.MouseLeave:Connect(function() 
				TweenService:Create(CreatedTextBox, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(26,26,26)}):Play()
			end)

            CreatedTextBoxReality.FocusLost:Connect(function(EnterWasPressed)
                if EnterWasPressed then --EnterWasPressed🤓
                    if #CreatedTextBoxReality.Text > 0 then 
                        local StatusOfCallback, Error = pcall(TextBoxCallback, CreatedTextBoxReality.Text)

						if not StatusOfCallback then
							print(Error)
						end
                    end
                end -- kys lead - wind | ok 
            end)
		end

		return TabFunctions
	end

    function UIFunctions:Notify(NotificationDescription, NotificationTime)
        local CreatedNotification = Instance.new('ScreenGui')
		local CreatedNotificationScreen = Instance.new('Frame')
		local CreatedNotificationScreenShape = Instance.new('UICorner')
		local CreatedNotificationTitle = Instance.new('TextLabel')
		local CreatedNotificationDescription = Instance.new('TextLabel')
		local CreatedNotificationDescriptionShape = Instance.new('UICorner')

		CreatedNotification.Name = 'CreatedNotification'
		CreatedNotification.Parent = game.CoreGui
		CreatedNotification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		
		CreatedNotificationScreen.Name = 'CreatedNotificationScreen'
		CreatedNotificationScreen.Parent = CreatedNotification
		CreatedNotificationScreen.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
		CreatedNotificationScreen.Position = UDim2.new(-0.175, 0, 0.646, 0)
		CreatedNotificationScreen.Size = UDim2.new(0, 222, 0, 258)

		CreatedNotificationScreenShape.Name = 'CreatedNotificationScreenShape'
		CreatedNotificationScreenShape.Parent = CreatedNotificationScreen
		CreatedNotificationScreenShape.CornerRadius = UDim.new(0, 4)

		CreatedNotificationTitle.Name = 'CreatedNotificationTitle'
		CreatedNotificationTitle.Parent = CreatedNotificationScreen
		CreatedNotificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CreatedNotificationTitle.BackgroundTransparency = 1.000
		CreatedNotificationTitle.Position = UDim2.new(0.0495495498, 0, 0.0232558139, 0)
		CreatedNotificationTitle.Size = UDim2.new(0, 200, 0, 27)
		CreatedNotificationTitle.Font = Enum.Font.Gotham
		CreatedNotificationTitle.Text = 'Notification'
		CreatedNotificationTitle.TextColor3 = bruh
		CreatedNotificationTitle.TextSize = 25.000

		CreatedNotificationDescription.Name = 'CreatedNotificationDescription'
		CreatedNotificationDescription.Parent = CreatedNotificationScreen
		CreatedNotificationDescription.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		CreatedNotificationDescription.Position = UDim2.new(0.0495495498, 0, 0.162790701, 0)
		CreatedNotificationDescription.Size = UDim2.new(0, 200, 0, 209)
		CreatedNotificationDescription.Font = Enum.Font.Gotham
		CreatedNotificationDescription.Text = NotificationDescription
		CreatedNotificationDescription.TextColor3 = bruh
		CreatedNotificationDescription.TextSize = 16.000
		CreatedNotificationDescription.TextWrapped = true

		CreatedNotificationDescriptionShape.Name = 'CreatedNotificationDescriptionShape'
		CreatedNotificationDescriptionShape.Parent = CreatedNotificationDescription
		CreatedNotificationDescriptionShape.CornerRadius = UDim.new(0, 4)

        TweenService:Create(CreatedNotificationScreen, TweenInfo.new(1), { Position = UDim2.new(0.016, 0, 0.651, 0) }):Play()
        
        task.wait(NotificationTime or 5)

        TweenService:Create(CreatedNotificationScreen, TweenInfo.new(0.7), { Position = UDim2.new(-0.175, 0, 0.646, 0) }):Play()
    
        task.wait(0.7)

        CreatedNotificationScreen:Destroy()
    end

    return UIFunctions
end

return Library
