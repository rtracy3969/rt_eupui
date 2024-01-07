local department, outfitnumbermale, outfitnumberfemale, cam = 1, 1, 1, nil

Citizen.CreateThread(function()
    Wait(5000)
    if Config.outfits[1].Enabled then
        SendNUIMessage({
            action = 'bcso'
        })
    end
    if Config.outfits[2].Enabled then
        SendNUIMessage({
            action = 'gw'
        })
    end
    if Config.outfits[3].Enabled then
        SendNUIMessage({
            action = 'sast'
        })
    end
    if Config.outfits[4].Enabled then
        SendNUIMessage({
            action = 'lspd'
        })
    end
	if Config.outfits[5].Enabled then
        SendNUIMessage({
            action = 'lspa'
        })
    end
end)

RegisterCommand(Config.command, function()
    SendNUIMessage({
        action = 'openeup'
    })
    SetNuiFocus(true, true)
    ChangeUniform()
    CreateCam()
end)

RegisterNUICallback("bcso", function()
    department = 1
    outfitnumbermale = 1
    outfitnumberfemale = 1
    SendNUIMessage({
        action = "changename",
        title = "Empty"
    })
    ChangeUniform()
end)

RegisterNUICallback("gw", function()
    department = 2
    outfitnumbermale = 1
    outfitnumberfemale = 1
    SendNUIMessage({
        action = "changename",
        title = "Empty"
    })
    ChangeUniform()
end)

RegisterNUICallback("sast", function()
    department = 3
    outfitnumbermale = 1
    outfitnumberfemale = 1
    SendNUIMessage({
        action = "changename",
        title = "Empty"
    })
    ChangeUniform()
end)

RegisterNUICallback("lspd", function()
    department = 4
    outfitnumbermale = 1
    outfitnumberfemale = 1
    SendNUIMessage({
        action = "changename",
        title = "Empty"
    })
    ChangeUniform()
end)

RegisterNUICallback("lspa", function()
    department = 5
    outfitnumbermale = 1
    outfitnumberfemale = 1
    SendNUIMessage({
        action = "changename",
        title = "Empty"
    })
    ChangeUniform()
end)

RegisterNUICallback('closeeup', function()
    SetNuiFocus(false, false)
    DeleteCam()
end)

RegisterNUICallback('next', function()
    NextUniform()
end)

RegisterNUICallback('prev', function()
	PrevUniform()
end)

function NextUniform()
    if GetEntityModel(GetPlayerPed(-1)) == `mp_m_freemode_01` then
        outfitnumbermale = outfitnumbermale + 1
		if Config.outfits[department][outfitnumbermale].Male == false then
		    NextUniform()
		end
    elseif GetEntityModel(GetPlayerPed(-1)) == `mp_f_freemode_01` then
        outfitnumberfemale = outfitnumberfemale + 1
		if Config.outfits[department][outfitnumberfemale].Female == false then
		    NextUniform()
		end
    end
    ChangeUniform()
end

function PrevUniform()
    if GetEntityModel(GetPlayerPed(-1)) == `mp_m_freemode_01` then
        outfitnumbermale = outfitnumbermale - 1
		if Config.outfits[department][outfitnumbermale].Male == false then
		    PrevUniform()
		end
    elseif GetEntityModel(GetPlayerPed(-1)) == `mp_f_freemode_01` then
        outfitnumberfemale = outfitnumberfemale - 1
		if Config.outfits[department][outfitnumberfemale].Female == false then
		    PrevUniform()
		end
    end
    ChangeUniform()
end

RegisterNUICallback("RotatePedLeft", function()
    SetEntityHeading(GetPlayerPed(-1), (GetEntityHeading(GetPlayerPed(-1)) - 2.5))
end)

RegisterNUICallback("RotatePedRight", function()
    SetEntityHeading(GetPlayerPed(-1), (GetEntityHeading(GetPlayerPed(-1)) + 2.5))
end)

