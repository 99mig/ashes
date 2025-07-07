extends Control


func _on_button_pressed() -> void:
	Game.Main.CurrentGameState = GlobalData.MAIN_STATES.Playmat
