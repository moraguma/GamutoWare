extends CharacterBody2D

const SPEED = 6500
var active = true

func _physics_process(_delta):
	# assim como em anon.gd, a velocidade aumenta no momento do jump, e zera no
	# próximo frame, criando o efeito de um movimento em tiles, e não fluido
	if not active: return
	if Input.is_action_just_pressed("direita"):
		velocity.x += SPEED
	elif Input.is_action_just_pressed("esquerda"):
		velocity.x -= SPEED
	elif Input.is_action_just_pressed("baixo"):
		velocity.y += SPEED
	elif Input.is_action_just_pressed("cima"):
		velocity.y -= SPEED
	else:
		velocity.y = 0
		velocity.x = 0
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var bike: Bike = collision.get_collider() as Bike
		if bike:
			# if the bike hits you, you die.
			print("lose")
			emit_signal("lose")
			get_node("CollisionShape2D").disabled = true
			get_node("Bike Bell").play()
			active = false

	move_and_slide()
