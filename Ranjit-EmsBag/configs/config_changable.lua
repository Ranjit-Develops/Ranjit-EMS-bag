local QBCore = exports['qb-core']:GetCoreObject()


-- Simple Event's , you can create yours and put on qb-menu :)

RegisterNetEvent('Ranjit-EmsBag:Client:GiveRadio')
AddEventHandler("Ranjit-EmsBag:Client:GiveRadio", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD")
    progressBar("Taking a Radio ...")
    TriggerServerEvent("Ranjit-EmsBag:Server:AddItem", "radio", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["radio"], "add", 1)
end)

RegisterNetEvent('Ranjit-EmsBag:Client:Givebandage')
AddEventHandler("Ranjit-EmsBag:Client:Givebandage", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD")
    progressBar("Taking Bandage ...")
    TriggerServerEvent("Ranjit-EmsBag:Server:AddItem", "bandage", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bandage"], "add", 1)
end)
RegisterNetEvent('Ranjit-EmsBag:Client:Givepainkillers')
AddEventHandler("Ranjit-EmsBag:Client:Givepainkillers", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD")
    progressBar("Taking Painkillers ...")
    TriggerServerEvent("Ranjit-EmsBag:Server:AddItem", "painkillers", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["painkillers"], "add", 1)
end)
RegisterNetEvent('Ranjit-EmsBag:Client:Givefirstaid')
AddEventHandler("Ranjit-EmsBag:Client:Givefirstaid", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD")
    progressBar("Taking Firstaid ...")
    TriggerServerEvent("Ranjit-EmsBag:Server:AddItem", "firstaid", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["firstaid"], "add", 1)
end)
RegisterNetEvent('Ranjit-EmsBag:Client:Giveweapon_flashlight')
AddEventHandler("Ranjit-EmsBag:Client:Giveweapon_flashlight", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD")
    progressBar("Taking Flashlight ...")
    TriggerServerEvent("Ranjit-EmsBag:Server:AddItem", "weapon_flashlight", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weapon_flashlight"], "add", 1)
end)


RegisterNetEvent('Ranjit-EmsBag:Client:MenuAmbulanceBag', function()
    local playerPed = PlayerPedId()
    if IsEntityDead(playerPed) then return Notify("You cannot Open Bag while dead", "error") end
    if IsPedSwimming(playerPed) then return Notify("You cannot Open Bag in the water.", "error") end
    if IsPedSittingInAnyVehicle(playerPed) then return Notify("You cannot Open Bag inside a vehicle", "error") end
    local job = QBCore.Functions.GetPlayerData().job.name
    if Config.Bag.NeedJob == true then
        if job ~= Config.Bag.Job then
            Notify("You dont have permissions to Open The Bag")
            return false
        end
    end
    exports['qb-menu']:openMenu({
        { header = "[🚑] Ambulance Box", txt = "", isMenuHeader = true },
        { header = "[👜] Open AmbulanceBag",  params = { event = "Ranjit-EmsBag:Client:StorageAmbulanceBag" } },
        { header = "[🩹]Take Bandage ",  params = { event = "Ranjit-EmsBag:Client:Givebandage" } },
        { header = "[💊] Take Painkillers ",  params = { event = "Ranjit-EmsBag:Client:Givepainkillers" } },
        { header = "[💉] Take Firstaid ",  params = { event = "Ranjit-EmsBag:Client:Givefirstaid" } },
        { header = "[🔦] Take FlashLight ",  params = { event = "Ranjit-EmsBag:Client:Giveweapon_flashlight" } },
        { header = "[📻] Take Radio",  params = { event = "Ranjit-EmsBag:Client:GiveRadio" } },
        -- You can add more menus with your's personal events...
        { header = "", txt = "❌ Close", params = { event = "qb-menu:closeMenu" } },
    })
end)

