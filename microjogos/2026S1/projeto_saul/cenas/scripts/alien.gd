#ERES EL ALIEN

extends CharacterBody2D
var velocidad = 2
var direccion = 1
var vivo = true

func _ready() -> void:
	Minigames.register_win(self)

func _physics_process(delta):
	if vivo:
		rotate(direccion*velocidad*delta)
		if Input.is_action_pressed("direita"):
			direccion = 1
		if Input.is_action_pressed("esquerda"):
			direccion = -1
	else:
		$Sprite2D.play("fuego")
	
	
