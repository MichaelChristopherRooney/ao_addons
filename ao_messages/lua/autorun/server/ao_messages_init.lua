include("ao_messages_data.lua")

local ao_messages_send_delay = 120 -- seconds
local ao_messages_index = 1

local function ao_messages_send()

	PrintMessage(HUD_PRINTTALK, ao_messages_data_table[ao_messages_index])
	timer.Simple(ao_messages_send_delay, ao_messages_send)

	ao_messages_index = ao_messages_index + 1

	if ao_messages_index > #ao_messages_data_table then
		ao_messages_index = 1
	end

end

local function ao_messages_init()

	timer.Simple(ao_messages_send_delay, ao_messages_send) 
	
end
hook.Add("Initialize", "ao_messages_init", ao_messages_init)