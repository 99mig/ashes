extends Camera2D

var mouse_start_pos
var screen_start_position

var dragging = false

var zoom_min = 0.5
var zoom_max = 2.0

func _input(event):
	if event.is_action("MouseWheelDrag"):
		if event.is_pressed():
			mouse_start_pos = event.position
			screen_start_position = position
			dragging = true
		else:
			dragging = false
	elif event is InputEventMouseMotion and dragging:
		position = (mouse_start_pos - event.position) + screen_start_position
	
	elif event is InputEventMouseButton:
		var zoom_factor = 1.1  # Factor de zoom
		var old_zoom = zoom
		
		if event.is_action("MouseWheelScrollUp"):
			# Zoom in
			zoom *= zoom_factor
			zoom = zoom.clamp(Vector2(zoom_min, zoom_min), Vector2(zoom_max, zoom_max))
			
		elif event.is_action("MouseWheelScrollDown"):
			# Zoom out
			zoom /= zoom_factor
			zoom = zoom.clamp(Vector2(zoom_min, zoom_min), Vector2(zoom_max, zoom_max))
		
		var global_mouse_pos = get_global_mouse_position()
		var local_point = (global_mouse_pos - global_position) / old_zoom
		global_position = global_mouse_pos - local_point * zoom
