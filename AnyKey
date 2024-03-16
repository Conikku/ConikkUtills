--[[
	Made by Conikku
	Last Updated: 03/16/2024
]]

local Excluded = {
	KeyCodes = {
		[1] = Enum.KeyCode.Escape,
		[2] = Enum.KeyCode.Pause,
		[3] = Enum.KeyCode.Thumbstick1,
		[4] = Enum.KeyCode.Thumbstick2,
	},

	UIT = {
		[1] = Enum.UserInputType.MouseMovement,
		[2] = Enum.UserInputType.Gyro,
		[3] = Enum.UserInputType.Accelerometer,
	}
}

local AnyKey = {}

AnyKey.EventObj = Instance.new("BindableEvent")
AnyKey.EventObj.Name = "AnyKeyEvent"

function AnyKey:Get()
	return self.EventObj.Event
end

local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(input, gameProccesed)
	local InputType, KeyCode = input.UserInputType, input.KeyCode

	local Key, UIT = Excluded.KeyCodes, Excluded.UIT

	if KeyCode == Key[1] or KeyCode == Key[2] or KeyCode == Key[3] or KeyCode == Key[4] then
		return
	end

	if InputType == UIT[1] or InputType == UIT[2] or InputType == UIT[3] then
		return
	end

	AnyKey.EventObj:Fire()
end)

return AnyKey
