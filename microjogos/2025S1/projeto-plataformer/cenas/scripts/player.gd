extends CharacterBody2D


@export var jump_speed: float = 700.0
@export var acceleration: float = 0.5
@export var final_velocity: float = 500.0
var fell: bool = false
var is_jumping = false

@export var animation_player: AnimationPlayer
@export var sprite: Sprite2D
@export var landing_sound: AudioStreamPlayer

var inventory = {}
@onready var falling = $Falling

func _process(delta):
	if position.y >= 1080 and not fell:
		falling.play()
		fell = true


func _physics_process(delta):
	var dir = Input.get_action_strength("direita") - Input.get_action_strength("esquerda")
	velocity.x = lerpf(velocity.x, final_velocity * dir, acceleration)
	sprite.flip_h = dir < 0
	
	if not is_on_floor():
		velocity.y += get_gravity().y * delta 
		if Input.is_action_pressed("baixo"):
			velocity.y = lerpf(velocity.y, jump_speed * 1.5, acceleration)
		if velocity.y > 0.0:
			$AnimationPlayer/Steps_sound.stop()
			animation_player.play("fall")
	else:
		if dir != 0: 
			animation_player.play("run")
		else:
			$AnimationPlayer/Steps_sound.stop()
			animation_player.play("idle")
		if Input.is_action_just_pressed("acao"):
			if animation_player.current_animation == "run":
				$AnimationPlayer/Steps_sound.stop()
			animation_player.play("jump")
			velocity.y = -jump_speed
	if is_on_wall() and Input.is_action_just_pressed("acao"):
		velocity.x += get_wall_normal().x * final_velocity
		animation_player.play("jump")
		velocity.y = -jump_speed
	move_and_slide()

func add_item(item_name):
	if item_name in inventory.keys():
		inventory[item_name] += 1
	else:
		inventory[item_name] = 1
	$CollectItem.play()
