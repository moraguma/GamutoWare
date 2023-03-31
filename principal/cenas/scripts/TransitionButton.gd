extends "res://principal/cenas/scripts/PressableButton.gd"


@export var path: String


func _pressed():
	transition()


func transition():
	Global.goto_scene(path)
