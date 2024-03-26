extends Area2D

#export var right_neighbor_path: NodePath # we assign a path using inspector
#onready var right_neighbor := get_node(right_neighbor_path) as Node2D # then we get a reference

#@export var right_neighbor_path: NodePath
@export var right_neighbor: Node = null
@export var left_neighbor: Node = null
@export var up_neighbor: Node = null
@export var down_neighbor: Node = null

enum State {FIRST, SECOND, THIRD }

var state : State = State.FIRST
var sprite_animation: Node2D
var animation_watery = preload("res://microjogos/2024S1/projeto_felipe_onorio/cenas/watery.tres")
var animation_flame_fluffy = preload("res://microjogos/2024S1/projeto_felipe_onorio/cenas/flame_fluffy.tres")
var animation_flame_pixely = preload("res://microjogos/2024S1/projeto_felipe_onorio/cenas/flame_pixely.tres")
var animation_leaf = preload("res://microjogos/2024S1/projeto_felipe_onorio/cenas/leaf.tres")
#export var player_path := @""; onready var player := get_node(player_path) as Node2D

func change_next_state():
	#print("Current state from cell_0: ", state)
	state = (state + 1) % 3
	#print("State from cell_0 changed to: ", state)
	match state:
		State.FIRST:
			sprite_animation.set_sprite_frames(animation_flame_fluffy)
		State.SECOND:
			sprite_animation.set_sprite_frames(animation_watery)
		State.THIRD:
			sprite_animation.set_sprite_frames(animation_leaf)
	sprite_animation.play("default")
	
# Called when the node enters the scene tree for the first time.
func _ready():
	#right_neighbor = get_node(right_neighbor_path)
	#down_neighbor = get_node(^"../area_cell_3")
	sprite_animation = get_child(0).get_child(0)
	#sprite_animation.set_animation(animation_watery)
	#sprite_animation.set_animation("res://microjogos/2024S1/projeto_felipe_onorio/cenas/watery.tres")
	sprite_animation.set_sprite_frames(animation_watery)
	sprite_animation.play("default")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cursor_area_activate_cell():
	change_next_state()
	pass # Replace with function body.
