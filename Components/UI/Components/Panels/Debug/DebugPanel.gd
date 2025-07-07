extends Control

@onready var map_name: LineEdit = $Container/VBoxContainer/LineEdit


func _on_button_pressed() -> void:
	Map.Main.Managers.Loader.load_map_local(map_name.text)
