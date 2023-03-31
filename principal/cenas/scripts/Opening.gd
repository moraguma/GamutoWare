extends "res://principal/cenas/scripts/ToTitle.gd"


@onready var animation_player = $AnimationPlayer


func _ready():
	animation_player.play("opening")


func _input(event):
	if Input.is_action_just_pressed("acao"):
		animation_player.stop()
		to_menu()


func to_menu():
	Global.goto_scene(MENU_PATH)
