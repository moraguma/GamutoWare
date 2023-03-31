extends "res://principal/cenas/scripts/PressableButton.gd"


@export (Vector2) var movement_vector
@export (NodePath) var next_focus_path


@onready var next_focus_node = get_node(next_focus_path)
@onready var main = get_parent().get_parent()


func _pressed():
	main.aim_pos += movement_vector
	next_focus_node.grab_focus()
