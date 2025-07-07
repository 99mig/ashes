class_name UI
extends Control

static var Main: UI

func _init() -> void: 
	Main = self

##-------------------------------------------------##

const UIData = preload("res://Components/UI/Managers/UIData.gd")
const UIManager = preload("res://Components/UI/Managers/UIManager.gd")

@onready var canvas: CanvasLayer = $Canvas
