extends Area2D

@export var right_neighbor: Node = null
@export var left_neighbor: Node = null
@export var up_neighbor: Node = null
@export var down_neighbor: Node = null
@export var row: int = -1
@export var column: int = -1

enum State {EMPTY, FIRST, SECOND, THIRD }
var exterminated : bool = false

@export var state : State = State.THIRD
@onready var sprite_animation: Node2D = get_child(0)
static var animation_watery = preload("res://microjogos/2024S1/projeto_felipe_onorio/cenas/watery.tres")
static var animation_flame_fluffy = preload("res://microjogos/2024S1/projeto_felipe_onorio/cenas/flame_fluffy.tres")
static var animation_flame_pixely = preload("res://microjogos/2024S1/projeto_felipe_onorio/cenas/flame_pixely.tres")
static var animation_leaf = preload("res://microjogos/2024S1/projeto_felipe_onorio/cenas/leaf.tres")

func change_next_state():
	state = (state + 1) % 4
	if state == State.EMPTY:
		state += 1
	if exterminated:
		get_child(0).show()
		exterminated = false
	match state:
		State.EMPTY:
			print("should never have been called")
		State.FIRST:
			sprite_animation.set_sprite_frames(animation_flame_fluffy)
		State.SECOND:
			sprite_animation.set_sprite_frames(animation_watery)
		State.THIRD:
			sprite_animation.set_sprite_frames(animation_leaf)
	sprite_animation.play("default")
	

func update():
	state = state - 1
	change_next_state()

func _ready():
	pass

func _process(_delta):
	pass

func _on_cursor_area_activate_cell():
	change_next_state()
	pass

func _on_touch_screen_button_0_pressed():
	_on_cursor_area_activate_cell()
	print("touchscreenbuttonpressed")
	pass
