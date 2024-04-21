@tool
extends Resource

class_name MinigameData

@export var main_path: PackedScene
@export var credits_path: Script
@export var cover: Texture2D

var difficulty = 0

func _process(_delta):
	if Engine.is_editor_hint():
		pass
