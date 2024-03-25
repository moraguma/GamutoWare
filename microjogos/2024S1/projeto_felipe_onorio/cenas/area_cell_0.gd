extends Area2D

#export var right_neighbor_path: NodePath # we assign a path using inspector
#onready var right_neighbor := get_node(right_neighbor_path) as Node2D # then we get a reference

#@export var right_neighbor_path: NodePath
@export var right_neighbor: Node = null
@export var left_neighbor: Node = null
@export var up_neighbor: Node = null
@export var down_neighbor: Node = null

enum State {EMPTY, FIRST, SECOND, THIRD }

var state : State = State.EMPTY
var sprite_animation: Node2D
var animation_watery = preload(^"res://microjogos/2024S1/projeto_felipe_onorio/cenas/watery.tres")
var animation_flame_fluffy = preload(^"res://microjogos/2024S1/projeto_felipe_onorio/cenas/flame_fluffy.tres")
var animation_flame_pixely = preload(^"res://microjogos/2024S1/projeto_felipe_onorio/cenas/flame_pixely.tres")
var animation_leaf = preload(^"res://microjogos/2024S1/projeto_felipe_onorio/cenas/leaf.tres")
#export var player_path := @""; onready var player := get_node(player_path) as Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	#right_neighbor = get_node(right_neighbor_path)
	#down_neighbor = get_node(^"../area_cell_3")
	sprite_animation = get_child(0).get_child(0)
	sprite_animation.set_animation(animation_watery)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
