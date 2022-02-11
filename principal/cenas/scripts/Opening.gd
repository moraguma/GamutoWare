extends "res://principal/cenas/scripts/ToTitle.gd"


func _ready():
	$AnimationPlayer.play("opening")


func to_menu():
	Global.goto_scene(MENU_PATH)
