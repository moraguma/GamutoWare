extends "res://principal/cenas/scripts/PressableButton.gd"


export (String) var path


func _ready():
	connect("pressed", self, "transition")


func transition():
	Global.goto_scene(path)
