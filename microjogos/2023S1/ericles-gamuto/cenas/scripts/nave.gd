extends CharacterBody2D

@export var max_speed = 400
@export var acceleration = 1500
@export var friction = 1000

func _physics_process(delta):
	var rotation_dir = Input.get_action_strength("direita") - Input.get_action_strength("esquerda")
	var acceleration_dir = Input.get_action_strength("baixo") - Input.get_action_strength("cima")
	if acceleration_dir:
		velocity = velocity.move_toward(Vector2(0, acceleration_dir).rotated(rotation) * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	rotation += rotation_dir * delta
	move_and_slide()


func colide(body: Node) -> void:
	print("colide")
	queue_free()
