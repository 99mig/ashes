extends GameState


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	if Game.Main.CurrentGameState == GlobalData.MainGameState.Playmat :
		transition.emit("playmat")


func _on_enter() -> void:
	UI.Main.UIManager.show_screen("START_SCREEN", {})


func _on_exit() -> void:
	UI.Main.UIManager.hide_screen()
