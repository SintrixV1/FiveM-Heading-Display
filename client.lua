local scaleFactor = 0.2 
local color = { 
    r=255,
    b=255,
    g=255,
    a=255
}
local x = 0.63135
local y = 0.172
local heading
local roundedHeading
local inPlane = true

Citizen.CreateThread(function()
    while true do
        if inPlane == true then
            heading = GetEntityHeading(GetPlayerPed(-1)) - 360
        else
            inPlane = false
        end
    Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function()
    while true do
        if inPlane == true then
            SetTextFont(0)
            SetTextJustification(0)
            SetTextOutline()
            SetTextScale(0.25, 0.25)
            SetTextColour(255, 255, 255, 255)
            SetTextEntry("STRING")
            roundedHeading = ("%.0f"):format(heading)
            AddTextComponentString("~r~Heading:~w~ " .. roundedHeading * -1 .. "~w~ ")
            DrawText(1.100 - x, 0.185 - y)
        else
            Citizen.Wait(250)
        end
    Citizen.Wait(5)
    end
end)