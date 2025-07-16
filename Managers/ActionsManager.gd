extends Node

"""
	CHECK EL ESTADO PARA SABER QUE DEBE AHCER EL CLICK
"""

# Función principal para manejar clicks en objetos
func handle_object_click(clicked_object: Node, requested_action: ActionType):
	if can_execute_action(clicked_object, requested_action):
		execute_action(clicked_object, requested_action)
	else:
		var reason = get_block_reason(clicked_object, requested_action)
		action_blocked.emit(reason)
		print("Acción bloqueada: ", reason)

# Verificar si se puede ejecutar una acción
func can_execute_action(object: Node, action: ActionType) -> bool:
	# Verificar si la acción está permitida en el estado actual
	if not is_action_allowed_in_state(action):
		return false
	
	# Verificar si el objeto soporta la acción
	if not is_action_valid_for_object(object, action):
		return false
	
	return true

# Verificar si la acción está permitida en el estado actual
func is_action_allowed_in_state(action: GlobalData.ActionType) -> bool:
	var allowed_actions = actions_on_state.get(current_state, [])
	return action in allowed_actions

# Verificar si el objeto soporta la acción
func is_action_valid_for_object(object: Node, action: GlobalData.ActionType) -> bool:
	var object_type = get_object_type(object)
	var valid_actions = valid_object_actions.get(object_type, [])
	return action in valid_actions
