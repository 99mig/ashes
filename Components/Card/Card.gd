extends Node2D

@onready var CollisionFull: CollisionShape2D = $CardSprite/CardArea/Collision_Full
@onready var CollisionHolder: CollisionPolygon2D = $CardSprite/CardArea/Collision_Holder
@onready var CollisionSlot: CollisionPolygon2D = $CardSprite/CardArea/Collision_Slot

@onready var CardSprite: Sprite2D = $CardSprite

func _on_area_2d_mouse_entered() -> void:
	pass # Replace with function body.
