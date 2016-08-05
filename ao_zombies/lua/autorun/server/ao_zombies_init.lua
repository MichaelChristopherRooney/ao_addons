include("ao_zombies_data.lua")

local check_radius = 15 * 39.3701 --convert metres to inches
local height = 150 --inches
local ao_zombies_map_data = ao_zombie_data["rp_downtown_v4"]
local NPCList = list.Get("NPC")
local validWeapons = list.Get("NPCUsableWeapons")
local ao_zombies_active_groups = { -- there can be three active sites at any time
	[1] = {["counter"] = 0, ["site_index"] = -1},
	[2] = {["counter"] = 0, ["site_index"] = -1},
	[3] = {["counter"] = 0, ["site_index"] = -1}
}


-- this function was taken from garrysmod\gamemodes\sandbox\gamemode\commands.lua:288 and modified slightly
local function ao_zombies_InternalSpawnNPC( Player, Position, Normal, Class, Equipment, Angles, Offset )

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


-- generate a new site index that is not the same as one of the active ones (including the group that just died)
local function ao_zombies_get_new_site_index()

	local active_one = ao_zombies_active_groups[1]["site_index"]
	local active_two = ao_zombies_active_groups[2]["site_index"]
	local active_three = ao_zombies_active_groups[3]["site_index"]

	while true do
		
		local site_index = math.random(1, #ao_zombies_map_data)

		if site_index != active_one and site_index != active_two and site_index != active_three then
			return site_index
		end

	end

end


-- when a zombie is killed we decrease the active zombie counter for the group it's associated with
-- we also set the site to -1 to indicate that it's free
local function ao_zombies_ent_remove(ent)
	
	if not ent.ao_zombies_index then
		return
	end

	local active_index = ent.ao_zombies_index

	local ao_zombies_remaining = ao_zombies_active_groups[active_index]["counter"]
	ao_zombies_remaining = ao_zombies_remaining - 1
	ao_zombies_active_groups[active_index]["counter"] = ao_zombies_remaining
	
	if ao_zombies_active_groups[active_index]["counter"] == 0 then

		local site_index = ao_zombies_get_new_site_index()
		ao_zombies_active_groups[active_index]["site_index"] = -1
		timer.Create("ao_zombies_spawn_timer_" .. active_index, 5, 1, function() ao_zombies_spawn_group(active_index, site_index) end )

	end
	
end
hook.Add("EntityRemoved", "ao_zombies_ent_remove", ao_zombies_ent_remove)


-- this function gets called by a timer created in ao_zombies_init
local function ao_zombies_spawn_initial()

	-- spawn three groups of zombies
	math.randomseed(os.time())
	local index = ao_zombies_get_new_site_index()
	ao_zombies_spawn_group(1, index)
	index = ao_zombies_get_new_site_index()
	ao_zombies_spawn_group(2, index)
	index = ao_zombies_get_new_site_index()
	ao_zombies_spawn_group(3, index)

end


-- the server crashes on startup if we don't delay spawning the AI by at least 5 seconds
local function ao_zombies_init()

	timer.Simple(5, ao_zombies_spawn_initial)
	
end
hook.Add("Initialize", "ao_zombies_init", ao_zombies_init)


-- check if any players are in a given radius of the spawn centre
-- if a player is within the radius but is a minimum distance BELOW the spawn centre then return true
-- this prevents players in the sewer blocking zombies spawning in unconnected buildings above them
local function ao_zombies_check_site(site)

	local objects = ents.FindInSphere(site["centre"], check_radius)
	
	for k, v in pairs(objects) do
		if v:IsPlayer() then
			if (math.abs(site["centre"].z - v:GetPos().z) < height) then 
				return false
			end				
		end
	end
	
	return true
	
end

-- if the site is clear of players then spawn a group of zombies and associate each zombie with the group it's a part of
-- if the site is not clear then try another site in 5 seconds
function ao_zombies_spawn_group(active_index, site_index)


	local site_data = ao_zombies_map_data[site_index]
	local site_ok = ao_zombies_check_site(site_data)
	
	if site_ok then

		for k, v in pairs(site_data) do
			if k != "centre" then
				local position = v["position"]
				local angle = v["angle"]
				angle.pitch = 0
				angle.roll = 0
				local npc = ao_zombies_InternalSpawnNPC(nil, position, Vector(0.000000, -0.000000, 1.000000), "npc_zombie", nil, angle, 16 )
				npc.ao_zombies_index = active_index -- associate the zombie with an entry in ao_zombies_group_counters so it can tracked when killed

			end
		end

		ao_zombies_active_groups[active_index]["counter"] = #site_data
		ao_zombies_active_groups[active_index]["site_index"] = site_index

	else

		site_index = ao_zombies_get_new_site_index()
		timer.Create("ao_zombies_spawn_timer_" .. active_index, 5, 1, function() ao_zombies_spawn_group(active_index, site_index) end )

	end

end