--[[
	Made by Conikku
	Last Updated: 05/10/2024
]]

local FadeScreen = {}

local PlayerGui = game:GetService("Players").LocalPlayer.PlayerGui
local TweenService = game:GetService("TweenService")

FadeScreen.Fading = { }

function FadeScreen:Start(InSpeed : number | nil, OutSpeed : number | nil, DisplayOrder : number | nil, Color : Color3 | nil)
	task.spawn(function()
		
		DisplayOrder = DisplayOrder or 99999
		
		local FadeEffect = Instance.new("ScreenGui", PlayerGui)
		FadeEffect.Name = "Fade_Effect"
		FadeEffect.IgnoreGuiInset = true
		FadeEffect.DisplayOrder = DisplayOrder

		local Frame = Instance.new("Frame")
		Frame.Size = UDim2.new(1, 0, 1, 0)
		
		if Color == nil then
			Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)	
		else
			Frame.BackgroundColor3 = Color
		end
		
		Frame.BackgroundTransparency = 1
		Frame.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
		Frame.Name = "Fade"
		Frame.Parent = FadeEffect
		
		if InSpeed ~= nil then
			FadeScreen.Fading.In = TweenService:Create(Frame, TweenInfo.new(InSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {BackgroundTransparency = 0})
			FadeScreen.Fading.In:Play()
			FadeScreen.Fading.In.Completed:Wait()
		end
		
		if OutSpeed ~= nil then
			
			if InSpeed == nil then
				Frame.BackgroundTransparency = 0
			end
			
			FadeScreen.Fading.Out = TweenService:Create(Frame, TweenInfo.new(OutSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {BackgroundTransparency = 1})
			FadeScreen.Fading.Out:Play()
			FadeScreen.Fading.Out.Completed:Wait()
		end
		
		FadeEffect:Destroy()
	end)
	
	return self.Fading
end

return FadeScreen
