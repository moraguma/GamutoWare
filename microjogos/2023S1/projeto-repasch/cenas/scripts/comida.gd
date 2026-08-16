extends CharacterBody2D

@export var speed = 400;

func _ready() -> void:
	velocity = Vector2.DOWN * speed
	
func _physics_process(delta):
	move_and_slide()
	if position.y >= 1100:
		queue_free()
