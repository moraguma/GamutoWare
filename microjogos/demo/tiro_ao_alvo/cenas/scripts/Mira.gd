extends Area2D


const SPEED = 600
const ACCEL = 0.15
const SPRITE_LERP_WEIGHT = 0.2
const RECOIL = Vector2(0, -64)


var velocity = Vector2(0, 0)
var targets = []


@onready var main = get_parent()
@onready var sprite = $Sprite2D

@onready var acerto_sfx = $Acerto
@onready var tiro_sfx = $Tiro


func _process(delta):
	# Interpola a posição do sprite para a posição normal. Em conjunto com a levantada que cara tiro
	# dá no sprite, dá o efeito da arma pulando a cada tiro
	sprite.position = sprite.position.lerp(Vector2(0, 0), SPRITE_LERP_WEIGHT)


func _physics_process(delta):
	# Se apertar o botão de tiro
	if Input.is_action_just_pressed("acao"):
		# Levanta a posição do sprite
		sprite.position += RECOIL
		
		var hit = false
		
		# Chama função de acerto em todos os alvos na mira
		for target in targets:
			if target.hit():
				main.register_hit()
				hit = true
		
		tiro_sfx.play()															# Toca o som de tiro
		if hit:
			acerto_sfx.play()													# Toca o som de acerto somente se acertar
	
	# Pega a direção apontada pelo jogador
	# Vetor para direita * (força direita - força esquerda) + Vetor para baixo * (força baixo - força cima). Tudo isso normalizado
	var dir = (Vector2(1, 0) * (Input.get_action_strength("direita") - Input.get_action_strength("esquerda")) + Vector2(0, 1) * (Input.get_action_strength("baixo") - Input.get_action_strength("cima"))).normalized()
	
	# Interpola a velocidade para a velocidade máxima na direção escolhida
	velocity = velocity.lerp(dir * SPEED, ACCEL)
	# delta_s = v * delta_t
	position += velocity * delta 
	
	# Limita a posição da mira para não sair da tela
	position[0] = clamp(position[0], 0, 1920)
	position[1] = clamp(position[1], 0, 1080)


# Chamado por um sinal quando uma área enconsta nessa
func add_target(target):
	targets.append(target)


# Chamado por um sinal quando uma área sai dessa
func remove_target(target):
	targets.erase(target)
