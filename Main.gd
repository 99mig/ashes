class_name Game
extends Control

static var Main: Game

func _init() -> void: 
	Main = self

##----------------------------------------------------------------##


const Services = preload("res://Services/MainServices.gd")
const Managers = preload("res://Managers/MainManagers.gd")

@onready var World: Node2D = $World
@onready var MainUI: Control = $MainUI
@onready var Camera: Camera2D = $World/Camera2D

@onready var CurrentGameState = GlobalData.MAIN_STATES.Start



func _ready() -> void:
	_set_main_state_machine()


func _set_main_state_machine() -> void :
	var MainStateMachineScene = load(GlobalData.MAIN_STATE_MACHINE).instantiate()
	add_child(MainStateMachineScene)
