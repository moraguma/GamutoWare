extends CharacterBody2D

const TIMER_SPEED = 0.3
const VELOCITY = 2500

func _ready():
	$Timer.start(TIMER_SPEED)

func _physics_process(_delta):
	# zerar velocidade quando não tiver movimentação
	velocity.x = 0
	velocity.y = 0

func _on_timer_timeout():
	# movimentar de forma aleatória para cima e para os lados
	var random = randf()
	var direction
	if random < 0.8:
		velocity.y = -VELOCITY
	elif random < 0.9:
		velocity.x = VELOCITY
	else:
		velocity.x = -VELOCITY
	move_and_slide()
	$Timer.start(TIMER_SPEED)
