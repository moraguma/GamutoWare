extends CharacterBody2D

@export var speed = 400
@export var rotation_speed = 0.8

var rotation_direction = 0
var vision = 0

func get_input():
	if (Input.is_action_just_pressed("esquerda")):
		if vision == 1:
			vision = 0
		else:
			vision = -1
	elif (Input.is_action_just_pressed("direita")):
		if vision == -1:
			vision = 0
		else:
			vision = 1
			
	if (Input.is_action_pressed("cima")):
		velocity = transform.y * -1 * speed
	elif (Input.is_action_pressed("baixo")):
		velocity = transform.y * 1 * speed
	else:
		velocity = transform.y

func _physics_process(delta):
	get_input()
	$"animated_gamuto".rotation = vision * rotation_speed
	$"Sonar".rotation = vision * rotation_speed
	move_and_slide()

func _ready():
	$"animated_gamuto".play("default")
	
