# Ranjit-EmsBag script for QB-Core

| If you are interested in joining my community: https://discord.gg/TdDRdWpeJz
| For Question join the Discord or add me ranjit_07

| Preview:- https://youtube.com/watch?v=ZWsk1eNjMPE&si=EnSIkaIECMiOmarE|
# Information
* A Script That Would Allow Ems To carry a Their Job Bag
* Now you can set money in config to be deducted in cash if bag opened ( can be false or any number)

# Required
Add this to **qb-core/shared/items.lua**
```
	["emsbag"]   	= {["name"] = "emsbag", 		["label"] = "emsbag", 	["weight"] = 150, 		["type"] = "item", 		["image"] = "emsbag.png", 			["unique"] = false,   	["useable"] = true,    ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},

```
Add the image from the images/emsbag.png to your **qb-inventory/html/images/** folder
