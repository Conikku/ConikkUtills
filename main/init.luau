--[[
	My (Conikku's) personal library I use for most of my games.
  	Open sourced on Roblox and GitHub
	
	For Documentation:
  	https://github.com/Conikku/ConikkUtills
	
	Last Updated: 00/00/0000
]]

local Players = game:GetService("Players")
local CAS = game:GetService("ContextActionService")
local RunService = game:GetService("RunService")
local IsServer = RunService:IsServer()
local IsStudio = RunService:IsStudio()

local Directory = script.Parent.ConikkUtills --Change this path to wherever you put the modules inside "ConikkUtills" at.

-- My own Modules
local AnyKey
local Fade , FadeWipe

-- Third Party Open Source Modules
local LightingProfile = require(Directory.LightingProfileAPI)
local ContextActionUtility
local DeviceMaid

if IsServer == false then
	AnyKey = require(Directory.AnyKey)
	DeviceMaid = require(Directory.DeviceMaid)
	
	if IsStudio == false or (RunService:IsRunMode() == true) then --This breaks with command bars this is why it was added, could be deleted
		Fade = require(Directory.FadeScreen)
		FadeWipe = require(Directory.FadeWipeTransition)
		ContextActionUtility = require(Directory.ContextActionUtility)
	end
end

-----------------

-- Module Only Functions
function ClientOnlyCheck()
	if IsServer then warn("This function of ConikkUtills can only be called on the client") return end
end

function ServerOnlyCheck()
	if IsServer == false then warn("This function of ConikkUtills can only be called on the server") return end
end

-----------------

local ConikkUtills = { }
ConikkUtills.ContextActionUtility = { }
ConikkUtills.Number = { }
ConikkUtills.StudioOnly = { }
ConikkUtills.Input = { }
ConikkUtills.LightingProfile = { }
ConikkUtills.ScreenEffects = { }

-----------------

--== Other
function ConikkUtills:GetPlayerThumbnail(playerIdentifier : Player|number, thumbnailType : Enum.ThumbnailType, thumbnailSize : Enum.ThumbnailSize): (string?, boolean?)
	local userId = if type(playerIdentifier) == "number" then playerIdentifier else playerIdentifier.UserId
	local content, isReady = Players:GetUserThumbnailAsync(userId, ThumbnailType, ThumbnailSize)

	return content, isReady
end

--== Math
do
	function ConikkUtills.Number:TurnPositive(n : number): number
		return math.abs(n)
	end

	function ConikkUtills.Number:NumbersMagnitude(n1 : number, n2 : number): number
		return math.abs(n1 - n2)
	end

	function ConikkUtills.Number:CarryNumberToNewRange(n: number, oldRange: NumberRange|{Min: number, Max: number}, newRange: NumberRange|{Min: number, Max: number}): number
		local fromDelta = (oldRange.Max - oldRange.Min)  
		local toDelta = (newRange.Max - newRange.Min)
		return (((n - oldRange.Min) * toDelta) / fromDelta) + newRange.Min
	end
	
	--rounding
	function ConikkUtills.Number:RoundToNearestInteger(n : number): number
		return math.floor(n + 0.5)
	end

	function ConikkUtills.Number:RoundToFarthestInteger(n : number): number
		return math.ceil(n - 0.5)
	end
end

--== Studio only..
do
	function ConikkUtills.StudioOnly:Print(string : string)
		if IsStudio then
			print(string)
		end
	end

	function ConikkUtills.StudioOnly:Warn(string : string)
		if IsStudio then
			warn(string)
		end
	end

	function ConikkUtills.StudioOnly:Error(string : string, level : number?)
		if IsStudio then
			error(string, level)
		end
	end
end

--== Screen effects
do
	function ConikkUtills.ScreenEffects:Fade()
		ClientOnlyCheck() return Fade
	end

	function ConikkUtills.ScreenEffects:WipeFade()
		ClientOnlyCheck() return FadeWipe
	end
end

--== Input utility
do
	function ConikkUtills.Input:AnyKey()
		ClientOnlyCheck() return AnyKey:Get()
	end

	function ConikkUtills.Input:GetPlatform()
		ClientOnlyCheck() return DeviceMaid:getPlatform()
	end

	function ConikkUtills.Input:IsController()
		ClientOnlyCheck() return DeviceMaid:isController()
	end

	function ConikkUtills.Input:IsVR()
		ClientOnlyCheck() return DeviceMaid:isVR()
	end

	function ConikkUtills.Input:GetEnabled()
		ClientOnlyCheck() return DeviceMaid:getEnabled()
	end
end

--== Context Action Utility wrapper
do
	function ConikkUtills.ContextActionUtility:BindAction(actionName : string, functionToBind : ContextActionUtility._ContextActionServiceFunction , createTouchButton : boolean, ...: Enum.KeyCode)
		ClientOnlyCheck() ContextActionUtility:BindAction(actionName, functionToBind, createTouchButton, ...)
	end

	function ConikkUtills.ContextActionUtility:UnbindAction(actionName : string)
		ClientOnlyCheck() ContextActionUtility:UnbindAction(actionName)
	end

	function ConikkUtills.ContextActionUtility:BindActionAtPriority(actionName : string, functionToBind : ContextActionUtility._ContextActionServiceFunction, createTouchButton : boolean, priorityLevel : number, ...: Enum.KeyCode)
		ClientOnlyCheck() ContextActionUtility:BindActionAtPriority(actionName, functionToBind, createTouchButton, priorityLevel, ...)
	end

	function ConikkUtills.ContextActionUtility:DisableAction(actionName : string, effectList)
		ClientOnlyCheck() ContextActionUtility:DisableAction(actionName, effectList)
	end

	function ConikkUtills.ContextActionUtility:SetImage(actionName : string, image : string)
		ClientOnlyCheck() ContextActionUtility:SetImage(actionName, image)
	end

	function ConikkUtills.ContextActionUtility:SetTitle(actionName : string, title : string)
		ClientOnlyCheck() ContextActionUtility:SetTitle(actionName, title)
	end

	function ConikkUtills.ContextActionUtility:GetButton(actionName : string)
		ClientOnlyCheck() ContextActionUtility:GetButton(actionName)
	end

	function ConikkUtills.ContextActionUtility:MakeButtonRound(actionName : string, amount : number)
		ClientOnlyCheck() ContextActionUtility:MakeButtonRound(actionName, amount)
	end

	function ConikkUtills.ContextActionUtility:MakeButtonSquare(actionName : string)
		ClientOnlyCheck() ContextActionUtility:MakeButtonSquare(actionName)
	end

	function ConikkUtills.ContextActionUtility:SetPressedColor(actionName : string, color : Color3)
		ClientOnlyCheck() ContextActionUtility:SetPressedColor(actionName, color)
	end

	function ConikkUtills.ContextActionUtility:SetReleasedColor(actionName : string, color : Color3)
		ClientOnlyCheck() ContextActionUtility:SetReleasedColor(actionName, color)
	end

	function ConikkUtills.ContextActionUtility:LocalToolEquipped()
		ClientOnlyCheck() return ContextActionUtility.LocalToolEquipped
	end

	function ConikkUtills.ContextActionUtility:LocalToolUnequipped()
		ClientOnlyCheck() return ContextActionUtility.LocalToolUnequipped
	end
end

--== Lighting Profile
do
	function ConikkUtills.LightingProfile:ApplyProfile(configuration : Configuration | LightingProfile.ProfileData)
		LightingProfile:ApplyProfile(configuration)
	end

	function ConikkUtills.LightingProfile:CreateProfileInstanceFromCurrentLighting()
		return LightingProfile:CreateProfileInstanceFromCurrentLighting()
	end
end

return ConikkUtills
