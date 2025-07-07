extends Node


static func _place_block_in_cell(object_position : Vector2i, map_layer : String, object_data : Resource) -> bool:
	if Map.Main.Managers.Builder.is_cell_empty_in_layer(object_position, map_layer):
		if await Map.Main.Services.MapEffects._animate_set_cell_in_layer(object_position, map_layer, object_data):
			Map.Main.Layers.active_layers[map_layer].set_cell(object_position, object_data.atlas_id, object_data.atlas_coords)
			return true
		else:
			return false
	else:
		return false