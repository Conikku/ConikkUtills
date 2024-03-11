--[[
	My (Conikku's) personal library I use for most of my games.
  	Open sourced on Roblox and GitHub
  
	Last Updated: 03/11/2024
]]

local Players = game:GetService("Players")
local CAS = game:GetService("ContextActionService")
local RunService = game:GetService("RunService")
local IsStudio = RunService:IsStudio()

-- Third Party Open Source Modules
local ContextActionUtility = require(script:WaitForChild("ContextActionUtility", 10))

-----------------
local ConikkUtills = { }
ConikkUtills.ContextActionUtility = { }
ConikkUtills.Round = { }
ConikkUtills.StudioOnly = { }

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

function ConikkUtills.ContextActionUtility:BindAction(actionName : string, functionToBind : any , createTouchButton : boolean, ...)
	ContextActionUtility.BindAction(actionName, functionToBind, createTouchButton, ...)
end

function ConikkUtills.ContextActionUtility:UnbindAction(actionName : string)
	ContextActionUtility:UnbindAction(actionName)
end

function ConikkUtills.ContextActionUtility:BindActionAtPriority(actionName : string, functionToBind : any , createTouchButton : boolean, priorityLevel : any, ...)
	ContextActionUtility:BindActionAtPriority(actionName, functionToBind, createTouchButton, priorityLevel, ...)
end

function ConikkUtills.ContextActionUtility:DisableAction(actionName : string, effectList)
	ContextActionUtility:DisableAction(actionName, effectList)
end

function ConikkUtills.ContextActionUtility:SetImage(actionName : string, image : string)
	ContextActionUtility.SetImage(actionName, image)
end

function ConikkUtills.ContextActionUtility:SetTitle(actionName : string, title : string)
	ContextActionUtility:SetTitle(actionName, title)
end

function ConikkUtills.ContextActionUtility:GetButton(actionName : string)
	ContextActionUtility:GetButton(actionName)
end

function ConikkUtills.ContextActionUtility:MakeButtonRound(actionName : string, amount : number)
	ContextActionUtility:MakeButtonRound(actionName, amount)
end

function ConikkUtills.ContextActionUtility:MakeButtonSquare(actionName : string)
	ContextActionUtility:MakeButtonSquare(actionName)
end

function ConikkUtills.ContextActionUtility:SetPressedColor(actionName : string, color : Color3)
	ContextActionUtility:SetPressedColor(actionName, color)
end

function ConikkUtills.ContextActionUtility:SetReleasedColor(actionName : string, color : Color3)
	ContextActionUtility:SetReleasedColor(actionName, color)
end

function ConikkUtills.ContextActionUtility.LocalToolEquipped()
	return ContextActionUtility.LocalToolEquipped
end

function ConikkUtills.ContextActionUtility.LocalToolUnequipped()
	return ContextActionUtility.LocalToolUnequipped
end

return ConikkUtills
