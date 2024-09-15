local GamepadInputsList = {
	[Enum.KeyCode.ButtonA] = true,
	[Enum.KeyCode.ButtonB] = true,
	[Enum.KeyCode.ButtonX] = true,
	[Enum.KeyCode.ButtonY] = true,

	[Enum.KeyCode.ButtonL1] = true,
	[Enum.KeyCode.ButtonL2] = true,
	[Enum.KeyCode.ButtonL3] = true,

	[Enum.KeyCode.ButtonR1] = true,
	[Enum.KeyCode.ButtonR2] = true,
	[Enum.KeyCode.ButtonR3] = true,

	[Enum.KeyCode.ButtonStart] = true,
	[Enum.KeyCode.ButtonSelect] = true,

	[Enum.KeyCode.DPadUp] = true,
	[Enum.KeyCode.DPadDown] = true,
	[Enum.KeyCode.DPadLeft] = true,
	[Enum.KeyCode.DPadRight] = true,
	
	[Enum.KeyCode.Thumbstick1] = true,
	[Enum.KeyCode.Thumbstick2] = true,
}

local XboxStringForKeycodes = {
	ButtonA = true, -- KeyCode.ButtonA
	ButtonB = true, -- KeyCode.ButtonB
	ButtonX = true, -- KeyCode.ButtonX
	ButtonY = true, -- KeyCode.ButtonY
	ButtonLB = true, -- KeyCode.ButtonL1
	ButtonLT = true, -- KeyCode.ButtonL2
	ButtonLS = true, -- KeyCode.ButtonL3
	ButtonRB = true, -- KeyCode.ButtonR1
	ButtonRT = true, -- KeyCode.ButtonR2
	ButtonRS = true, -- KeyCode.ButtonR3
	
	ButtonStart = true, -- KeyCode.ButtonStart
	ButtonSelect = true, -- KeyCode.ButtonSelect 
}

local PlaystationStringForKeycodes = {
	ButtonCross = true, -- KeyCode.ButtonA
	ButtonCircle = true, -- KeyCode.ButtonB
	ButtonSquare = true, -- KeyCode.ButtonX
	ButtonTriangle = true, -- KeyCode.ButtonY
	ButtonL1 = true, -- KeyCode.ButtonL1
	ButtonL2 = true, -- KeyCode.ButtonL2
	ButtonL3 = true, -- KeyCode.ButtonL3
	ButtonR1 = true, -- KeyCode.ButtonR1
	ButtonR2 = true, -- KeyCode.ButtonR2
	ButtonR3 = true, -- KeyCode.ButtonR3
	ButtonOptions = true, -- KeyCode.ButtonStart

	ButtonTouchpad = true, -- KeyCode.ButtonSelect 
	ButtonShare = true, -- KeyCode.ButtonSelect 
}

return {
	PlayStationStrings = PlaystationStringForKeycodes,
	XboxStrings = XboxStringForKeycodes,
	GamepadInput = GamepadInputsList,
}
