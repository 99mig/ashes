extends Node2D

var object_being_dragged




func _physics_process(delta: float) -> void:
	
	if object_being_dragged :
		print_debug("CARD ACTIONS", object_being_dragged)
		var mouse_pos = Map.Main.get_global_mouse_position()
		object_being_dragged.position = Vector2(	clamp(mouse_pos.x, Game.Main.Camera.get_camera_rect().position.x, Game.Main.Camera.get_camera_rect().end.x),
												clamp(mouse_pos.y, Game.Main.Camera.get_camera_rect().position.y, Game.Main.Camera.get_camera_rect().end.y))





"""
	SELECT COMPONENT
"""

func in_select_component(component):
	var zoom_factor = 2
	Game.Main.Camera.set_focus_to(component.position, zoom_factor)

func out_select_component():
	Game.Main.Camera.reset_to_default()


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
		object_being_dragged = null
