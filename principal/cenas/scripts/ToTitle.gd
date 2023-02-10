extends Node2D


const MENU_PATH = "res://principal/cenas/Menu.tscn"


var block_menu = false


func _physics_process(delta):
	if not block_menu:
		if Input.is_action_just_pressed("sair"):
			Global.goto_scene(MENU_PATH)
