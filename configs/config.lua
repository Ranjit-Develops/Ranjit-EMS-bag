Config = {}


-- EMS Bag

Config.Bag = {
	Job = "ambulance",
	Money = 10, --Amount to deduct;set to False to disable ; disable means not even 0 will be deducted 

}
Config.Stash = {
	MaxWeighStash = 50000,
	MaxSlotsStash = 50,
}

Config.Scenario = "CODE_HUMAN_MEDIC_TEND_TO_DEAD"

Config.Items = {
    radio = { name = "radio", label = "Radio" },
    bandage = { name = "bandage", label = "Bandage" },
    painkillers = { name = "painkillers", label = "Painkillers" },
    firstaid = { name = "firstaid", label = "Firstaid" },
    weapon_flashlight = { name = "weapon_flashlight", label = "Flashlight" }
}