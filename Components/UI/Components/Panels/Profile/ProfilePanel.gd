extends Control


func _on_button_pressed() -> void:
	Game.Main.CurrentGameState = Game.Main.MainData.MAIN_STATES.START

func _set_panel_data() -> void :
	pass
