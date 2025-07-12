extends Node2D

var object_being_dragged




func _physics_process(delta: float) -> void:
	
	if object_being_dragged :
		print_debug("CARD ACTIONS", object_being_dragged)
		var mouse_pos = Map.Main.get_global_mouse_position()
		object_being_dragged.position = Vector2(	clamp(mouse_pos.x, Game.Main.Camera.get_camera_rect().position.x, Game.Main.Camera.get_camera_rect().end.x),
												clamp(mouse_pos.y, Game.Main.Camera.get_camera_rect().position.y, Game.Main.Camera.get_camera_rect().end.y))




"""
	DRAG
"""

func start_drag(object) :
	print_debug("START DRAG: ", object)
	object_being_dragged = object
	object_being_dragged.scale = Vector2(1.1,1.1)


func finish_drag() :
	if object_being_dragged:
		object_being_dragged.scale = Vector2(1,1)
		object_being_dragged.position = Map.Main.LayerPlayMat.map_to_local(Map.Main.LayerPlayMat.local_to_map(object_being_dragged.position))
	#var object_slot_found = Ashes.Main.AshesInputEvent.raycast_slots_areas_on_click()
	#if object_slot_found and not object_slot_found.is_card_on_slot :
		#object_being_dragged.position = object_slot_found.position
		#object_being_dragged.card_collision.disabled = true
		#object_slot_found.is_card_on_slot = true
		#GlobalSignals.emit_signal("removing_card_on_hand", object_being_dragged)
	#else :
		#GlobalSignals.emit_signal("adding_card_to_hand", object_being_dragged)
		object_being_dragged = null
