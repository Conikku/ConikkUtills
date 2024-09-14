-- || Services
local RunService = game:GetService("RunService");
local UserInputService = game:GetService("UserInputService")

-- || Variables
local maid = {};

function maid:getEnabled()
	return {
		Keyboard = UserInputService.KeyboardEnabled,
		Gamepad = UserInputService.GamepadEnabled,
		Touch = UserInputService.TouchEnabled,
	}
end

function maid:getPlatformApproximate()
	local result = maid:getEnabled();
	
	local isMobile = result.Touch and (not result.Gamepad) and (not result.Keyboard)
	local isConsole = result.Gamepad and (not result.Touch) and (not result.Keyboard)
	local isPC = result.Keyboard and (not result.Touch) and (not result.Gamepad)
	
	return if isMobile then
		"Mobile"
		elseif isPC then
		"PC"
		elseif isConsole then
		"Console"
		else
		"Compound"
end

function maid:isController()
	return UserInputService.GamepadEnabled
end

function maid:isVR()
	return UserInputService.VREnabled
end

return maid
