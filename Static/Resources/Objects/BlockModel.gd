class_name BLOCK extends Resource

@export var tile_id: String = ""

@export var max_quantity: int

@export var sprite: Texture

@export var dimensions : Vector3i = Vector3i(1, 1, 1)

## DESCRIPCION DEL OBJETO
@export_multiline var hover: String

@export var can_be_placed : bool = true

@export var rarity : GlobalData.BLOCK_RARITY


@export var type : GlobalData.BLOCK_TYPE


@export var atlas_id: int
@export var atlas_coords: Vector2i
