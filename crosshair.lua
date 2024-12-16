local bowWeapons = {
    [GetHashKey('weapon_bow')] = true,
    [GetHashKey('weapon_bow_improved')] = true
}

local function isUsingBow(currentWeapon)
    return bowWeapons[currentWeapon] ~= nil
end

Citizen.CreateThread(function()
    local crosshairSize = 0.001  -- Size of the square crosshair (can be adjusted)
    local crosshairColor = {255, 255, 255, 255}  -- White color for the bow crosshair (R, G, B, A)
    
    local lastWeapon = nil  -- To keep track of the last weapon equipped

    while true do
        Citizen.Wait(0)

        local ped = PlayerPedId()
        local hasWeapon, currentWeapon = GetCurrentPedWeapon(ped)

        -- Check if the player is aiming (both mouse and controller)
        local isAiming = IsPlayerFreeAiming(PlayerId())  -- Returns true if the player is aiming

        -- Only show the crosshair if the player is using a bow AND aiming
        if hasWeapon and isUsingBow(currentWeapon) and isAiming then
            -- If the current weapon is a bow and the player is aiming, show a small white square crosshair
            local screenX, screenY = 0.5, 0.5  -- Center of the screen
            local width, height = crosshairSize, crosshairSize  -- Crosshair size (square)

            -- Draw a small white square (crosshair) in the center of the screen
            DrawRect(screenX, screenY, width, height, crosshairColor[1], crosshairColor[2], crosshairColor[3], crosshairColor[4])

            -- Update lastWeapon to indicate the player is using a bow
            lastWeapon = currentWeapon
        elseif lastWeapon and not isUsingBow(currentWeapon) then
            -- If the last weapon was a bow and the player has switched to another weapon, reset the crosshair
            lastWeapon = nil
        end
    end
end)