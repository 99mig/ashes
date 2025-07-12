extends Camera2D

# Variables de arrastre
var mouse_start_pos: Vector2
var screen_start_position: Vector2
var dragging: bool = false

# Variables de zoom
var zoom_min: float = 0.5
var zoom_max: float = 2.0
var zoom_factor: float = 1.1

# Límites de desplazamiento de la cámara
var camera_limit_left: float = -1000.0
var camera_limit_right: float = 1000.0
var camera_limit_top: float = -1000.0
var camera_limit_bottom: float = 1000.0

# Configuración de suavizado (opcional)
var smooth_movement: bool = true
var smooth_speed: float = 10.0

func _ready():
	# Configurar límites iniciales si es necesario
	set_camera_limits()

func _input(event):
	handle_drag_input(event)
	handle_zoom_input(event)

func handle_drag_input(event):
	if event.is_action("MouseWheelDrag"):
		if event.is_pressed():
			mouse_start_pos = event.position
			screen_start_position = position
			dragging = true
		else:
			dragging = false
	elif event is InputEventMouseMotion and dragging:
		var new_position = (mouse_start_pos - event.position) + screen_start_position
		position = clamp_camera_position(new_position)

func handle_zoom_input(event):
	if event is InputEventMouseButton:
		var old_zoom = zoom
		var zoom_changed = false
		
		if event.is_action("MouseWheelScrollUp"):
			# Zoom in
			zoom *= zoom_factor
			zoom_changed = true
			
		elif event.is_action("MouseWheelScrollDown"):
			# Zoom out
			zoom /= zoom_factor
			zoom_changed = true
		
		if zoom_changed:
			# Aplicar límites de zoom
			zoom = zoom.clamp(Vector2(zoom_min, zoom_min), Vector2(zoom_max, zoom_max))
			
			# Zoom hacia la posición del mouse
			zoom_at_point(get_global_mouse_position(), old_zoom)

func zoom_at_point(point: Vector2, old_zoom: Vector2):
	# Calcular la nueva posición para hacer zoom hacia el punto específico
	var local_point = (point - global_position) / old_zoom
	var new_position = point - local_point * zoom
	global_position = clamp_camera_position(new_position)

func clamp_camera_position(pos: Vector2) -> Vector2:
	# Aplicar límites de desplazamiento
	var clamped_pos = pos
	clamped_pos.x = clamp(pos.x, camera_limit_left, camera_limit_right)
	clamped_pos.y = clamp(pos.y, camera_limit_top, camera_limit_bottom)
	return clamped_pos

func set_camera_limits(left: float = -600.0, right: float = 2000.0, top: float = -600.0, bottom: float = 600.0):
	"""Función para establecer los límites de la cámara programáticamente"""
	camera_limit_left = left
	camera_limit_right = right
	camera_limit_top = top
	camera_limit_bottom = bottom

func _process(delta):
	# Movimiento suave opcional
	if smooth_movement and dragging:
		var target_pos = clamp_camera_position(position)
		position = position.lerp(target_pos, smooth_speed * delta)

# Funciones auxiliares para cambiar límites dinámicamente
func set_horizontal_limits(left: float, right: float):
	camera_limit_left = left
	camera_limit_right = right

func set_vertical_limits(top: float, bottom: float):
	camera_limit_top = top
	camera_limit_bottom = bottom

func reset_limits():
	camera_limit_left = -600.0
	camera_limit_right = 2000.0
	camera_limit_top = -600.0
	camera_limit_bottom = 600.0

# Función para obtener los límites actuales
func get_limits() -> Dictionary:
	return {
		"left": camera_limit_left,
		"right": camera_limit_right,
		"top": camera_limit_top,
		"bottom": camera_limit_bottom
	}





func get_camera_rect() -> Rect2:
	var camera_center = get_screen_center_position()
	var camera_viewport = get_canvas_transform().affine_inverse().basis_xform(get_viewport_rect().size)
	var half_viewport = camera_viewport * 0.5
	return Rect2((camera_center.x - half_viewport.x), (camera_center.y - half_viewport.y), camera_viewport.x, camera_viewport.y)
