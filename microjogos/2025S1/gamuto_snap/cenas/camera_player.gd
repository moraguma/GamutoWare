extends CharacterBody2D

@export var speed : int = 400

func get_input():
	var input_direction : Vector2 = Input.get_vector("esquerda", "direita", "cima", "baixo")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
