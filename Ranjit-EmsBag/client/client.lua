local QBCore = exports['qb-core']:GetCoreObject()

local ObjectList = {}

RegisterNetEvent('Ranjit-EmsBag:Client:SpawnAmbulanceBag', function(objectId, type, player)
    local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(player)))
    local heading = GetEntityHeading(GetPlayerPed(GetPlayerFromServerId(player)))
    local forward = GetEntityForwardVector(PlayerPedId())
    local x, y, z = table.unpack(coords + forward * 0.5)
    local spawnedObj = CreateObject(Config.Bag.AmbulanceBag[type].model, x, y, z, true, false, false)
    PlaceObjectOnGroundProperly(spawnedObj)
    SetEntityHeading(spawnedObj, heading)
    FreezeEntityPosition(spawnedObj, Config.Bag.AmbulanceBag[type].freeze)
    ObjectList[objectId] = {
        id = objectId,
        object = spawnedObj,
        coords = vector3(x, y, z - 0.3),
    }
end)

RegisterNetEvent('Ranjit-EmsBag:Client:spawnLight', function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD")
    progressBar("Putting the Ems Bag...")
    Wait(2500)
    TriggerServerEvent("Ranjit-EmsBag:Server:SpawnAmbulanceBag", "emsbag")
end)

RegisterNetEvent('Ranjit-EmsBag:Client:GuardarAmbulanceBag')
AddEventHandler("Ranjit-EmsBag:Client:GuardarAmbulanceBag", function()
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), true))
    local playerPedPos = GetEntityCoords(PlayerPedId(), true)
    local AmbulanceBag = GetClosestObjectOfType(playerPedPos, 10.0, GetHashKey("prop_cs_shopping_bag"), false, false, false)
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD")
    progressBar("Taking Back the Ems Bag...")
    Wait(2500)
    Notify("Ems Bag Taken Back with success.")
    SetEntityAsMissionEntity(AmbulanceBag, 1, 1)
    DeleteObject(AmbulanceBag)
end)

local citizenid = nil
AddEventHandler("Ranjit-EmsBag:Client:StorageAmbulanceBag", function()
    local charinfo = QBCore.Functions.GetPlayerData().charinfo
    citizenid = QBCore.Functions.GetPlayerData().citizenid
    TriggerEvent("inventory:client:SetCurrentStash", "Ambulance Bag",citizenid)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Ambulance Bag",citizenid, {
        maxweight = 50000,
        slots = 52,
    })
end)

local AmbulanceBags = {
    `prop_cs_shopping_bag`,
}

exports['qb-target']:AddTargetModel(AmbulanceBags, {
    options = {{event   = "Ranjit-EmsBag:Client:MenuAmbulanceBag",icon    = "fa-solid fa-suitcase-medical",label   = "Ems Bag"},
    {event   = "Ranjit-EmsBag:Client:GuardarAmbulanceBag",icon    = "fa-solid fa-suitcase-medical",label   = "Take Back Ems Bag"},},distance = 2.0 })