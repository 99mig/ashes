extends Node


static func _place_component(component_layer : String, block_data : Object, component_position : Vector2i) -> bool:
	var component_placed : bool = false
	
	var component_layer_enum = GlobalData.MapComponent.keys().find(component_layer)
	if component_layer_enum == -1 :
		printerr("No se encontro el layer en el enum GlobalData.MapComponent")
		return false
	

	match component_layer_enum :
		GlobalData.MAP_COMPONENT.CardSlot :
			component_placed = _place_slot(component_layer_enum,block_data, component_position)
		GlobalData.MAP_COMPONENT.HeroSlot :
			component_placed = _place_slot(component_layer_enum,block_data, component_position)
		GlobalData.MAP_COMPONENT.DisciplineSlot :
			component_placed = _place_slot(component_layer_enum,block_data, component_position)
		GlobalData.MAP_COMPONENT.EquipSlot :
			component_placed = _place_slot(component_layer_enum,block_data, component_position)
		GlobalData.MAP_COMPONENT.DeckSlot :
			component_placed = _place_slot(component_layer_enum,block_data, component_position)
		GlobalData.MAP_COMPONENT.GraveyardSlot :
			component_placed = _place_slot(component_layer_enum,block_data, component_position)
		GlobalData.MAP_COMPONENT.InstantSlot :
			component_placed = _place_slot(component_layer_enum,block_data, component_position)
		GlobalData.MAP_COMPONENT.HandHolder :
			component_placed = _place_holder(component_layer_enum,block_data, component_position)
		GlobalData.MAP_COMPONENT.GlobalHolder :
			component_placed = _place_holder(component_layer_enum,block_data, component_position)
		GlobalData.MAP_COMPONENT.Background :
			component_placed = _place_background(block_data, component_position)
	
	return component_placed


static func _place_background(block_data : Object, component_position : Vector2i) -> bool:
	# Map.Main.Managers.Tiles._place_tile("Layer_00", block_data, component_position)
	Map.Main.LayerBackGround.set_cell(component_position, block_data.atlas_id, block_data.atlas_coords)
	return true



static func _place_slot(component_layer : GlobalData.MapComponent, block_data : Object, component_position : Vector2i) -> bool :
	var new_slot = load(GlobalData.SlotComponentScene).instantiate()
	new_slot.name = "Slot_" + str(component_position)
	Map.Main.LayerPlayMat.add_child(new_slot)
	new_slot._set_data(component_layer, block_data, component_position)
	return true

static func _place_holder(component_layer : GlobalData.MapComponent, block_data : Object, component_position : Vector2i) -> bool :
	var new_holder = load(GlobalData.SlotComponentScene).instantiate()
	Map.Main.LayerPlayMat.add_child(new_holder)
	new_holder._set_data(component_layer, block_data, component_position)
	return true
