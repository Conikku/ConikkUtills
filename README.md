# ConikkUtills
My own personal LUAU utility module I use in almost all of my games, It's very bare bones atm and I plan to add on to it overtime.

[![Roblox](https://conikku.neocities.org/github%20assets/POWERED%20by%20roblox.png)](https://www.roblox.com)

[![Version](https://conikku.neocities.org/github%20assets/ver%20ConikkUtills.svg)](https://conikku.lao.ooo/)

### ⚠️**NOTICE**⚠️
### This module uses some open source modules on roblox from other creators of the community which will **NOT** have their code included on this github page, they will be in the module on the roblox site

### If you are requiring this script on the server, make sure to modify the ContextActionUtility Module to have ```if game:GetService("RunService"):IsServer then return end ``` anywhere before line 123 (where it's getting the local player) as you cant get the local player on the server


# Installation
 You can get the Module [here](https://www.roblox.com/library/16646427669/)

## Requirement Examples

```lua
local ConikkUtills = require(game:GetService("ReplicatedStorage").ConikkUtills)
```

```lua
local ConikkUtills = require(16646427669)
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

# ContextActionUtility
### For in depth documentation and other infomation vist this [devfourm post](https://devforum.roblox.com/t/easy-mobile-buttons-contextactionutility/804219)

## Functions
```lua
ConikkUtills.ContextActionUtility:BindAction(actionName : string, functionToBind : any , createTouchButton : boolean, ...)

ConikkUtills.ContextActionUtility:UnbindAction(actionName : string)

ConikkUtills.ContextActionUtility:BindActionAtPriority(actionName : string, functionToBind : any , createTouchButton : boolean, priorityLevel : any, ...)

ConikkUtills.ContextActionUtility:DisableAction(actionName : string, effectList)

ConikkUtills.ContextActionUtility:SetImage(actionName : string, image : string)

ConikkUtills.ContextActionUtility:SetTitle(actionName : string, title : string)

ConikkUtills.ContextActionUtility:GetButton(actionName : string)

ConikkUtills.ContextActionUtility:MakeButtonRound(actionName : string, amount : number)

ConikkUtills.ContextActionUtility:MakeButtonSquare(actionName : string)

ConikkUtills.ContextActionUtility:SetPressedColor(actionName : string, color : Color3)

ConikkUtills.ContextActionUtility:SetReleasedColor(actionName : string, color : Color3)
```

## Events
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
# Development
Want to contribute? Send a pull request if there are any bugs!

# License
MIT
