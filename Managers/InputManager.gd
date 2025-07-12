class_name GameInput
extends Node2D


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("MouseLeftClick"):
				print("Left click")
				var object = raycast_check_for_areas()
				if object:
					Game.Main.Actions.start_drag(object)

		elif event.is_action_released("MouseLeftClick"):
				print("out Left click")
				Game.Main.Actions.finish_drag()
		elif event.is_action_pressed("MouseRightClick"):
			print("Right click")
			var object = raycast_check_for_areas()
			UI.Main.UIManager.show_panel("OPTIONS_PANEL", object, get_local_mouse_position())
		elif event.is_action_released("MouseRightClick"):
				print("out Right click")



func raycast_check_for_areas() :
	var space_state = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position()
	parameters.collide_with_areas = true
	#parameters.collision_mask = 2
	
	var result = space_state.intersect_point(parameters)
	
	if result.size() > 0 :
		return result[0].collider.get_parent()
	return null
