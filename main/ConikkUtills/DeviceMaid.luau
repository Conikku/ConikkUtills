local FindConsolePlatformImmediate = true --Set this to false if old behaviour is wanted → [[
	OLD BEHAVIOUR:
	Please note that if the user is either using PlayStation or Xbox controllers but has NOT yet inputted any inputs OR has not yet used
	the needed keys to approximate this will result in the function returning "Other" and not the appropriate platform name
]]

-- || Services
local RunService = game:GetService("RunService");
local UserInputService = game:GetService("UserInputService")

-- || Variables
local ObjectsDirectory = script.Parent.DeviceMaidObjects --make this path to wherever you put these objects into

local inputLookupInstance = ObjectsDirectory.InputLookupTable

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

do --console platform detection
	local currentInput = if UserInputService.GamepadEnabled then
		"Other"
		else
		"None"
	
	if FindConsolePlatformImmediate then
		if UserInputService.GamepadEnabled then
			local lookupTable = require(inputLookupInstance)
			local stringForKeyCode = UserInputService:GetStringForKeyCode(Enum.KeyCode.ButtonA)
			
			currentInput = if lookupTable.XboxStrings[stringForKeyCode] then ("Xbox")
				elseif lookupTable.PlayStationStrings[stringForKeyCode] then ("PlayStation")
				else ("Other")
		end
	end

	UserInputService.InputBegan:Connect(function(inputObj)
		if not UserInputService.GamepadEnabled then
			currentInput = "None"
			return
		end
		
		local lookupTable = require(inputLookupInstance)
		if not lookupTable.GamepadInput[inputObj.KeyCode] then return end
		
		local stringForKeyCode = UserInputService:GetStringForKeyCode(inputObj.KeyCode)
		
		if lookupTable.XboxStrings[stringForKeyCode] then
			currentInput = "Xbox"
		elseif lookupTable.PlayStationStrings[stringForKeyCode] then
			currentInput = "PlayStation"
		elseif currentInput == "None" then
			currentInput = "Other"
		end
	end)
	
	function maid:getConsolePlatform(): "nil"|"None"|"Other"|"Xbox"|"PlayStation"
		return currentInput
	end
end

function maid:isController()
	return UserInputService.GamepadEnabled
end

function maid:isVR()
	return UserInputService.VREnabled
end

return maid
