extends CharacterBody2D
	
const V = 550.0

func _physics_process(delta):
	if Input.is_action_pressed("direita"):
		$Piaui_sprite.flip_h = false
		$Piaui_sprite_vitoria.flip_h = false
		velocity.x = V
	elif Input.is_action_pressed("esquerda"):
		$Piaui_sprite.flip_h = true
		$Piaui_sprite_vitoria.flip_h = true
		velocity.x = -V
	else:
		velocity.x = 0
		
	if (Input.is_action_just_pressed("acao") or Input.is_action_just_pressed("cima")) and is_on_floor():
		velocity.y = -600

	velocity.y += 800 * delta
	
	move_and_slide()


func _on_main_win():
	$Piaui_sprite.visible = false
	$Piaui_sprite_vitoria.visible = true
