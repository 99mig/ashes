extends Node

static func _map_data_to_json() -> Dictionary:
	var map_data_json = {}

	for layer in Map.Main.ActiveLayers :

		map_data_json[layer] = {}
		
		var used_cells = Map.Main.ActiveLayers[layer].get_used_cells()

		for cell in used_cells :
			var atlas_coord = Map.Main.ActiveLayers[layer].get_cell_atlas_coords(cell)
			var source_id = Map.Main.ActiveLayers[layer].get_cell_source_id(cell)

			if source_id != -1 :
				var tile_data = Map.Main.ActiveLayers[layer].tile_set.get_source(source_id).get_tile_data(atlas_coord, 0)
				
				var custom_data = tile_data.get_custom_data("TILE_ID")
				
				map_data_json[layer][str(cell)] = custom_data

	return map_data_json




static func _string_to_vector2i(input : String) -> Vector2i:
	# Eliminar todos los espacios y paréntesis
	var cleaned_input = input.replace(" ", "").replace("(", "").replace(")", "")
	
	# Separar la cadena por la coma
	var componentes = cleaned_input.split(",", false)
	
	if componentes.size() != 2:
		push_error("Formato inválido: se esperaban exactamente dos componentes separados por coma.")
		return Vector2i()
	
	# Verificar y convertir los valores
	var x = componentes[0]
	var y = componentes[1]
	
	if x.is_valid_int() and y.is_valid_int():
		return Vector2i(int(x), int(y))
	
	push_error("Valores no enteros encontrados: '%s', '%s'" % [x, y])
	return Vector2i()
