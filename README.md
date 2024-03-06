# ConikkUtills
My own personal LuaU utility module I use in almost all of my games, It's very bare bones atm and I plan to add on to it overtime


[![Roblox](https://conikku.neocities.org/github%20assets/POWERED%20by%20roblox.png)](https://www.roblox.com)

[![Version](https://conikku.neocities.org/github%20assets/ver%20ConikkUtills.svg)](https://www.conikku.com)

# Installation
You can get the Module [here](https://www.roblox.com/library/16646427669/)

## Examples of requiring it

```lua
    local ConikkUtills = require(game:GetService("ReplicatedStorage").ConikkUtills)
```

```lua
    local ConikkUtills = require(16646427669)
```

# Documentation
## TurnPositive(n : number)
Returns a negative number as positive

```lua
print(ConikkUtills:TurnPositive(-8)) --> 8
print(ConikkUtills:TurnPositive(27)) --> 27
```

## NumbersMagnitude(N1 : number, N2 : number)
Returns the magnitude length of two numbers

```lua
print(ConikkUtills:NumbersMagnitude(1, 80)) --> 79
print(ConikkUtills:NumbersMagnitude(34, 130)) --> 96
print(ConikkUtills:NumbersMagnitude(-17, 421)) --> 438
```

## RoundToNearestInteger(n : number)
Round a decimal to the nearest integer

```lua
print(ConikkUtills:RoundToNearestInteger(0.365)) --> 0
print(ConikkUtills:RoundToNearestInteger(0.683)) --> 1
print(ConikkUtills:RoundToNearestInteger(0.975)) --> 1
```

## RoundToFarthestInteger(n : number)
Round a decimal to the farthest integer

```lua
print(ConikkUtills:RoundToFarthestInteger(0.365)) --> -0
print(ConikkUtills:RoundToFarthestInteger(0.683)) --> 1
print(ConikkUtills:RoundToFarthestInteger(0.975)) --> 1
```

## StudioOnlyPrint(string : string)
Prints in Studio only

```lua
local Num = math.random(1, 2)

if num == 1 then
    print("I print in both RobloxPlayer and Roblox Studio :)")
else
   ConikkUtills:StudioOnlyPrint("I only print in Studio >:)")
end
```

## StudioOnlyWarn(string : string)
Warns in Studio only

```lua
local Num = math.random(1, 2)

if num == 1 then
    warn("I warn in both RobloxPlayer and Roblox Studio :D")
else
    ConikkUtills:StudioOnlyWarn("I only warn in Studio >:D")
end
```

## StudioOnlyError(string : string, level : number?)
Errors in Studio only

```lua
local Num = math.random(1, 2)

if num == 1 then
    error("I error in both RobloxPlayer and Roblox Studio :3", 1)
else
    ConikkUtills:StudioOnlyError("I only error in Studio >:3")
end
```

## GetPlayerThumbnail(Player, Enum.ThumbnailType, Enum.ThumbnailSize)
Get a Player's Thumbnail

```lua
local Player = game:GetService("Players").LocalPlayer
local Decal = workspace.Part.Decal

Decal.Texture = ConikkUtills:GetPlayerThumbnail(Player, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
```

# Development
##### Want to contribute? Send a pull request if there are any bugs!

# License
MIT
