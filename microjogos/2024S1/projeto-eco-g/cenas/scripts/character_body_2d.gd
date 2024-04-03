extends CharacterBody2D

signal dead
@export var speed = 400
@export var rotation_speed = 0.8
@onready var music = $Music
@onready var death = $Death
@onready var animated_gamuto = $AnimatedGamuto
@onready var sonar = $Sonar
var is_dead = false
var rotation_direction = 0
var vision = 0

func get_input():
	if (Input.is_action_pressed("cima")):
		velocity = transform.y * -1 * speed
		vision = -1
	elif (Input.is_action_pressed("baixo")):
		velocity = transform.y * 1 * speed
		vision = 1
	else:
		velocity = transform.y
		vision = 0

func _physics_process(delta):
	if !is_dead: 
		get_input()
		animated_gamuto.rotation = vision * rotation_speed
		sonar.rotation = vision * rotation_speed
		move_and_slide()
	else:
		animated_gamuto.rotation -= rotation_speed / 1.5
		velocity = transform.y * 2 * speed
		move_and_slide() 
func _ready():
	animated_gamuto.play("default")
	music.play()
	
func player_hit():
	animated_gamuto.play("hit")
	music.stop()
	death.play()
	is_dead = true
	emit_signal("dead")
