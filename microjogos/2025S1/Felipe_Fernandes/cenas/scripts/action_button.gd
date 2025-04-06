extends Node2D

@export_enum("cima", "baixo", "esquerda", "direita") var key : String

@onready var icon: AnimatedSprite2D = $icon
@onready var radius_marking: Sprite2D = $radius_marking
@onready var radius: Sprite2D = $radius
@onready var vanishing_timer: Timer = $vanishing_timer

var spd := 1.3
var range := .15

var min := Vector2(.5, .5)
var max := Vector2.ZERO
var target := Vector2.ZERO

var mooving = false

var sucess_col := Color8(116, 139, 44)
var fail_col := Color8(137, 63, 67)

func _ready() -> void:
	max = radius.scale
	target = radius_marking.scale
	
	match (key):
		"cima":
			icon.frame = 0
		"direita":
			icon.frame = 1
		"baixo":
			icon.frame = 2
		"esquerda":
			icon.frame = 3

func _process(delta: float) -> void:
	if (mooving):
		radius.scale.x = lerp(radius.scale.x, 0.0, spd * delta)
		radius.scale.y = lerp(radius.scale.y, 0.0, spd * delta)

	radius.scale = clamp(radius.scale, min, max)
	
	if (Input.is_action_just_pressed(key)):
		mooving = false
		
		if (abs((radius.scale - target).length()) <= range):
			radius.self_modulate = sucess_col
		else:
			radius.self_modulate = fail_col
	
	if (radius.scale == min):
		fail_button()
		
	if (vanishing_timer.is_stopped() && !mooving):
		vanishing_timer.start()

func reset_button():
	self.visible = true
	radius.scale = max
	radius.self_modulate = Color(1, 1, 1)
	mooving = true

func fail_button():
	radius.self_modulate = fail_col
	mooving = false

func _on_vanishing_timer_timeout() -> void:
	visible = false
	vanishing_timer.stop()
