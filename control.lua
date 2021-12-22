--control.lua

script.on_event(defines.events.on_built_entity,
	function(event)
		local player = game.get_player(event.player_index) 
		local ent = event.created_entity
		if (
			ent.name == 'pipe' or
			ent.name == 'pipe-to-ground' or
			ent.name == 'pump' or
			ent.name == 'storage-tank'
		) then
			player.surface.create_entity{name="explosion", position=ent.position, force="neutral"} 
			ent.destroy()
		end
	end
)