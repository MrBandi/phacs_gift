ESX = exports["es_extended"]:getSharedObject()
local give_gift = false

RegisterCommand('mafgift', function()
    if give_gift == false then
        give_gift = true
        ESX.ShowNotification("等待~b~3秒後領取")
        Wait(3000)
        ESX.TriggerServerCallback('phacs_gift:giveitem', function(cb)
            if cb == "give_ok" then
                PlaySoundFrontend(-1, "RACE_PLACED", "HUD_AWARDS")
                ESX.Scaleform.ShowFreemodeMessage("~y~中秋節連假獎勵", "~p~恭喜領取成功，祝您中秋節快樂", 5)
            elseif cb == "no_give" then
                ESX.ShowNotification("您已領取過了")
            end
            give_gift = false
        end)
    end
end)