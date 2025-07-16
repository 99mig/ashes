class_name Game
extends Node

static var Main: Game

func _init() -> void: 
	Main = self

##----------------------------------------------------------------##


const Services = preload("res://Services/MainServices.gd")
const Managers = preload("res://Managers/MainManagers.gd")

@onready var GameInput: GameInput = $Input
@onready var World: Node2D = $World
@onready var MainUI: Control = $MainUI
@onready var Camera: Camera2D = $Camera
@onready var Actions: Node2D = $Actions


@onready var CurrentGameState = GlobalData.MainGameState.Start


func _ready() -> void:
	_set_main_state_machine()


func _set_main_state_machine() -> void :
	var MainStateMachineScene = load(GlobalData.MainGameStateMachine).instantiate()
	add_child(MainStateMachineScene)
