extends CharacterBody2D

@export var speed = 200
var camera = Camera2D

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	
func _process(delta):
	if Input.is_action_just_pressed("acao") and speed != 0: 
		$Sound_Camera.play()
		await get_tree().create_timer(0.1).timeout
		speed = 0
		camera_flash()
		pass

func camera_flash():
	$Player_Sprite.texture = load("res://microjogos/2024S1/projeto-do-lucas/recursos/IMG_FLASH.png")
	$Player_Sprite_Idle.queue_free()
	camera_polaroid()
	
func camera_polaroid():
	await get_tree().create_timer(0.4).timeout
	$Player_Sprite.texture = load("res://microjogos/2024S1/projeto-do-lucas/recursos/IMG_POLAROID.png")
	
func _physics_process(delta):
	get_input()
	move_and_slide()
