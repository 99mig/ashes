extends Control

@onready var option_label: Label = $PanelContainer/MarginContainer/VBoxContainer/OptionLabel

var OptionsData

func _on_close_button_pressed() -> void:
	UI.Main.UIManager.hide_panel()



func _set_panel_data(data) -> void :
	OptionsData = data
	print_debug("Panel data: ", data)
	#option_label.text = 
