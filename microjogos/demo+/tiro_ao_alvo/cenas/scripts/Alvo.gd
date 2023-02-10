extends Area2D


const RADIUS = 600
const RADIUS_VAR = 200
const SPEED = 125
const SPEED_VAR = 25
const MAX_ANGLE = PI/4


var dir = Vector2(0, 0)
var velocity = Vector2(0, 0)
var alive = true


# Aleatoriza a posição e velocidade do alvo assim que ele aparece
func _ready():
	# Posição aleatória em um raio de RADIUS +- RADIUS_VAR do centro da tela
	# Centro da tela + Vetor de ângulo aleatório de magnitude igual a RADIUS + valor aleatório em [-RADIUS_VAR, RADIUS_VAR]
	position = Vector2(960, 540) + Vector2(0, -1).rotated(rand_range(-PI, PI)) * (RADIUS + rand_range(-RADIUS_VAR, RADIUS_VAR))
	
	# Velocidade aleatória apontando para o centro da tela com erro de +- MAX_ANGLE radianos. Tem magnitude SPEED +- SPEED_VAR
	# Direção até o centro da tela, normalizada, então rotacionada em um valor aleatório em [-MAX_ANGLE, MAX_ANGLE]. Magnitude igual a SPEED + um valor aleatório em [-SPEED_VAR, SPEED_VAR]
	velocity = (Vector2(960, 540) - position).normalized().rotated(rand_range(-MAX_ANGLE, MAX_ANGLE)) * (SPEED + rand_range(-SPEED_VAR, SPEED_VAR))


# Se não tiver levado um tiro, delta_s = vel * delta_t
func _physics_process(delta):
	if alive:
		position += velocity * delta


# Chamado quando leva um tiro
func hit():
	# Se ainda não tiver levado um tiro
	if alive:
		hide()																	# Esconde
		alive = false															# Marca como morto
		return true
	return false
