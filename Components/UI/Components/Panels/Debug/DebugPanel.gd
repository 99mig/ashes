extends Control

@onready var map_name: LineEdit = $Container/VBoxContainer/LineEdit


func _on_button_pressed() -> void:
	Map.Main.Managers.Loader.load_map_local(map_name.text)


func _on_button_2_pressed() -> void:
	print_debug("CURRENT TILE MAP: ", Map.Main.CurrentMapTiles )