function ChangeUniform()
    if GetEntityModel(GetPlayerPed(-1)) == `mp_m_freemode_01` then
        if Config.outfits[department].MaxMale > 0 then
            if outfitnumbermale > 0 and outfitnumbermale <= Config.outfits[department].MaxMale then
                SendNUIMessage({
                    action = "changename",
                    title = Config.outfits[department][outfitnumbermale].Title
                })
                if Config.outfits[department][outfitnumbermale].Male.Hat[1] == 0 then
                    ClearPedProp(GetPlayerPed(-1), 0)
                else
                    SetPedPropIndex(GetPlayerPed(-1), 0, Config.outfits[department][outfitnumbermale].Male.Hat[1] - 1, Config.outfits[department][outfitnumbermale].Male.Hat[2] - 1, true)
                end
                if Config.outfits[department][outfitnumbermale].Male.Glasses[1] == 0 then
                    ClearPedProp(GetPlayerPed(-1), 1)
                else
                    SetPedPropIndex(GetPlayerPed(-1), 1, Config.outfits[department][outfitnumbermale].Male.Glasses[1] - 1, Config.outfits[department][outfitnumbermale].Male.Glasses[2] - 1, true)
                end
                if Config.outfits[department][outfitnumbermale].Male.Ear[1] == 0 then
                    ClearPedProp(GetPlayerPed(-1), 2)
                else
                    SetPedPropIndex(GetPlayerPed(-1), 2, Config.outfits[department][outfitnumbermale].Male.Ear[1] - 1, Config.outfits[department][outfitnumbermale].Male.Ear[2] - 1, true)
                end
                if Config.outfits[department][outfitnumbermale].Male.Watch[1] == 0 then
                    ClearPedProp(GetPlayerPed(-1), 6)
                else
                    SetPedPropIndex(GetPlayerPed(-1), 6, Config.outfits[department][outfitnumbermale].Male.Watch[1] - 1, Config.outfits[department][outfitnumbermale].Male.Watch[2] - 1, true)
                end

                SetPedComponentVariation(GetPlayerPed(-1), 1, Config.outfits[department][outfitnumbermale].Male.Mask[1] - 1, Config.outfits[department][outfitnumbermale].Male.Mask[2] - 1, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 3, Config.outfits[department][outfitnumbermale].Male.UpperSkin[1] - 1, Config.outfits[department][outfitnumbermale].Male.UpperSkin[2] - 1, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 11, Config.outfits[department][outfitnumbermale].Male.Top[1] - 1, Config.outfits[department][outfitnumbermale].Male.Top[2] - 1, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 10, Config.outfits[department][outfitnumbermale].Male.Decal[1] - 1, Config.outfits[department][outfitnumbermale].Male.Decal[2] - 1, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 8, Config.outfits[department][outfitnumbermale].Male.UnderCoat[1] - 1, Config.outfits[department][outfitnumbermale].Male.UnderCoat[2] - 1, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 4, Config.outfits[department][outfitnumbermale].Male.Pants[1] - 1, Config.outfits[department][outfitnumbermale].Male.Pants[2] - 1, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 6, Config.outfits[department][outfitnumbermale].Male.Shoes[1] - 1, Config.outfits[department][outfitnumbermale].Male.Shoes[2] - 1, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 7, Config.outfits[department][outfitnumbermale].Male.Accessories[1] - 1, Config.outfits[department][outfitnumbermale].Male.Accessories[2] - 1, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 9, Config.outfits[department][outfitnumbermale].Male.Armor[1] - 1, Config.outfits[department][outfitnumbermale].Male.Armor[2] - 1, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 5, Config.outfits[department][outfitnumbermale].Male.Parachute[1] - 1, Config.outfits[department][outfitnumbermale].Male.Parachute[2] - 1, 0)
            else
                if outfitnumbermale <= 0 then
                    outfitnumbermale = Config.outfits[department].MaxMale
                    ChangeUniform()
                elseif outfitnumbermale > Config.outfits[department].MaxMale then
                    outfitnumbermale = 1
                    ChangeUniform()
                end
            end
        end
    elseif GetEntityModel(GetPlayerPed(-1)) == `mp_f_freemode_01` then
        if Config.outfits[department].MaxFemale > 0 then
            if outfitnumberfemale > 0 and outfitnumberfemale <= Config.outfits[department].MaxFemale then
                SendNUIMessage({
                    action = "changename",
                    title = Config.outfits[department][outfitnumberfemale].Title
                })
                if Config.outfits[department][outfitnumberfemale].Female.Hat[1] == 0 then
                    ClearPedProp(GetPlayerPed(-1), 0)
                else
                    SetPedPropIndex(GetPlayerPed(-1), 0, Config.outfits[department][outfitnumberfemale].Female.Hat[1] - 1, Config.outfits[department][outfitnumberfemale].Female.Hat[2] - 1, true)
                end
                if Config.outfits[department][outfitnumberfemale].Female.Glasses[1] == 0 then
                    ClearPedProp(GetPlayerPed(-1), 1)
                else
                    SetPedPropIndex(GetPlayerPed(-1), 1, Config.outfits[department][outfitnumberfemale].Female.Glasses[1] - 1, Config.outfits[department][outfitnumberfemale].Female.Glasses[2] - 1, true)
                end
                if Config.outfits[department][outfitnumberfemale].Female.Ear[1] == 0 then
                    ClearPedProp(GetPlayerPed(-1), 2)
                else
                    SetPedPropIndex(GetPlayerPed(-1), 2, Config.outfits[department][outfitnumberfemale].Female.Ear[1] - 1, Config.outfits[department][outfitnumberfemale].Female.Ear[2] - 1, true)
                end
                if Config.outfits[department][outfitnumberfemale].Female.Watch[1] == 0 then
                    ClearPedProp(GetPlayerPed(-1), 6)
                else
                    SetPedPropIndex(GetPlayerPed(-1), 6, Config.outfits[department][outfitnumberfemale].Female.Watch[1] - 1, Config.outfits[department][outfitnumberfemale].Female.Watch[2] - 1, true)
                end

                SetPedComponentVariation(GetPlayerPed(-1), 1, Config.outfits[department][outfitnumberfemale].Female.Mask[1] - 1, Config.outfits[department][outfitnumberfemale].Female.Mask[2] - 1, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 3, Config.outfits[department][outfitnumberfemale].Female.UpperSkin[1] - 1, Config.outfits[department][outfitnumberfemale].Female.UpperSkin[2] - 1, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 11, Config.outfits[department][outfitnumberfemale].Female.Top[1] - 1, Config.outfits[department][outfitnumberfemale].Female.Top[2] - 1, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 10, Config.outfits[department][outfitnumberfemale].Female.Decal[1] - 1, Config.outfits[department][outfitnumberfemale].Female.Decal[2] - 1, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 8, Config.outfits[department][outfitnumberfemale].Female.UnderCoat[1] - 1, Config.outfits[department][outfitnumberfemale].Female.UnderCoat[2] - 1, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 4, Config.outfits[department][outfitnumberfemale].Female.Pants[1] - 1, Config.outfits[department][outfitnumberfemale].Female.Pants[2] - 1, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 6, Config.outfits[department][outfitnumberfemale].Female.Shoes[1] - 1, Config.outfits[department][outfitnumberfemale].Female.Shoes[2] - 1, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 7, Config.outfits[department][outfitnumberfemale].Female.Accessories[1] - 1, Config.outfits[department][outfitnumberfemale].Female.Accessories[2] - 1, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 9, Config.outfits[department][outfitnumberfemale].Female.Armor[1] - 1, Config.outfits[department][outfitnumberfemale].Female.Armor[2] - 1, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 5, Config.outfits[department][outfitnumberfemale].Female.Parachute[1] - 1, Config.outfits[department][outfitnumberfemale].Female.Parachute[2] - 1, 0)
            else
                if outfitnumberfemale <= 0 then
                    outfitnumberfemale = Config.outfits[department].MaxFemale
                    ChangeUniform()
                elseif outfitnumberfemale > Config.outfits[department].MaxFemale then
                    outfitnumberfemale = 1
                    ChangeUniform()
                end
            end
        end
    end
end

function CreateCam()
    local pos = GetEntityCoords(GetPlayerPed(-1))
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x, pos.y - 5.0, pos.z + 3.0, 10.00, 0.00, 10.00, 40.00, false, 0)
    SetCamActive(cam, true)
	RenderScriptCams(true, true, 500, true, true)
    PointCamAtCoord(cam, pos.x, pos.y, pos.z)
    SetEntityHeading(GetPlayerPed(-1), 180.0)
end

function DeleteCam()
    RenderScriptCams(false, true, 500, true, true)
    SetCamActive(cam, false)
	DestroyCam(cam, true)
	cam = nil
end
