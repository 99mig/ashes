extends Node2D

@onready var slot_type : GlobalData.MAP_COMPONENT
@onready var block_data : BLOCK
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var slot_sprite: TileMapLayer = $SlotSprite


func _set_data(component_type : GlobalData.MAP_COMPONENT, block_data : BLOCK, component_position : Vector2i) -> void:
	print_debug(block_data)
	self.slot_type = component_type
	self.block_data = block_data
	sprite_2d.texture = block_data.sprite
	global_position = Map.Main.LayerPlayMat.map_to_local(component_position)


func _on_slot_area_mouse_entered() -> void:
	print("holder hover on type: ", slot_type)
	sprite_2d.modulate = Color(1, 0.25, 0.25, 1)


func _on_slot_area_mouse_exited() -> void:
	print("holder hover off")
	sprite_2d.modulate = Color(1, 1, 1, 1)
