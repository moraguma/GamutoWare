extends "res://principal/cenas/scripts/PressableButton.gd"


export (String) var path


func _pressed():
	transition()


func transition():
	Global.goto_scene(path)
