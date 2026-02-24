extends "res://principal/cenas/scripts/PressableButton.gd"


@export var url : String


func _pressed():
	OS.shell_open(url)
