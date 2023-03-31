extends "res://principal/cenas/scripts/PressableButton.gd"


@export (String) var url


func _pressed():
	OS.shell_open(url)
