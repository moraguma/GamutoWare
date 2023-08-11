extends Node2D


const WIDTH = 480
const HEIGHT = 270


signal win
signal lose


var Player = preload("res://microjogos/moraguma/whale_eater/cenas/Player.tscn")


const POSSIBLE_SPAWN_POSITIONS = [Vector2(256, 112), Vector2(192, 176), Vector2(240, 72)]
const MAX_ROT_SPEED = 2.4
const ROT_ACCELERATION = 0.05


var player = null
var down_dir = Vector2(0, -1)
var rotation_speed = 0.0
var active = true


@onready var camera = $Camera
@onready var heart_animation_player = $Camera/AnimationPlayer


func _ready():
	match Global.language:
		Global.LANGUAGE.PT:
			NotificationCenter.notify("FOGE!")
		Global.LANGUAGE.EN:
			NotificationCenter.notify("GET OUT!")
	
	$Music.play()
	
	randomize()
	
	var spawn_pos = randi() % 3
	var gravity_indicator = randi() % 4
	var exit_pos = randi() % 3
	
	player = Player.instantiate()
	player.position = POSSIBLE_SPAWN_POSITIONS[spawn_pos]
	
	match gravity_indicator:
		0:
			down_dir = Vector2(0, -1)
		1: 
			down_dir = Vector2(1, 0)
		2:
			down_dir = Vector2(0, 1)
		3:
			down_dir = Vector2(-1, 0)
	
	player.set_gravity(down_dir)
	add_child(player)
	
	get_node("Block" + str(exit_pos + 1)).queue_free()
	get_node("Arrow" + str(exit_pos + 1)).show()


func _physics_process(delta):
	rotation_speed = lerp(rotation_speed, get_input_dir() * MAX_ROT_SPEED, ROT_ACCELERATION)
	down_dir = down_dir.rotated(-rotation_speed * delta).normalized()
	
	camera.rotation = Vector2(0, 1).angle_to(down_dir) 
	player.set_gravity(down_dir)


func get_input_dir():
	if active:
		return Input.get_action_strength("direita") - Input.get_action_strength("esquerda")
	return 0


func register_win(body):
	active = false
	emit_signal("win")
	
	heart_animation_player.play("enter")
