extends Node

static var speed_settings := {
	"base_time": 0.2,
	"multiplier": 5.0,
	"acceleration": 0.01,
	"min_value": 0.0005
}

static func _get_speed_settings() -> Dictionary:
	return speed_settings.duplicate()

static func _set_speed_settings(new_settings: Dictionary) -> void:
	for key in speed_settings.keys():
		if new_settings.has(key):
			speed_settings[key] = new_settings[key]

static func _restart_speed_multiplier(start_multiplier : float) -> void:
	var speed = _get_speed_settings()
	speed["animation_speed_multiplier"] = start_multiplier
	_set_speed_settings(speed)






static func _sort_cells_to_place(cells : Array, direction : String):
	pass


static func _animate_set_cell_in_layer(object_position : Vector2i, map_layer : String, object_data : Resource) -> bool:
	return true
