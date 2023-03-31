extends Node2D


signal win
signal lose


const WIDTH = 640
const HEIGHT = 360

const TOTAL_COLORS = 4
const WAIT_TIME = 0.5
const START_EXTRA_TIME = 0.3

const PRESS_OPACITY = 0.3
const LERP_WEIGHT = 0.02


var current_color = 0

var color_order = []

var active = false


@onready var color_sprites = [$Green, $Red, $Blue, $Yellow]
@onready var color_sounds = [$GreenSound, $RedSound, $BlueSound, $YellowSound]
@onready var timer = $Timer
@onready var win_sound = $Win
@onready var fail_sound = $Fail


func _ready():
	match Global.language:
		Global.LANGUAGE.PT:
			NotificationCenter.notify("IMITE!")
		Global.LANGUAGE.EN:
			NotificationCenter.notify("SIMON SAYS...")
	
	for i in range(TOTAL_COLORS):
		color_order.append(randi() % 4)
	
	timer.start(START_EXTRA_TIME)
	await timer.timeout
	for color_code in color_order:
		timer.start(WAIT_TIME)
		await timer.timeout
		
		play_color(color_code)
	
	active = true


func _physics_process(delta):
	if active:
		var color_code = -1
		
		if Input.is_action_just_pressed("direita"):
			color_code = 0
		elif Input.is_action_just_pressed("baixo"):
			color_code = 1
		elif Input.is_action_just_pressed("cima"):
			color_code = 2
		elif Input.is_action_just_pressed("esquerda"):
			color_code = 3
		
		if color_code != -1:
			button_click(color_code)


func _process(delta):
	for sprite in color_sprites:
		sprite.modulate.a = lerp(sprite.modulate.a, 1.0, LERP_WEIGHT)


func button_click(color_code):
	play_color(color_code)
	
	if color_code != color_order[current_color]:
			active = false
			fail_sound.play()
			
			return
	
	current_color += 1
	
	if current_color >= TOTAL_COLORS:
		active = false
		win_sound.play()
		
		emit_signal("win")


func play_color(color_code):
	color_sounds[color_code].play()
	color_sprites[color_code].modulate.a = PRESS_OPACITY
