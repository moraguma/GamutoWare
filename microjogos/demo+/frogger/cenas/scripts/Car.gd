extends Area2D


const STEP_SIZE = 16


onready var animation_player = $AnimationPlayer


func _ready():
	# Seleciona uma animação aleatório entre as 3 possíveis
	animation_player.play("car_" + str(randi() % 3))


func step():
	position += Vector2(1, 0) * STEP_SIZE
