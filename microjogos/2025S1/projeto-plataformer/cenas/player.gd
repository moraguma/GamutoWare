extends CharacterBody2D


var jump_speed = 265.0
var gravity = 9.0
var acceleration = 100.0
var final_velocity = 200.0
var array
var animation_player
var sprite
var player
var parent
var timer
var won = 0.0

func _ready():
	animation_player = get_node("AnimationPlayer")
	sprite = get_node("Sprite2D")
	player = get_node(".")
	array = [get_node("../Porta"), get_node("../Porta2")]
	parent = get_parent()
	animation_player.play("idle")
	timer = get_node("../Timer")
	timer.start(6.0)


func _process(delta):
	for door in array:
		if door.overlaps_body(player) and Input.is_action_just_pressed("cima"):
			parent.register_win()
			print("ganhei na porta")
			get_node("../Efeito_vitoria").play()


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity
	
	if animation_player.get_current_animation() == "fall" and is_on_floor():
		animation_player.play("idle")
	
	if Input.is_action_pressed("direita"):
		sprite.flip_h = false
		animation_player.play("run")
		if velocity.x < 0:
			velocity.x = 0
		if velocity.x < final_velocity:
			velocity.x += acceleration * delta
		else:
			velocity.x = final_velocity
	
	elif Input.is_action_pressed("esquerda"):
		sprite.flip_h = true
		animation_player.play("run")
		if velocity.x > 0:
			velocity.x = 0
		if velocity.x > -final_velocity:
			velocity.x -= acceleration * delta
		else:
			velocity.x = -final_velocity
	
	if is_on_floor() and Input.is_action_pressed("acao"):
		velocity.y -= jump_speed
		animation_player.play("jump")
	
	elif not is_on_floor() and velocity.y > 0.0:
		animation_player.play("fall")
	
	if not Input.is_action_pressed("esquerda") and not Input.is_action_pressed("direita") and is_on_floor():
		velocity.x = 0
		animation_player.play("idle")
	
	move_and_slide()


func _on_estrela_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("ganhei")
		get_node("../Estrela").get_node("Sprite2D").visible = false
		get_node("../Efeito_vitoria").play()
		won = 1.0
		parent.register_win()


func _on_timer_timeout() -> void:
	if won == 0.0:
		print("perdi")
		parent.register_lose()
