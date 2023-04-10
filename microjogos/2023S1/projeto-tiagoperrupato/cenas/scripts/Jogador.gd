extends CharacterBody2D


const speed = 600
var exploded = false
var collision

func explode():
	if not exploded:
		$"./Explosao".visible = true
		$"../Musica-Explosao".play()
		exploded = true

func _physics_process(delta):
	# Add movement
	if not exploded:
		if Input.is_action_pressed("cima"):
			velocity.y = -speed
		elif Input.is_action_pressed("baixo"):
			velocity.y = speed
		else:
			velocity.y = 0
	
	collision = move_and_collide(velocity*delta)	# move
	if collision != null:
		if collision.get_collider().is_in_group("Veiculos"):
			explode()
			velocity.y = 0
			$"../".register_lose()
