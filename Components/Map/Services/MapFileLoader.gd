
## SAVE MAP IN USER LOCAL FOLDER
static func _save_local_map_json(new_map_name : String , new_dictionary : Dictionary) -> bool:
	var json_string = JSON.stringify(new_dictionary)
	print_debug(json_string)
	# Crea el path con el nombre del castillo
	var file_path = "user://ashes/maps/" + new_map_name + ".json"
	print_debug(file_path)
	# Asegúrate de que la carpeta exista
	DirAccess.make_dir_recursive_absolute("user://ashes/maps")

	# Guarda el archivo
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	print_debug(file)
	if file:
		file.store_string(json_string)
		file.close()
		return true
	else:
		print("No se pudo guardar el archivo.")
		return false	


## LOAD MAP FROM USER LOCAL FOLDER
static func _load_local_map_json(map_name: String) -> Dictionary:
	var file_path = "user://ashes/maps/" + map_name + ".json"
	if not FileAccess.file_exists(file_path):
		print("El archivo no existe.")
		return {}
		
	var json_data = FileAccess.open(file_path, FileAccess.READ)
	var dictionary_result = JSON.parse_string(json_data.get_as_text())
	json_data.close()
	
	if dictionary_result is Dictionary :
		return dictionary_result
	else:
		print("Error al parsear JSON")
		return {}










## LOAD MAP FROM GAME LOCAL FOLDER
static func load_static_map_json(map_path: String) -> Dictionary:
	if not FileAccess.file_exists(map_path):
		print("El archivo no existe.")
		return {}
		
	var json_data = FileAccess.open(map_path, FileAccess.READ)
	var dictionary_result = JSON.parse_string(json_data.get_as_text())
	json_data.close()
	
	if dictionary_result is Dictionary :
		return dictionary_result
	else:
		print("Error al parsear JSON")
		return {}
