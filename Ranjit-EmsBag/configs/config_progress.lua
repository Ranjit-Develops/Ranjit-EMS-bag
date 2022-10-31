local QBCore = exports['qb-core']:GetCoreObject()
-- Notifys
function Notify(msg)
    QBCore.Functions.Notify(msg)
end

-- Progressbars
function progressBar(msg)
    QBCore.Functions.Progressbar("ems bag", msg, 2500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()end)
end