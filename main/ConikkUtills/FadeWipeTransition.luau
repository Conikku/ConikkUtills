--[[
	Made by Conikku
	Last Updated: 05/10/2024
]]

local FadeTransition = {}

local ObjectsDirectory = script.Parent.FadeObjects --make this path to wherever you put these objects into

local PlayerGui = game:GetService("Players").LocalPlayer.PlayerGui
local TweenService = game:GetService("TweenService")

local FadeEffectOriginal = ObjectsDirectory.Fade

FadeTransition.Fading = { }

function FadeTransition:Start(Speed : number | nil, DisplayOrder : number | nil, Color : Color3 | nil)
	task.spawn(function()
		if Speed == nil then
			Speed = 0.65
		end

		if DisplayOrder == nil then
			DisplayOrder = 99999999
		end

		local FadeEffect = FadeEffectOriginal:Clone()
		FadeEffect.DisplayOrder = DisplayOrder
		FadeEffect.Parent = PlayerGui
		
		if Color == nil then
			FadeEffect.Fade.GroupColor3 = Color3.fromRGB(0, 0, 0)
		else
			FadeEffect.Fade.GroupColor3 = Color
		end
		
		local Grad = FadeEffect:WaitForChild("Fade"):WaitForChild("UIGradient")

		FadeTransition.Fading.In = TweenService:Create(Grad, TweenInfo.new(Speed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Offset = Vector2.new(1,0)})
		FadeTransition.Fading.In:Play()

		FadeTransition.Fading.Out = TweenService:Create(Grad, TweenInfo.new(Speed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Offset = Vector2.new(-1,0)})

		FadeTransition.Fading.In.Completed:Wait()

		FadeEffect.Fade.Rotation = 180

		FadeTransition.Fading.Out:Play()
		FadeTransition.Fading.Out.Completed:Wait()		

		FadeEffect:Destroy()
	end)

	return self.Fading
end

return FadeTransition
