local QBCore = exports['qb-core']:GetCoreObject()


-- Eventos


RegisterNetEvent('mt-fishing:client:ComecarPesca', function(data)
    local ped = PlayerPedId()
    local time = math.random(4000, 8000)
    local pos = GetEntityCoords(ped)

    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem and GetWaterHeight(pos.x, pos.y, pos.z-2, pos.z - 3.0) then
            local ped = PlayerPedId()
            local animDict = "amb@world_human_stand_fishing@idle_a"
            local animName = "idle_c" 
            local pedPos = GetEntityCoords(ped)
            local fishingRodHash = `prop_fishing_rod_01`
            local bone = GetPedBoneIndex(ped, 18905)
					
	        Wait(500)
            RequestAnimDict(animDict)
			while not HasAnimDictLoaded(animDict) do
				Wait(100)
			end
			TaskPlayAnim(ped, animDict, animName, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)   
            rodHandle = CreateObject(fishingRodHash, pedPos, true)
            AttachEntityToEntity(rodHandle, ped, bone, 0.1, 0.05, 0, 80.0, 120.0, 160.0, true, true, false, true, 1, true)
            Wait(time)


            exports['ps-ui']:Circle(function(success)
            if success then
                TriggerServerEvent('mt-fishing:server:DarPeixe')
                ClearPedTasks(ped)
                DeleteObject(rodHandle)
                DeleteEntity(fishingRodHash)
                exports["mz-skills"]:UpdateSkill("FISHING", 1) ---skills add xp
                exports['okokNotify']:Alert("SKILLS", "[XP] +1 ", 2000, 'success') ---skills add xp message 
				TriggerServerEvent('ak4y-battlepass:taskCountAdd:standart', 2, 1)
                        -----ADDING SKILL REWARDS
                        exports["mz-skills"]:CheckSkill("FISHING", 25, function(hasskill)
							if hasskill then
								exports['okokNotify']:Alert("SKILLS", "EXTRA LOOT!", 2000, 'success')
								TriggerServerEvent('mt-weed:server:Apanhar')
							else
							end
							end)
	
							exports["mz-skills"]:CheckSkill("FISHING", 50, function(hasskill)
							if hasskill then
								exports['okokNotify']:Alert("SKILLS", "EXTRA LOOT!", 2000, 'success')
								TriggerServerEvent('mt-weed:server:Apanhar')
							else
							end
							end)
	
							exports["mz-skills"]:CheckSkill("FISHING", 100, function(hasskill)
							if hasskill then
								exports['okokNotify']:Alert("SKILLS", "EXTRA LOOT!", 2000, 'success')
								TriggerServerEvent('mt-weed:server:Apanhar')
							else
							end
							end)
	
							exports["mz-skills"]:CheckSkill("FISHING", 200, function(hasskill)
							if hasskill then
								exports['okokNotify']:Alert("SKILLS", "EXTRA LOOT!", 2000, 'success')
								TriggerServerEvent('mt-weed:server:Apanhar')
							else
							end
							end)
	
							exports["mz-skills"]:CheckSkill("FISHING", 400, function(hasskill)
							if hasskill then
								exports['okokNotify']:Alert("SKILLS", "EXTRA LOOT!", 2000, 'success')
								TriggerServerEvent('mt-weed:server:Apanhar')
							else
							end
							end)
	
							exports["mz-skills"]:CheckSkill("FISHING", 600, function(hasskill)
							if hasskill then
								exports['okokNotify']:Alert("SKILLS", "EXTRA LOOT!", 2000, 'success')
								TriggerServerEvent('mt-weed:server:Apanhar')
							else
							end
							end)
	
							exports["mz-skills"]:CheckSkill("FISHING", 800, function(hasskill)
							if hasskill then
								exports['okokNotify']:Alert("SKILLS", "EXTRA LOOT!", 2000, 'success')
								TriggerServerEvent('mt-weed:server:Apanhar')
							else
							end
							end)
	
							exports["mz-skills"]:CheckSkill("FISHING", 1000, function(hasskill)
							if hasskill then
								exports['okokNotify']:Alert("SKILLS", "EXTRA LOOT!", 2000, 'success')
								TriggerServerEvent('mt-weed:server:Apanhar')
							else
							end
							end)
							-----ENDING SKILL REWARDS
            else
                TriggerServerEvent('mt-fishing:server:PerderIsco')
                exports['okokNotify']:Alert("FISHING", "BAIT GONE", 2000, 'error')
                ClearPedTasks(ped)
                DeleteObject(rodHandle)
                DeleteEntity(fishingRodHash)
                exports["mz-skills"]:UpdateSkill("FISHING", -2) ---skills remove xp
                exports['okokNotify']:Alert("SKILLS", "[XP] -2 ", 2000, 'error') ---skills remove xp message 
            end
            end, math.random(4,8), math.random(8,12)) 
                                    
        else
        exports['okokNotify']:Alert("FISHING", "MISISNG: BAIT OR WATER!", 2000, 'error')
        end
      end, 'fishingbait')
end)