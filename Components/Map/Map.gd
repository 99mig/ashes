class_name Map
extends Node2D

static var Main: Map

func _init() -> void: 
	Main = self


##---------------------------------------##

const Services = preload("res://Components/Map/Services/MapServices.gd")
@onready var Managers: Node2D = $MapManager


@onready var LayerBackGround: TileMapLayer = $BackGround
@onready var LayerPlayMat: TileMapLayer = $Playmat

@onready var ActiveLayers = {
	"Layer_00" : LayerBackGround,
	"Layer_01" : LayerPlayMat
	}

var CurrentMapTiles : Dictionary = { } ## este diccionario implementar funciones para que se arme a medida q se ponen cosas en el mapa

func _ready() -> void:
	LayerPlayMat.tile_set = preload("res://Static/Resources/TileSet/00_00_TILES.tres")
	LayerPlayMat.position.y = -16
