local uiActive = false

function CanUseCommand()
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId(), false)

    if Config.settings.usable_on_foot == true then
        return true
    else
        if isInVehicle then
            return true
        else
            return false
        end
    end
end

function notify(title, msg, type)
    if Config.settings.notification_system == 'default' then

        -- Default notification
        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(false, false)

        -- Notification with icon, uncomment if you want to use it and refer to FiveM native to customise it

        -- RequestStreamedTextureDict('WEB_FRUIT', true)

        -- SetNotificationTextEntry('STRING')
        -- AddTextComponentString(msg)
        -- SetNotificationMessage('WEB_FRUIT', 'WEB_FRUIT', true, 7, title)
        -- DrawNotification(false, true)

    elseif Config.settings.notification_system == 'esx' then
        TriggerEvent('esx:showNotification', msg)
    elseif Config.settings.notification_system == 'qbcore' then
        TriggerEvent('QBCore:Notify', msg, type, 3000)
    elseif Config.settings.notification_system == 'mythic' then
        exports['mythic_notify']:DoHudText(type, msg)
    elseif Config.settings.notification_system == 'okok' then
        exports['okokNotify']:Alert(title, msg, 3000, type, true)
    elseif Config.settings.notification_system == 'codem' then
        TriggerEvent('codem-notification:Create', msg, type, title, 3000)
    elseif Config.settings.notification_system == 'custom' then
        Config.settings.custom_notification(title, msg, type)
    end
end

RegisterNetEvent('ms-quickmap:setup', function ()
    for _,element in pairs(Config.elements) do
        SendNUIMessage({
            type = 'setup',
            data = {
                id = _,
                name = element.name,
                image_label = element.image_label,
                description = element.description,
                color = element.color
            },
            callback = #Config.elements,
        })
    end
    for _,element in pairs(Config.settings.close_keys) do
        SendNUIMessage({
            type = 'setupclosekey',
            data = element
        })
    end
end)

CreateThread(function ()
    Wait(500)
    TriggerEvent('ms-quickmap:setup')

    if Config.settings.use_command then

        RegisterCommand(Config.settings.trigger_command, function ()
            TriggerEvent('ms-quickmap:triggerui')
        end)
    
        TriggerEvent('chat:addSuggestion', '/'..Config.settings.trigger_command, Config.settings.command_help_message, {})
    
        if Config.settings.use_key then
            RegisterKeyMapping(Config.settings.trigger_command, Config.settings.trigger_key_description, 'keyboard', Config.settings.trigger_key)
        end
    end
end)

RegisterNUICallback('escapeui', function(data, cb)
    cb({})
    TriggerEvent('ms-quickmap:triggerui')
    Wait(1000)
end)

RegisterNUICallback('elementSelected', function(data, cb)
    cb({})
    TriggerEvent('ms-quickmap:triggerui')
    local coordsList = Config.elements[data.id].coords
    local playerCoords = GetEntityCoords(PlayerPedId())
    local closest_coords = coordsList[1]
    if not closest_coords and Config.settings.use_error_notification then
        print('Error code 4: Failed to found coords for the element '..data.id)
    end
    for k=2, #coordsList do
        if #(playerCoords - coordsList[k]) < #(playerCoords - closest_coords) then
            closest_coords = coordsList[k]
        end
    end
    SetNewWaypoint(closest_coords.x, closest_coords.y)
    if Config.settings.use_notification then
        notify(Config.settings.notification_title, Config.settings.placed_gps_notification_message, Config.settings.notification_types.success)
    end
end)

RegisterNetEvent('ms-quickmap:triggerui', function ()
    if CanUseCommand() then
        if uiActive then
            SetNuiFocus(false, false)
            uiActive = false
        else
            SetNuiFocus(true, true)
            uiActive = true
        end
        SendNUIMessage({
            type = 'triggerui',
            display = uiActive
        })
    else
        if Config.settings.use_notification then
            notify(Config.settings.notification_title, Config.settings.menu_not_allowed_notification_message, Config.settings.notification_types.error)
        end
    end
end)