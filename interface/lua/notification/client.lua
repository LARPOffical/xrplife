RegisterNetEvent("XRPLife:SuccessNotification")
AddEventHandler("XRPLife:SuccessNotification", function(data)
    SendNUIMessage({
        type="success_notification",
        data = {title = data.title, message = data.message, time = data.time}
    })
end)

RegisterNetEvent("XRPLife:ErrorNotification")
AddEventHandler("XRPLife:ErrorNotification", function(data)
    SendNUIMessage({
        type="error_notification",
        data = {title = data.title, message = data.message, time = data.time}
    })
end)