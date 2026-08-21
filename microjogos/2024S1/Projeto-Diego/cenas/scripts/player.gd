extends CharacterBody2D
@export var distance := 150

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("cima"): position.y -= distance
	if Input.is_action_just_pressed("baixo"): position.y += distance
	if Input.is_action_just_pressed("esquerda"): position.x -= distance
	if Input.is_action_just_pressed("direita"): position.x += distance
	
