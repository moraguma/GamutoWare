extends Node2D

var velocidade = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	#if Input.is_action_pressed("esquerda"):
	
	velocidade.x= -150
	position+=velocidade*delta
