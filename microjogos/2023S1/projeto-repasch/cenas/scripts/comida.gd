extends CharacterBody2D

@export var speed = 400;

func _init() -> void:
	velocity = Vector2.DOWN * speed	
	
func _physics_process(delta):
	move_and_slide()
