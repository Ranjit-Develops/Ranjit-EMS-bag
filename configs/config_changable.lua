local QBCore = exports['qb-core']:GetCoreObject()

-- Function to handle the giving of items with progress bar
local function GiveItem(itemKey)
    local item = Config.Items[itemKey]
    if not item then return end

    local playerPed = PlayerPedId()
    -- Use the shared scenario from Config
    TaskStartScenarioInPlace(playerPed, Config.Scenario)
    progressBar("Taking " .. item.label .. " ...")
    TriggerServerEvent("Ranjit-EmsBag:Server:AddItem", item.name, 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[item.name], "add", 1)
end

-- Event Handlers
RegisterNetEvent('Ranjit-EmsBag:Client:GiveItem', function(itemKey)
    GiveItem(itemKey)
end)

-- Menu to open Ambulance Bag
RegisterNetEvent('Ranjit-EmsBag:Client:MenuAmbulanceBag', function()
    local playerPed = PlayerPedId()
    if IsEntityDead(playerPed) then
        return Notify("You cannot open the bag while dead", "error")
    end
    if IsPedSwimming(playerPed) then
        return Notify("You cannot open the bag in the water", "error")
    end
    if IsPedSittingInAnyVehicle(playerPed) then
        return Notify("You cannot open the bag inside a vehicle", "error")
    end

    -- Check if money deduction is enabled
    if Config.Bag.Money and Config.Bag.Money > 0 then
        local playerMoney = QBCore.Functions.GetPlayerData().money['cash']
        if playerMoney >= Config.Bag.Money then
            TriggerServerEvent('Ranjit-EmsBag:Server:DeductMoney', Config.Bag.Money)
        else
            return Notify("You do not have enough money to open the bag.", "error")
        end
    end

    -- Open menu
    local menuOptions = {}
    for key, item in pairs(Config.Items) do
        table.insert(menuOptions, {
            header = "[" .. item.label .. "] Take " .. item.label,
            params = { event = "Ranjit-EmsBag:Client:GiveItem", args = key }
        })
    end

    -- Add close option
    table.insert(menuOptions, { header = "", txt = "❌ Close", params = { event = "qb-menu:closeMenu" } })

    exports['qb-menu']:openMenu(menuOptions)
end)
