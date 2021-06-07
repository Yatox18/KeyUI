RegisterCommand('touche', function()
  Citizen.CreateThread(function()
    local display = true
    local startTime = GetGameTimer()
    local delay = 120000

    TriggerEvent('touche:display', true)

    while display do
      Citizen.Wait(1)
      ShowInfo('Appuyez sur ~INPUT_CONTEXT~ pour fermer le menu.', 0)
      if (GetTimeDifference(GetGameTimer(), startTime) > delay) then
        display = false
        TriggerEvent('touche:display', false)
      end
      if (IsControlJustPressed(1, 51)) then
        display = false
        TriggerEvent('touche:display', false)
      end
    end
  end)
end)

RegisterNetEvent('touche:display')
AddEventHandler('touche:display', function(value)
  SendNUIMessage({
    type = "touche",
    display = value
  })
end)

function ShowInfo(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, state, 0, -1)
end


