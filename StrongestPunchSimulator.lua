-- UI Setup
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/userofwind/LuxInc/master/LuxUILibrary.lua'))()
local UI = Library:SetupUI('Strongest Punch Simulator')

-- UI Hotkey
UI:SetHotkey('q')

-- Tabs
local BoostsTab = UI:CreateTab('Boosts Farm')

-- Services
local WorkspaceService = game:GetService('Workspace')
local PlayersService = game:GetService('Players')

-- Variables
local LocalPlayer = PlayersService.LocalPlayer
local LocalPlayerCharacter = LocalPlayer.Character
local AutoFarmingBoosts = false

-- Boosts Tab
BoostsTab:CreateButton(
    'Regular Farm',
    function ()
        local CurrentWorld = LocalPlayer['PlayerGui']:FindFirstChild('ScreenGui'):FindFirstChild('Menu_Frame'):FindFirstChild('MapTeleportation_Frame'):FindFirstChild('MapLvl_Txt').Text:split(' ')[2]
        
        for _, Child in ipairs(WorkspaceService['Map']['Stages']['Boosts'][CurrentWorld]:GetDescendants()) do
            if Child.ClassName == 'TouchTransmitter' then
                firetouchinterest(LocalPlayerCharacter.HumanoidRootPart, Child.Parent, 0)
                firetouchinterest(LocalPlayerCharacter.HumanoidRootPart, Child.Parent, 1)
            
                wait(0.2)
            end
        end
    end
)

