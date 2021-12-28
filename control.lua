--control.lua

local function fails_filter(ent)
	return (
		ent.name == 'pipe' or
		ent.name == 'pipe-to-ground' or
		ent.name == 'pump' or
		ent.name == 'storage-tank'
	)
end

local function check_and_destroy(ent)
	if fails_filter(ent) then
		ent.surface.create_entity{name="explosion", position=ent.position, force="neutral"} 
		ent.destroy()
	end
end

script.on_event(defines.events.on_built_entity, function(event)
	check_and_destroy(event.created_entity)
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
	check_and_destroy(event.created_entity)
end)