include("ao_ai_data.lua")

local NPCList = list.Get("NPC")
local validWeapons = list.Get("NPCUsableWeapons")

local ao_ai_map_data = ao_ai_data["rp_downtown_v4"] -- get the table for the current map
local ao_ai_table_length = #ao_ai_map_data -- how many AI spawn zones we have
local ao_ai_height_check = 3.5
local ao_ai_active_count = 0


--this function was taken from garrysmod\gamemodes\sandbox\gamemode\commands.lua:288 and modified slightly
local function ao_ai_InternalSpawnNPC( Player, Position, Normal, Class, Equipment, Angles, Offset )

	local NPCData = NPCList[ Class ]

	-- Don't let them spawn this entity if it isn't in our NPC Spawn list.
	-- We don't want them spawning any entity they like!
	if ( not NPCData ) then
		if ( IsValid( Player ) ) then
			Player:SendLua( "Derma_Message( \"Sorry! You can't spawn that NPC!\" )" )
		end
	return end

	if ( NPCData.AdminOnly and not Player:IsAdmin() ) then return end

	local bDropToFloor = false

	--
	-- This NPC has to be spawned on a ceiling ( Barnacle )
	--
	if ( NPCData.OnCeiling and Vector( 0, 0, -1 ):Dot( Normal ) < 0.95 ) then
		return nil
	end

	--
	-- This NPC has to be spawned on a floor ( Turrets )
	--
	if ( NPCData.OnFloor and Vector( 0, 0, 1 ):Dot( Normal ) < 0.95 ) then
		return nil
	else
		bDropToFloor = true
	end

	if ( NPCData.NoDrop ) then bDropToFloor = false end

	--
	-- Offset the position
	--
	Offset = NPCData.Offset or Offset or 32
	Position = Position + Normal * Offset

	-- Create NPC
	local NPC = ents.Create( NPCData.Class )
	if ( not IsValid( NPC ) ) then return end

	NPC:SetPos( Position )

	if ( NPCData.Rotate ) then Angles = Angles + NPCData.Rotate end

	NPC:SetAngles( Angles )

	--
	-- This NPC has a special model we want to define
	--
	if ( NPCData.Model ) then
		NPC:SetModel( NPCData.Model )
	end

	--
	-- This NPC has a special texture we want to define
	--
	if ( NPCData.Material ) then
		NPC:SetMaterial( NPCData.Material )
	end

	--
	-- Spawn Flags
	--
	local SpawnFlags = bit.bor( SF_NPC_FADE_CORPSE, SF_NPC_ALWAYSTHINK )
	if ( NPCData.SpawnFlags ) then SpawnFlags = bit.bor( SpawnFlags, NPCData.SpawnFlags ) end
	if ( NPCData.TotalSpawnFlags ) then SpawnFlags = NPCData.TotalSpawnFlags end
	NPC:SetKeyValue( "spawnflags", SpawnFlags )

	--
	-- Optional Key Values
	--
	if ( NPCData.KeyValues ) then
		for k, v in pairs( NPCData.KeyValues ) do
			NPC:SetKeyValue( k, v )
		end
	end

	--
	-- This NPC has a special skin we want to define
	--
	if ( NPCData.Skin ) then
		NPC:SetSkin( NPCData.Skin )
	end

	--
	-- What weapon should this mother be carrying
	--
	if ( Equipment and Equipment ~= "none" ) then
		NPC:SetKeyValue( "additionalequipment", Equipment )
		NPC.Equipment = Equipment
	end

	DoPropSpawnedEffect( NPC )

	NPC:Spawn()
	NPC:Activate()

	if ( bDropToFloor and not NPCData.OnCeiling ) then
		NPC:DropToFloor()
	end

	return NPC

end


-- when an ent is removed we check if it's an AI spawned by this addon being killed
-- when all the active AI are dead we spawn the loot at the last one to die
local function ao_ai_ent_remove(ent)
	
	if not ent.ao_ai_flag then
		return
	end
	
	ao_ai_active_count = ao_ai_active_count - 1
	
	if ao_ai_active_count > 0 then return end
	
	PrintMessage(HUD_PRINTTALK, "The soldiers have been defeated! Now claim their loot!")

	timer.Remove("ao_ai_reminder_timer")
	ao_ai_active_count = 0

	DarkRP.createMoneyBag(ent:GetPos(), 5000)

	-- set up the next group spawn
	local delay = math.random(ao_ai_min_time, ao_ai_max_time)
	timer.Simple(delay, ao_ai_spawn_npc_group)
	
end
hook.Add("EntityRemoved", "ao_ai_ent_remove", ao_ai_ent_remove)


-- check if any players are in a given radius of the spawn centre
-- if a player is within the radius but is a minimum distance BELOW the spawn centre then return true
-- this prevents players in the sewer blocking sites spawning in unconnected buildings above them
local function ao_ai_check_site(site_index)

	local objects = ents.FindInSphere(ao_ai_map_data[site_index]["centre"], ao_ai_map_data[site_index]["radius"] * 39.3701) -- convert metres to inches

	for k, v in pairs(objects) do
		if v:IsPlayer() then
			if (v:GetPos().z > ao_ai_map_data[site_index]["centre"].z or math.abs(ao_ai_map_data[site_index]["centre"].z - v:GetPos().z) < 150) then 
				return false
			end				
		end
	end
	
	return true
	
end


-- this function spawns all the AI in a randomly selected group
function ao_ai_spawn_npc_group()
	
	local site_index = math.random(ao_ai_table_length)
	local site_ok = ao_ai_check_site(site_index)
	
	-- if the site is not clear then try again after a set time
	-- this will repeat until a site is clear
	if not site_ok then
		timer.Simple(10, ao_ai_spawn_npc_group)
		return
	end
	
	PrintMessage(HUD_PRINTTALK, "A group of soldiers have taken over part of the town! Kill them and take their loot before they leave!")
	
	local site_table = ao_ai_map_data[site_index]
	
	for k, v in pairs(site_table) do
		if k != "centre" and k != "radius" then -- avoid using these keys
		
			local class = v["class"]
			local weapon = ao_ai_weapon_data[class]
			local position = v["position"]
			local angle = v["angle"]
			angle.pitch = 0
			angle.roll = 0
			
			local npc = ao_ai_InternalSpawnNPC(nil, position, Vector(0.000000, -0.000000, 1.000000), class, weapon, angle, 16 )
			npc:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)
			local health = npc:GetMaxHealth()
			npc:SetMaxHealth(health * 2)
			npc:SetHealth(health * 2)
			npc.ao_ai_flag = true -- flag this AI as being part of this addon's spawned AI
			
		end
	end

	ao_ai_active_count = #site_table - 2 -- -2 to account for centre and radius keys

	timer.Create("ao_ai_reminder_timer", 5, 0, function() PrintMessage(HUD_PRINTTALK, "The soldiers still control part of the town! Kill them for their loot and weapons!") end)
	
end


local function ao_ai_init()

	math.randomseed(os.time())
	local delay = math.random(ao_ai_min_time, ao_ai_max_time)
	timer.Simple(delay * 60, ao_ai_spawn_npc_group) 
	
end
hook.Add("Initialize", "ao_ai_init", ao_ai_init)