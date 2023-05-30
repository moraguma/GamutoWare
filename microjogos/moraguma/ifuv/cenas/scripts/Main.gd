extends Node2D


signal win
signal lose


const WIDTH = 160
const HEIGHT = 90


const CURSOR_LERP_WEIGHT = 0.3
const PASSWORD_LENGTH = 3
const MAX_LENGTH = 3


var correct_password = ""
var input = ""
var enabled = true
@onready var selection = get_node("Pad/5")


@onready var keys = [$Key1, $Key2, $Key3, $Key4, $Key5]
@onready var error_sound = $ErrorSound
@onready var door_animation_player = $Door/AnimationPlayer
@onready var monster_animation_player = $Monster/AnimationPlayer
@onready var cursor = $Pad/Cursor
@onready var display = $Pad/Display
@onready var password = $Paper/Password
@onready var music = $Music


func _ready():
	match Global.language:
		Global.LANGUAGE.PT:
			NotificationCenter.notify("DIGITE!")
		Global.LANGUAGE.EN:
			NotificationCenter.notify("TYPE!")
	
	music.play()
	
	randomize()
	
	for i in range(PASSWORD_LENGTH):
		correct_password += str(randi() % 10)
	
	password.text = str(correct_password)
	
	monster_animation_player.play("approaching")
	cursor.play("default")


func _process(delta):
	display.text = "[center]" + str(input)
	cursor.position = cursor.position.lerp(selection.position, CURSOR_LERP_WEIGHT)


func _physics_process(delta):
	if enabled:
		if Input.is_action_just_pressed("acao"):
			selection.press()
		elif Input.is_action_just_pressed("cima"):
			try_selection(selection.up)
		elif Input.is_action_just_pressed("direita"):
			try_selection(selection.right)
		elif Input.is_action_just_pressed("baixo"):
			try_selection(selection.down)
		elif Input.is_action_just_pressed("esquerda"):
			try_selection(selection.left)
		


func try_selection(new_selection):
	if new_selection != null:
		selection = new_selection


func input_number(number):
	if len(input) < MAX_LENGTH:
		input += str(number)
		if len(input) == PASSWORD_LENGTH:
			enter()
	else:
		error_sound.play()


func erase():
	if len(input) > 0:
		input = input.substr(0, len(input) - 1)
	else:
		error_sound.play()


func enter():
	if input == correct_password:
		enabled = false
		emit_signal("win")
		
		door_animation_player.play("close")
	else:
		error_sound.play()


func play_key():
	keys[randi() % len(keys)].play()
