static func clear_map() -> bool :
	for layer in Map.Main.Managers.active_layers :
		Map.Main.Managers.active_layers[layer].clear()
	return true


static func build_map(map_data : Dictionary) -> void:
	
	for layer in map_data.keys() :
		
		Map.Main.Services.MapEffects._restart_speed_multiplier(0.3)
		
		var cells = map_data[layer].keys()
		#cells = Map.Main.Services.MapEffects._sort_cells_to_place(cells, "diagonal")

		for cell in cells:
			
			var object_to_place = map_data[layer][cell]
			var object_position = Map.Main.Services.MapDataSerializer._string_to_vector2i(cell)

			var object_placed = await place_object(layer, object_to_place, object_position)

			if object_placed:
				GlobalSignals.emit_signal("object_placed_in_cell", object_position, layer, object_placed)
				print("Object placed in cell: " + str(object_position))
			else:
				print("Failed to place object in cell: " + str(object_position))
	



static func place_object(map_layer : String, object_to_place : String, object_position : Vector2i) -> Resource:
	var object_data : Resource
	var object_placed : bool
	
	match map_layer:
		"Entities" : 
			# object_data = load(Game.Main.EntitiesManager._get_entity_data(object_to_place))
			# object_placed = await Game.Main.EntitiesManager._spawn_new_entity(object_position, object_data)
			# return object_placed
			return null
		_: 
			object_data = load(Map.Main.Services.BlocksData._get_block_data(object_to_place))
			object_placed = await Game.Main.Components.PlaceItems._place_block_cell_in_layer(object_position, map_layer, object_data)
			if object_placed:
				return object_data
			else:
				return null







static func is_cell_empty_in_layer(object_position: Vector2i, map_layer: String) -> bool:
	var layer = Map.Main.ActiveLayers[map_layer]
	if layer.get_cell_tile_data(object_position) != null:
		return false
	return true
