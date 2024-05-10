# ConikkUtills
My own personal LUAU utility module I use in almost all of my games, It's very bare bones atm and I plan to add on to it overtime.

[![Roblox](https://conikku.neocities.org/github%20assets/POWERED%20by%20roblox.png)](https://www.roblox.com)

[![Version](https://conikku.neocities.org/github%20assets/ver%20ConikkUtills.svg)](https://conikku.lao.ooo/)

### ⚠️**NOTICE**⚠️
### This module uses some open source modules on roblox from other creators of the community which will **NOT** have their code included on this github page, they will be in the module on the roblox site


# Installation
 You can get the Module [here](https://www.roblox.com/library/16646427669/)

## Requirement Example

```lua
local ConikkUtills = require(game:GetService("ReplicatedStorage").ConikkUtills)
```

# Documentation
## GetPlayerThumbnail(Player, Enum.ThumbnailType, Enum.ThumbnailSize) | Get a Player's Thumbnail

```lua
local Player = game:GetService("Players").LocalPlayer
local Decal = workspace.Part.Decal

Decal.Texture = ConikkUtills:GetPlayerThumbnail(Player, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
```

## TurnPositive(n : number) | Returns a negative number as positive

```lua
print(ConikkUtills:TurnPositive(-8)) --> 8
print(ConikkUtills:TurnPositive(27)) --> 27
```

## NumbersMagnitude(N1 : number, N2 : number) | Returns the magnitude length of two numbers

```lua
print(ConikkUtills:NumbersMagnitude(1, 80)) --> 79
print(ConikkUtills:NumbersMagnitude(34, 130)) --> 96
print(ConikkUtills:NumbersMagnitude(-17, 421)) --> 438
```

## Round:ToNearestInteger(n : number) | Round a decimal to the nearest integer

```lua
print(ConikkUtills.Round:ToNearestInteger(0.365)) --> 0
print(ConikkUtills.Round:ToNearestInteger(0.683)) --> 1
print(ConikkUtills.Round:ToNearestInteger(0.975)) --> 1
```

## Round:ToFarthestInteger(n : number) | Round a decimal to the farthest integer

```lua
print(ConikkUtills.Round:ToFarthestInteger(0.365)) --> -0
print(ConikkUtills.Round:ToFarthestInteger(0.683)) --> 1
print(ConikkUtills.Round:ToFarthestInteger(0.975)) --> 1
```

## StudioOnly:Print(string : string) | Prints in Studio only

```lua
local Num = math.random(1, 2)

if num == 1 then
    print("I print in both RobloxPlayer and Roblox Studio :)")
else
   ConikkUtills.StudioOnly:Print("I only print in Studio >:)")
end
```

## StudioOnly:Warn(string : string) | Warns in Studio only

```lua
local Num = math.random(1, 2)

if num == 1 then
    warn("I warn in both RobloxPlayer and Roblox Studio :D")
else
    ConikkUtills.StudioOnly:Warn("I only warn in Studio >:D")
end
```

## StudioOnly:Error(string : string, level : number?) | Errors in Studio only

```lua
local Num = math.random(1, 2)

if num == 1 then
    error("I error in both RobloxPlayer and Roblox Studio :3", 1)
else
    ConikkUtills.StudioOnly:Error("I only error in Studio >:3")
end
```
## ScreenEffects:Fade():Start:(InSpeed : number?, OutSpeed : number?, DisplayOrder : number?, Color : Color3?)
- If ```InSpeed``` is set to ```nil```, the fade in will **instantly** make the screen black, then fade out
- If ```OutSpeed``` is set to ```nil```, then it will **instantly** get rid of the fade once it **completes**
- If ```DisplayOrder``` is ```nil```, its set to **99999** by default
- If ```Color``` is ```nil```, its set to **Color3.FromRGB(0, 0, 0) [Color Black]** by default

## ScreenEffects:WipeFade():Start:(Speed : number?, DisplayOrder : number?, Color : Color3?)
- If ```Speed``` is set to ```nil```, by default it will be (0.65 x 2)
- If ```DisplayOrder``` is ```nil```, its set to **99999** by default
- If ```Color``` is ```nil```, its set to **Color3.FromRGB(0, 0, 0) [Color Black]** by default

#### If you call a fade like this:
```lua
local fade = ConikkUtills:ScreenEffects:Fade():Start(1, 1)
```
#### You can call RBXScriptSignals and/or read TweenBase read only properties from ```fade.In``` and/or ```fade.Out``` if InSpeed and/or OutSpeed are not nil
### Here's a example of what you can do with this

```lua
-- Method 1:
local fade = ConikkUtills.ScreenEffects:Fade():Start(0.5, 1)

fade.In.Completed:Wait()
print("Fade In Completed")
fade.Out.Completed:Wait()
print("Fade Out Completed")
```
```lua
-- Method 2:
local fade = ConikkUtills.ScreenEffects:Fade()

fade:Start(0.5, 1)

fade.Fading.In.Completed:Wait()
print("Fade In Completed")
fade.Fading.Out.Completed:Wait()
print("Fade Out Completed")
```
#
## Input:AnyKey() 
### RbxScriptConnect that can be used when any key is pressed, works on all devices and excludes non touch and keycode type inputs and keycodes resigned for roblox's escape menu, this includes:
- Escape Key
- Pause Key
- Thumbstick1
- Thumbstick2
- Mouse Movement
- Gyro
- Accelermeter

### Here's a script example to show what it can be used for, I usually use this for title screens
```lua
local AnyKey = ConikkUtills.Input:AnyKey

function Pressed()
    print("Pressed a key")
end

AnyKey:Wait()
print("Pressed a key for the first time")

AnyKey:Connect(Pressed)
```
#
## Input:GetPlatform() -> string 
### Tries to get aproximate platform, sadly can't tell if player is on PlayStation or Xbox, but will say they are a console user
```lua
local Platform = ConikkUtills.Input:GetPlatform()

if Platform == "Mobile" then
    print("User is on mobile")
else
    print("User is not mobile")
end
```
#
## Input:IsController() -> boolean 
### Checks if Gamepad is connected and enabled
```lua
local IsController = ConikkUtills.Input:IsController()

if IsController == true then
    print("Controller connected")
else
    print("No controller connected")
end
```
#
## Input:IsVR() -> boolean
### Checks if user is in VR
```lua
local IsVR = ConikkUtills.Input:IsVR()

if IsVR == true then
    print("User is in VR")
else
    print("User is not in VR")
end
```
#
## Input:GetEnabled() -> string
### Returns main UserInputType control that is Enabled, this includes:
- KeyboardEnabled : "Keyboard"
- GamepadEnabled : "Gamepad"
- TouchEnabled : "Touch"

## ContextActionUtility
#### For in depth documentation and other infomation vist this [devfourm post](https://devforum.roblox.com/t/easy-mobile-buttons-contextactionutility/804219)

### Functions
```lua
ConikkUtills.ContextActionUtility:BindAction(actionName : string, functionToBind : any , createTouchButton : boolean, ...)
```
```lua
ConikkUtills.ContextActionUtility:UnbindAction(actionName : string)
```
```lua
ConikkUtills.ContextActionUtility:BindActionAtPriority(actionName : string, functionToBind : any , createTouchButton : boolean, priorityLevel : any, ...)
```
```lua
ConikkUtills.ContextActionUtility:DisableAction(actionName : string, effectList)
```
```lua
ConikkUtills.ContextActionUtility:SetImage(actionName : string, image : string)
```
```lua
ConikkUtills.ContextActionUtility:SetTitle(actionName : string, title : string)
```
```lua
ConikkUtills.ContextActionUtility:GetButton(actionName : string)
```
```lua
ConikkUtills.ContextActionUtility:MakeButtonRound(actionName : string, amount : number)
```
```lua
ConikkUtills.ContextActionUtility:MakeButtonSquare(actionName : string)
```
```lua
ConikkUtills.ContextActionUtility:SetPressedColor(actionName : string, color : Color3)
```
```lua
ConikkUtills.ContextActionUtility:SetReleasedColor(actionName : string, color : Color3)
```

### Events
```lua
local Equipped = ConikkUtills.ContextActionUtility.LocalToolEquipped()
local Unequipped = ConikkUtills.ContextActionUtility.LocalToolUnequipped()
```

### Refrences:
```lua
Equipped:Connect()
Equipped:Wait()
Equipped:ConnectParallel()
Equipped:Once()
```
#
## LightingAPIProfile
- For in depth documentation and other infomation vist this [github repository](https://github.com/hexa0/lighting-profile)
- This was made by my friend Hexa and I integraded it into my system, it's really good for changing lighting in game very easily
### Functions
```lua
ConikkUtills.LightingProfile:ApplyProfile()
```
```lua
ConikkUtills.LightingProfile:CreateProfileInstanceFromCurrentLighting()
```
#
# Credits
- [ContextActionUtility](https://devforum.roblox.com/t/easy-mobile-buttons-contextactionutility/804219)
- [DeviceMaid](https://create.roblox.com/store/asset/7907463241/Device-Maid-Support-Module?externalSource=www)
- [LightingAPIProfile](https://github.com/hexa0/lighting-profile)
#
# Development
Want to contribute? Send a pull request if there are any bugs!

# License
MIT
