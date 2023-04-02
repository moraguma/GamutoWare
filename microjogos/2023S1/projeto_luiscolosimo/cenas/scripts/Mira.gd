extends Area2D


const SPEED = 600
const ACCEL = 0.15
const SPRITE_LERP_WEIGHT = 0.2
const RECOIL = Vector2(0, -64)

var velocity = Vector2(0, 0)
var targets = []


@onready var main = get_parent()
@onready var sprite = $Sprite2D






func _process(delta):
	# Interpola a posição do sprite para a posição normal. Em conjunto com a levantada que cara tiro
	# dá no sprite, dá o efeito da arma pulando a cada tiro
	pass


func _physics_process(delta):
	if Input.is_action_just_pressed("acao"):
		print($"../Cria".dentro)
		$"../Cria/cria".hide()
		$"../Cria/Kobeni".show()
		print("oi")
		get_parent().register_win()
	
	var dir = (
		Vector2(1, 0) * 
		(Input.get_action_strength("direita") - Input.get_action_strength("esquerda")) 
		+ Vector2(0, 1) * 
		(Input.get_action_strength("baixo") - Input.get_action_strength("cima"))
		).normalized()
	velocity = velocity.lerp(dir * SPEED, ACCEL)
	position += velocity * delta 
	
	# Limita a posição da mira para não sair da tela
	position[0] = clamp(position[0], 0, 1920)
	position[1] = clamp(position[1], 0, 1080)



