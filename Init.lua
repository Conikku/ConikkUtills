--[[
	My (Conikku's) personal library I use for most of my games.
  	Open sourced on Roblox and GitHub
	
	For Documentation:
  	https://github.com/Conikku/ConikkUtills
	
	Last Updated: 03/16/2024
]]

local Players = game:GetService("Players")
local CAS = game:GetService("ContextActionService")
local RunService = game:GetService("RunService")
local IsServer = RunService:IsServer()
local IsStudio = RunService:IsStudio()

-- My own Modules
local AnyKey
local Fade

-- Third Party Open Source Modules
local LightingProfile = require(script:WaitForChild("LightingProfileAPI", 10))
local ContextActionUtility
local DeviceMaid

if IsServer == false then
	AnyKey = require(script:WaitForChild("AnyKey", 10))
	Fade = require(script:WaitForChild("FadeScreen", 10))
	
	DeviceMaid = require(script:WaitForChild("DeviceMaid", 10))
	ContextActionUtility = require(script:WaitForChild("ContextActionUtility", 10))	
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
ConikkUtills.Round = { }
ConikkUtills.StudioOnly = { }
ConikkUtills.Input = { }
ConikkUtills.LightingProfile = { }
ConikkUtills.ScreenEffects = { }

function ConikkUtills:GetPlayerThumbnail(player : Player, ThumbnailType : Enum.ThumbnailType, ThumbnailSize : Enum.ThumbnailSize)
	local userId = player.UserId
	local thumbType = ThumbnailType
	local thumbSize = ThumbnailSize
	local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

	return content
end

function ConikkUtills:TurnPositive(n : number)
	return math.abs(n)
end

function ConikkUtills:NumbersMagnitude(N1 : number, N2 : number)
	return math.abs(N1 - N2)
end

function ConikkUtills.Round:ToNearestInteger(n : number)
	return math.floor(n + 0.5)
end

function ConikkUtills.Round:ToFarthestInteger(n : number)
	return math.ceil(n - 0.5)
end

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

function ConikkUtills.ScreenEffects:Fade()
	ClientOnlyCheck() return Fade
end

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

function ConikkUtills.ContextActionUtility:BindAction(actionName : string, functionToBind : any , createTouchButton : boolean, ...)
	ClientOnlyCheck() ContextActionUtility.BindAction(actionName, functionToBind, createTouchButton, ...)
end

function ConikkUtills.ContextActionUtility:UnbindAction(actionName : string)
	ClientOnlyCheck() ContextActionUtility:UnbindAction(actionName)
end

function ConikkUtills.ContextActionUtility:BindActionAtPriority(actionName : string, functionToBind : any , createTouchButton : boolean, priorityLevel : any, ...)
	ClientOnlyCheck() ContextActionUtility:BindActionAtPriority(actionName, functionToBind, createTouchButton, priorityLevel, ...)
end

function ConikkUtills.ContextActionUtility:DisableAction(actionName : string, effectList)
	ClientOnlyCheck() ContextActionUtility:DisableAction(actionName, effectList)
end

function ConikkUtills.ContextActionUtility:SetImage(actionName : string, image : string)
	ClientOnlyCheck() ContextActionUtility.SetImage(actionName, image)
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

function ConikkUtills.LightingProfile:ApplyProfile(Configuration : Configuration | LightingProfile.ProfileData)
	LightingProfile:ApplyProfile(Configuration)
end

function ConikkUtills.LightingProfile:CreateProfileInstanceFromCurrentLighting()
	return LightingProfile:CreateProfileInstanceFromCurrentLighting()
end

return ConikkUtills
