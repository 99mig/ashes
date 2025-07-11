
static func clear_map() -> bool :
	for layer in Map.Main.ActiveLayers :
		Map.Main.ActiveLayers[layer].clear()
	return true



static func build_map(map_data : Dictionary) -> void:
	
	for component_layer in map_data.keys() :
		
		# Map.Main.Services.MapEffects._restart_speed_multiplier(0.3)
		
		var blocks = map_data[component_layer].keys()
		#cells = Map.Main.Services.MapEffects._sort_cells_to_place(cells, "diagonal")

		for block in blocks:
			
			var block_data = Map.Main.Services.BlocksData._load_block_data(map_data[component_layer][block])
			var component_position = Map.Main.Services.MapDataSerializer._string_to_vector2i(block)

			"""
			aca tengo que coger los valores del bloque q se va a poner y suponer que el layer es el tipo de componente
			correspondiente a ese bloque, debo hacer un match con el GlobalData.MAP_COMPONENT y el layer para saber que 
			tipo de escena de componente instanciar y adjuntarle el recurso del bloque, cuando se instancie la escena del tipo de componente
			debe usar la funcion set_component del recurso
			"""
			
			var block_placed = Map.Main.Managers.Components._place_component(component_layer, block_data, component_position)
			

			if block_placed:
				# GlobalSignals.emit_signal("block_placed_in_cell", block_position, layer, block_placed)
				_on_tile_placed(component_layer, block_data, component_position) # -> on_componentr_placed
				#print("Block placed in cell: " + str(component_position))
			else:
				print("Failed to place block in cell: " + str(component_position))
	




static func _on_tile_placed(component_layer : String, block_placed : Resource, block_position : Vector2i) -> void:
	# Asegura que el layer exista en el diccionario
	if not Map.Main.CurrentMapTiles.has(component_layer):
		Map.Main.CurrentMapTiles[component_layer] = {}
	# Guarda el item en la posición indicada
	Map.Main.CurrentMapTiles[component_layer][str(block_position)] = block_placed.tile_id
