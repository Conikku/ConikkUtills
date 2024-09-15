# ConikkUtills
My own personal LUAU utility module I use in almost all of my games, It's very bare bones atm and I plan to add on to it overtime.

[![Roblox](https://conikku.neocities.org/github%20assets/POWERED%20by%20roblox.png)](https://www.roblox.com)

[![Version](https://conikku.neocities.org/github%20assets/ver%20ConikkUtills.svg)](https://conikku.lao.ooo/)

### ⚠️**NOTICE**⚠️
### This module uses some open source modules on roblox from other creators of the community which will **NOT** have their code included on this github page, they will be in the module on the roblox site


# Installation
 You can get the Module [here](https://www.roblox.com/library/16646427669/)

## Requirement Example

```luau
local ConikkUtills = require(game:GetService("ReplicatedStorage").ConikkUtills)
```

# Documentation
---

## GetPlayerThumbnail(Player, Enum.ThumbnailType, Enum.ThumbnailSize)<br><br> → contentID: string, isUsable: boolean
### Get a Player's Thumbnail

```luau
local Player = game:GetService("Players").LocalPlayer
local Decal = workspace.Part.Decal

Decal.Texture = ConikkUtills:GetPlayerThumbnail(Player, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
```

---
# Number
---

## Number:TurnPositive(number)<br><br> → number
### Returns a negative number as positive

```luau
print(ConikkUtills.Number:TurnPositive(-8)) --> 8
print(ConikkUtills.Number:TurnPositive(27)) --> 27
```

## Number:NumbersMagnitude(number, number)<br><br> → number
### Returns the magnitude length of two numbers

```luau
print(ConikkUtills.Number:NumbersMagnitude(1, 80)) --> 79
print(ConikkUtills.Number:NumbersMagnitude(34, 130)) --> 96
print(ConikkUtills.Number:NumbersMagnitude(-17, 421)) --> 438
```

## Number:CarryNumberToNewRange(number, oldRange: NumberRange, newRange: NumberRange)<br><br> → number
### Carry a numbers percentage withing a range to a new range 
#### NOTE: "oldRange" and "newRange" can be tables of ` {Min: number, Max: number} `

```luau
local oldRange = NumberRange.new(0, 10)
local newRange = {Min = 0, Max = 50} --Both can be a NumberRange and a table

local number1 = 5
local number2 = 8
local number3 = 1

print(
    ConikkUtills.Number:CarryNumberToNewRange(number1, oldRange, newRange), --> 25
    ConikkUtills.Number:CarryNumberToNewRange(number2, oldRange, newRange), --> 40
    ConikkUtills.Number:CarryNumberToNewRange(number3, oldRange, newRange)  --> 5
)
```

## Number:RoundToNearestInteger(number)<br><br> → number
### Round a decimal to the nearest integer

```luau
print(ConikkUtills.Number:RoundToNearestInteger(0.365)) --> 0
print(ConikkUtills.Number:RoundToNearestInteger(0.683)) --> 1
print(ConikkUtills.Number:RoundToNearestInteger(0.975)) --> 1
```

## Number:RoundToFarthestInteger(n : number)<br><br> → number
### Round a decimal to the farthest integer

```luau
print(ConikkUtills.Number:RoundToFarthestInteger(0.365)) --> -0
print(ConikkUtills.Number:RoundToFarthestInteger(0.683)) --> 1
print(ConikkUtills.Number:RoundToFarthestInteger(0.975)) --> 1
```

---
# StudioOnly
---

## StudioOnly:Print(string)
### Prints in Studio only

```luau
local Num = math.random(1, 2)

if num == 1 then
    print("I print in both RobloxPlayer and Roblox Studio :)")
else
   ConikkUtills.StudioOnly:Print("I only print in Studio >:)")
end
```

## StudioOnly:Warn(string)
### Warns in Studio only

```luau
local Num = math.random(1, 2)

if num == 1 then
    warn("I warn in both RobloxPlayer and Roblox Studio :D")
else
    ConikkUtills.StudioOnly:Warn("I only warn in Studio >:D")
end
```

## StudioOnly:Error(string, level: number?)
### Errors in Studio only

```luau
local Num = math.random(1, 2)

if num == 1 then
    error("I error in both RobloxPlayer and Roblox Studio :3", 1)
else
    ConikkUtills.StudioOnly:Error("I only error in Studio >:3")
end
```

---
# ScreenEffects
---
## ScreenEffects:Fade() || ScreenEffects:WipeFade()<br><br> → FadeScreen || FadeWipeTransition
### Returns the "FadeScreen" or "FadeWipeTransition" module
```luau
FadeScreen || FadeWipeTransition = {
    Start : function,
    Fading : {
        In : Tween?,
        Out : Tween?
    }
}
```

## FadeScreen:Start(InSpeed : number?, OutSpeed : number?, DisplayOrder : number?, Color : Color3?) <br><br> → {In: Tween, Out: Tween}
- If ```InSpeed``` is set to ```nil```, the fade in will **instantly** make the screen black, then fade out
- If ```OutSpeed``` is set to ```nil```, then it will **instantly** get rid of the fade once it **completes**
- If ```DisplayOrder``` is ```nil```, its set to **99999** by default
- If ```Color``` is ```nil```, its set to **Color3.FromRGB(0, 0, 0) [Color Black]** by default

## FadeWipeTransition:Start(Speed : number?, DisplayOrder : number?, Color : Color3?) <br><br> → {In: Tween, Out: Tween}
- If ```Speed``` is set to ```nil```, by default it will be (0.65 x 2)
- If ```DisplayOrder``` is ```nil```, its set to **99999** by default
- If ```Color``` is ```nil```, its set to **Color3.FromRGB(0, 0, 0) [Color Black]** by default

#### If you call a fade like this:
```luau
local fade = ConikkUtills:ScreenEffects:Fade():Start(1, 1)
```
#### You can call RBXScriptSignals and/or read TweenBase read only properties from ```fade.In``` and/or ```fade.Out``` if InSpeed and/or OutSpeed are not nil
### Here's a example of what you can do with this

```luau
-- Method 1:
local fade = ConikkUtills.ScreenEffects:Fade():Start(0.5, 1)

fade.In.Completed:Wait()
print("Fade In Completed")
fade.Out.Completed:Wait()
print("Fade Out Completed")
```
```luau
-- Method 2:
local fade = ConikkUtills.ScreenEffects:Fade()

fade:Start(0.5, 1)

fade.Fading.In.Completed:Wait()
print("Fade In Completed")
fade.Fading.Out.Completed:Wait()
print("Fade Out Completed")
```

---
# Input
---

## Input:AnyKey() <br><br> → RBXScriptSignal

### Returns a signal that can be used when any key is pressed, works on all devices and excludes non touch and keycode type inputs and keycodes resigned for roblox's escape menu, this includes:
- Escape Key
- Pause Key
- Thumbstick1
- Thumbstick2
- Mouse Movement
- Gyro
- Accelermeter

### Here's a script example to show what it can be used for, I usually use this for title screens
```luau
local AnyKey = ConikkUtills.Input:AnyKey

function Pressed()
    print("Pressed a key")
end

AnyKey:Wait()
print("Pressed a key for the first time")

AnyKey:Connect(Pressed)
```

## Input:GetPlatformApproximate()<br><br> → "Mobile" | "Console" | "PC" | "Compound" 
### Tries to get the approximate platform, can't tell if player is on PlayStation or Xbox, but will say they are a console user.<br> If the user has multiple types of controls enabled, then it will return "Compound". For example, if the user has a phone with a keyboard/gamepad plugged into it, it will return "Compound".
```luau
local Platform = ConikkUtills.Input:GetPlatformApproximate()

if Platform == "Mobile" then
    print("User is on mobile")
else
    print("User is not mobile")
end
```

## Input:GetConsolePlatformApproximate()<br><br> → "None" | "Other" | "PlayStation" | "Xbox"
### Tries* to get the current console platform being used.<br><br> *Please note that if the user is either using PlayStation or Xbox controllers but has NOT yet inputted any inputs OR has not yet used the needed keys to approximate this will result in the function returning "Other" and not the appropriate platform name
```luau
local Platform = ConikkUtills.Input:GetConsolePlatform()

if Platform == "PlayStation" then
    print("Is using PlayStation controller")
elseif Platform == "Xbox" then
    print("Is using Xbox controller")
end
```

### Here are the keys needed to be pressed in order to do proper platform detection, you could use these in a startup menu of sorts and ask the player to input one of these buttons to quickly declare their console platform.
```luau
NeededInputs = {
    Enum.KeyCode.ButtonA,
    Enum.KeyCode.ButtonB,
    Enum.KeyCode.ButtonX,
    Enum.KeyCode.ButtonY,

    Enum.KeyCode.ButtonL1,
    Enum.KeyCode.ButtonL2,
    Enum.KeyCode.ButtonL3,

    Enum.KeyCode.ButtonR1,
    Enum.KeyCode.ButtonR2,
    Enum.KeyCode.ButtonR3,

    Enum.KeyCode.ButtonStart,
    Enum.KeyCode.ButtonSelect,
}
```

## Input:IsController()<br><br> → boolean 
### Checks if Gamepad is connected and enabled
```luau
local IsController = ConikkUtills.Input:IsController()

if IsController == true then
    print("Controller connected")
else
    print("No controller connected")
end
```

## Input:IsVR()<br><br> → boolean
### Checks if user is in VR
```luau
local IsVR = ConikkUtills.Input:IsVR()

if IsVR == true then
    print("User is in VR")
else
    print("User is not in VR")
end
```
#
## Input:GetEnabled()<br><br> → infoTable
### Returns a table that contains information on what types of controls are being used
```luau
infoTable = {
    Gamepad: boolean, --if true, a gamepad is connected to the device the user is using. this goes for the rest of the elements in the table
    Touch: boolean,
    Keyboard: boolean
}
```

---
# ContextActionUtility
---

#### For in depth documentation and other infomation vist this [devfourm post](https://devforum.roblox.com/t/easy-mobile-buttons-contextactionutility/804219)

### Functions
```luau
ConikkUtills.ContextActionUtility:BindAction(actionName : string, functionToBind : any , createTouchButton : boolean, ...)
```
```luau
ConikkUtills.ContextActionUtility:UnbindAction(actionName : string)
```
```luau
ConikkUtills.ContextActionUtility:BindActionAtPriority(actionName : string, functionToBind : any , createTouchButton : boolean, priorityLevel : any, ...)
```
```luau
ConikkUtills.ContextActionUtility:DisableAction(actionName : string, effectList)
```
```luau
ConikkUtills.ContextActionUtility:SetImage(actionName : string, image : string)
```
```luau
ConikkUtills.ContextActionUtility:SetTitle(actionName : string, title : string)
```
```luau
ConikkUtills.ContextActionUtility:GetButton(actionName : string)
```
```luau
ConikkUtills.ContextActionUtility:MakeButtonRound(actionName : string, amount : number)
```
```luau
ConikkUtills.ContextActionUtility:MakeButtonSquare(actionName : string)
```
```luau
ConikkUtills.ContextActionUtility:SetPressedColor(actionName : string, color : Color3)
```
```luau
ConikkUtills.ContextActionUtility:SetReleasedColor(actionName : string, color : Color3)
```

### Events
```luau
local Equipped = ConikkUtills.ContextActionUtility.LocalToolEquipped()
local Unequipped = ConikkUtills.ContextActionUtility.LocalToolUnequipped()
```

### References:
```luau
Equipped:Connect()
Equipped:Wait()
Equipped:ConnectParallel()
Equipped:Once()
```

---
# LightingAPIProfile
---

- For in depth documentation and other infomation vist this [github repository](https://github.com/hexa0/lighting-profile)
- This was made by my friend Hexa and I integraded it into my system, it's really good for changing lighting in game very easily
### Functions
```luau
ConikkUtills.LightingProfile:ApplyProfile(Configuration | LightingProfileData)
```
```luau
ConikkUtills.LightingProfile:CreateProfileInstanceFromCurrentLighting() -> Configuration
```

---

# Credits
- [ContextActionUtility](https://devforum.roblox.com/t/easy-mobile-buttons-contextactionutility/804219)
- [DeviceMaid](https://create.roblox.com/store/asset/7907463241/Device-Maid-Support-Module?externalSource=www)
- [LightingAPIProfile](https://github.com/hexa0/lighting-profile)
#
# Development
Want to contribute? Send a pull request if there are any bugs!

# License
MIT
