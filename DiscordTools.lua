-- UI Setup
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/userofwind/LuxInc/master/LuxUILibrary.lua'))()
local UI = Library:SetupUI('Discord Tools')

-- UI Hotkey
UI:SetHotkey('g')

-- Tabs
local WebhookRaiderTab = UI:CreateTab('Webhook Raider')
local ServerInfoTab = UI:CreateTab('Server Info')
local UserInfoTab = UI:CreateTab('User Info')

-- Variables
local WebhookURL = ''

-- Webhook Raider Tab
WebhookRaiderTab:CreateBox(
	'Webhook URL',
	function (Value)
		WebhookURL = Value
	end
)
