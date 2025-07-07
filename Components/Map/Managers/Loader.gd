extends Node

static func load_map_local(map_name : String) -> bool:
	# Con el nombre del mapa buscamos su archivo json correspondiente y lo trawemos como dict
	var map_data : Dictionary = Map.Main.Services.MapFileLoader._load_local_map_json(map_name)

	# Si el map_data tiene contenido, cargo los datos del mapa
	if map_data.size() > 0 :

		if Map.Main.Managers.Builder.build_map(map_data) :
			return true
		else:
			return false
	else:
		return false



static func save_map_local(map_name : String) -> bool:

	var map_data_json = Map.Main.Services.MapDataSerializer._map_data_to_json()

	if map_data_json.size() > 0 :
		var result = Map.Main.Services.MapFileLoader._save_local_map_json(map_name, map_data_json)
		if result:
			print("Mapa guardado correctamente.")
			return true
		else:
			print("No se pudo guardar el mapa.")
			return false
	else:
		print("No se pudo obtener los datos del mapa.")
		return false
