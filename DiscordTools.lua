--[=[
	Collaborators: userofwind
	loadstring(game:HttpGet('https://raw.githubusercontent.com/LuXSystematic/RobloxScripts/master/DiscordTools.lua'))()
]=]

-- UI Setup
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/LuXSystematic/RobloxScripts/main/UILibrary.lua'))()
local UI = Library:SetupUI('Discord Tools')

-- UI Hotkey
UI:SetHotkey('g')

-- Tabs
local WebhookRaiderTab = UI:CreateTab('Webhook Raider')

-- Services
local HttpService = game:GetService('HttpService')

-- Variables
local MsgsToSend = 0
local Request = {
	Url = '',
	Method = '',
	Body = {},
	Headers = { ['Content-Type'] =  'application/json' }
}	

-- Webhook Raider Tab
WebhookRaiderTab:CreateBox(
	'Webhook URL',
	function (Value)
		Request.Url = Value
		getgenv().webhook = Value
	end
)

WebhookRaiderTab:CreateBox(
	'Msg Content',
	function (Value)
		Request.Body = HttpService:JSONEncode { content = Value }
	end
)

WebhookRaiderTab:CreateSlider(
	'Msg Amount',
	0,
	100,
	function (Value)
		MsgAmount = Value
	end
)

WebhookRaiderTab:CreateButton("Delte - Webhook", function()
    syn.request({
        Url = getgenv().webhook,
        Method = "DELETE"
    })
end)


WebhookRaiderTab:CreateButton(
	'Send Raid',
	function ()
	    Request.Method = 'POST'
	    
		local RequestSucceeded, ResultFromRequest = pcall(function ()
			for i = 0, MsgAmount do
				syn.request(Request)
			end
		end)
		
		if not RequestSucceeded then
		    UI:Notify('The raid failed!\n\n' .. ResultFromRequest, 7)
		end
		
		Request = {
	        Url = '',
	        Method = 'POST',
            Body = {},
	        Headers = { ['Content-Type'] =  'application/json' }
        }	
	end
)
