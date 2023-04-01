extends CharacterBody2D

@export var speed = 500;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func get_input():
	var input_direction = Input.get_vector("esquerda","direita","cima","baixo")
	velocity = input_direction*speed
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	move_and_slide()
	pass
