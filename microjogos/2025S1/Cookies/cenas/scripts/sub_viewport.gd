extends SubViewport

@export var monster: CharacterBody2D
@export var camera: Camera2D

func _ready() -> void:
	world_2d = get_tree().root.world_2d
	
