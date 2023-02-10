extends KinematicBody2D


const SPEED = 300
const JUMP_SPEED = 600
const GRAVITY = 800

# Declaramos a variável global velocidade como um Vector2,
# um vetor em duas dimensões
var velocidade = Vector2(0, 0)

func _physics_process(delta):
	if Input.is_action_pressed("direita"):
		velocidade.x = 300
	elif Input.is_action_pressed("esquerda"):
		velocidade.x = -300
	else:
		velocidade.x = 0
	
	if Input.is_action_just_pressed("acao") and is_on_floor():
		velocidade.y = -600
	
	velocidade.y += 800 * delta
	
	velocidade = move_and_slide(velocidade, Vector2(0, -1))
