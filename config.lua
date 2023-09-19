-- You can check the script Gitbook at this adress for a complete explanation of this file: https://moonlight-studio.gitbook.io/moonlight-studio/free-script/quickmap

Config = {}

Config.settings = {
    -- Trigger Options
    use_command = true, -- If you want to use a command to trigger the menu
    trigger_command = 'quickmap', -- Command to trigger the menu
    command_help_message = 'Allow you to quickly set a GPS point', -- Description of the command displayed when you type it in the chat
    use_key = true,  -- If you want to use a key to trigger the menu, use_command need to be true to use this feature.
    trigger_key = 'LMENU', -- Find the key name at https://docs.fivem.net/docs/game-references/controls/
    trigger_key_description = 'Open quick GPS menu', -- Description of the key displayed in the settings menu
    usable_on_foot = true, -- If you want to use the command in a vehicle

    -- Notification Options
    use_notification = true, -- If you want to use the notification system
    notification_system = 'default', -- Can be 'default', 'esx', 'qbcore', 'mythic', 'okok', 'codem' or 'custom'
    notification_title = 'Quick GPS', -- Title of the notification that can be use in some notification system
    notification_types = {
        success = "success",  -- Equivalent of 'success' type if you use a special notification system
        error = "error",  -- Equivalent of 'error' type if you use a special notification system
    },
    custom_notification = function (title, msg, type) -- Custom this function only if you set 'custom' to notification_type
        exports['mythic_notify']:DoHudText(type, msg) -- Example with mythic_notify
    end,
    menu_not_allowed_notification_message = 'You can\'t use this menu if you\'r not in a vehicle', -- Notification when you can't use the menu (refer to Usable Option )
    placed_gps_notification_message = 'GPS point succesfully placed', -- Notification when you succesfully place a GPS point.

    -- Close Key Options
    close_keys = {'Escape', 'Backspace', 'Enter'} -- Add as much key as you want, key name should be a JavaScript key name (Refer to https://keycode.info/ trigger_key parameter)
}



Config.elements = {
    { 
        name = 'Parking',
        image_label = 'parking.svg',
        description = 'Store your vehicle',
        color = '#bf2424',
        coords = {
            vector3(214.984619, -790.628540, 30.830078),
            vector3(271.68, -341.61, 44.92),
            vector3(-1183.17, -1502.86, 4.38),
            vector3(73.24, 11.78, 68.85),
            vector3(367.98, 296.57, 103.42),
            vector3(-1169.03, -743.49, 19.63),
            vector3(-791.39, -2030.26, 8.87),
            vector3(-453.49, -814.23, 30.58),
            vector3(1137.59, 2653.02, 38.0),
            vector3(79.68, 6417.33, 31.28),
            vector3(301.1, -183.12, 61.59),
            vector3(301.1, -183.12, -80.59),
            vector3(301.1, -183.12, 61.59)
        }
    },
    {
        name = 'Bank',
        image_label = 'bank.svg',
        description = 'Let\'s do a heist',
        color = '#bf7c24',
        coords = {
            vector3(150.266, -1040.203, 29.374),
            vector3(-1212.980, -330.841, 37.787),
            vector3(-2962.582, 482.627, 15.703),
            vector3(-112.202, 6469.295, 31.626),
            vector3(314.187, -278.621, 54.170),
            vector3(-351.534, -49.529, 49.042),
            vector3(241.727, 220.706, 106.286),
            vector3(1175.0643310547, 2706.6435546875, 38.094036102295)
        }
    },
    {
        name = 'Tattoo',
        image_label = 'tattoo.svg',
        description = 'Let\'s improve our body',
        color = '#c6d134',
        coords = {
            vector3(1322.645, -1651.976, 52.275),
            vector3(-1153.676, -1425.68, 4.954),
            vector3(322.139, 180.467, 103.587),
            vector3(-3170.071, 1075.059, 20.829),
            vector3(1864.633, 3747.738, 33.032),
            vector3(-293.713, 6200.04, 31.487)
            
        }
    },
    {
        name = 'Market',
        image_label = 'market.svg',
        description = 'Let\'s buy some foods',
        color = '#72bf24',
        coords = {
            vector3(25.99, -1347.71, 29.5),
            vector3(1729.12, 6414.13, 35.04),
            vector3(-48.7, -1757.75, 29.42),
            vector3(-1222.59, -906.63, 12.33),
            vector3(-707.61, -914.76, 19.22),
            vector3(1136.16, -982.69, 46.42),
            vector3(374.05, 325.54, 103.57),
            vector3(1163.23, -324.07, 69.21),
            vector3(2557.74, 382.34, 108.62),
            vector3(-3039.01, 586.24, 7.91),
            vector3(-3241.65, 100.1, 12.83),
            vector3(-2968.29, 391.17, 15.04),
            vector3(-1820.62, 792.32, 138.12),
            vector3(547.43, 2671.63, 42.16),
            vector3(1165.65, 2708.97, 38.16),
            vector3(2679.31, 3280.61, 55.24),
            vector3(1961.81, 3740.42, 32.34),
            vector3(1392.24, 3604.49, 34.98),
            vector3(1698.08, 4924.88, 42.06),
            vector3(1729.17, 6414.04, 35.04)
        }
    },
    {
        name = 'Clothe',
        image_label = 'clothe.svg',
        description = 'Let\'s buy some clothes',
        color = '#24bfba',
        coords = {
            vector3(72.254, -1399.102, 28.376),
            vector3(-703.776, -152.258, 36.415),
            vector3(-167.863, -298.969, 38.733),
            vector3(428.694, -800.106, 28.491),
            vector3(-829.413, -1073.710, 10.328),
            vector3(-1447.797, -242.461, 48.820),
            vector3(11.632, 6514.224, 30.877),
            vector3(123.646, -219.440, 53.557),
            vector3(1696.291, 4829.312, 41.063),
            vector3(618.093, 2759.629, 41.088),
            vector3(1190.550, 2713.441, 37.222),
            vector3(-1193.429, -772.262, 16.324),
            vector3(-3172.496, 1048.133, 19.863),
            vector3(-1108.441, 2708.923, 18.107)            
        }
    },
    {
        name = 'Weapon',
        image_label = 'weapon.svg',
        description = 'Let\'s be a bit safer',
        color = '#bf24a5',
        coords = {
            vector3(-662.1, -935.3, 20.8),
			vector3(810.2, -2157.3, 28.6),
			vector3(1693.4, 3759.5, 33.7),
			vector3(-330.2, 6083.8, 30.4),
			vector3(252.3, -50.0, 68.9),
			vector3(22.0, -1107.2, 28.8),
			vector3(2567.6, 294.3, 107.7),
			vector3(-1117.5, 2698.6, 17.5),
			vector3(842.4, -1033.4, 27.1)
        }
    },
    {
        name = 'Haircut',
        image_label = 'hair.svg',
        description = 'Let\'s have a new look',
        color = '#7124bf',
        coords = {
            vector3(-815.59008789063, -182.16806030273, 37.568920135498), 
            vector3(139.21583557129, -1708.9689941406, 29.301620483398),
            vector3(-1281.9802246094, -1119.6861572266, 7.0001249313354),
            vector3(1934.115234375, 3730.7399902344, 32.854434967041),
            vector3(1211.0759277344, -475.00064086914, 66.218032836914),
            vector3(-34.97777557373, -150.9037322998, 57.086517333984),
            vector3(-280.37301635742, 6227.017578125, 31.705526351929)
        }
    },
    {
        name = 'Police',
        image_label = 'police.svg',
        description = 'Let\'s eat some chicken',
        color = '#3934d1',
        coords = {
            vector3(442.7958, -983.1803, 30.6896), -- Mission Row PD
            vector3(1853.068, 3687.67, 34.26704), -- Sandy Shores PD
            vector3(-413.0269, 6156.583, 31.4782), -- Paleto Bay PD
            vector3(-1077.787, -823.4053, 19.27235), -- Rockford Hills PD
            vector3(581.2824, -8.364154, 84.44991), -- Vinewood PD
            vector3(-589.6071, -109.7003, 38.89636), -- Vespucci PD
            vector3(333.4852, -1568.388, 30.76099) -- Davis PD

        }
    },
}    
