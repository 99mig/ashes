extends Node2D


const Builder = preload("res://Components/Map/Managers/Builder.gd")
const Loader = preload("res://Components/Map/Managers/Loader.gd")
const Hover = preload("res://Components/Map/Managers/Hover.gd")

const Components = preload("res://Components/Map/Managers/Components.gd")


@onready var Slots: Node2D = $"../SlotsManager"



static func is_cell_empty_in_layer(map_layer: String, object_position: Vector2i) -> bool:
	var layer = Map.Main.ActiveLayers[map_layer]
	if layer.get_cell_tile_data(object_position) != null:
		return false
	return true
