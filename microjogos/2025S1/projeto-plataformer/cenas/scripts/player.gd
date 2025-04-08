extends CharacterBody2D


var jump_speed: float = 265.0
var gravity: float = 9.0
var acceleration: float = 100.0
var final_velocity: float = 200.0
var animation_player
var fell: bool = false
var is_jumping = false
var sprite
var landing_sound

func _ready():
	animation_player = $AnimationPlayer
	animation_player.play("idle")
	animation_player.speed_scale = 1.0
	sprite = $Sprite2D
	landing_sound = $Landing_sound


func _process(delta):
	if animation_player.current_animation != "run":
		animation_player.speed_scale = 1.0
	if position.y >= 8.0 * 16 and not fell:
		var falling = $Falling
		falling.play()
		falling.volume_db -= 10.0
		fell = true


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity
	
	if animation_player.get_current_animation() == "fall" and is_on_floor():
		animation_player.play("idle")
		animation_player.speed_scale = 1.0
		landing_sound.play()
		is_jumping = false
	
	if Input.is_action_pressed("direita"):
		sprite.flip_h = false
		if is_on_floor():
			animation_player.play("run")
		if velocity.x < 0:
			velocity.x += 1.5 * acceleration * delta
		else:
			if velocity.x < final_velocity:
				velocity.x += acceleration * delta
			else:
				velocity.x = final_velocity
	
	elif Input.is_action_pressed("esquerda"):
		sprite.flip_h = true
		if is_on_floor():
			animation_player.play("run")
		if velocity.x > 0:
			velocity.x -= 1.5 * acceleration * delta
		else:
			if velocity.x > -final_velocity:
				velocity.x -= acceleration * delta
			else:
				velocity.x = -final_velocity
	
	if is_on_floor() and Input.is_action_pressed("acao"):
		is_jumping = true
		if animation_player.current_animation == "run":
			animation_player.stop()
			$AnimationPlayer/AudioStreamPlayer2D.stop()
		# Essa animação não funciona se o boneco estiver em idle
		# Em um frame após pular, o boneco ainda estava encostando no chão
		# e isso fazia com que a animação de idle pra quando
		# ele estava parado no chão ativasse
		animation_player.play("jump")
		velocity.y -= jump_speed
		animation_player.speed_scale = 1.0
	
	elif not is_on_floor() and velocity.y > 0.0:
		$AnimationPlayer/AudioStreamPlayer2D.stop()
		animation_player.play("fall")
		animation_player.speed_scale = 1.0
	
	if not Input.is_action_pressed("esquerda") and not Input.is_action_pressed("direita") and is_on_floor() and not is_jumping:
		velocity.x = 0
		$AnimationPlayer/AudioStreamPlayer2D.stop()
		animation_player.play("idle")
		animation_player.speed_scale = 1.0
	
	if animation_player.current_animation == "run":
		animation_player.speed_scale = 1.0 + abs(velocity.x) / final_velocity
	else:
		animation_player.speed_scale = 1.0
	move_and_slide()
