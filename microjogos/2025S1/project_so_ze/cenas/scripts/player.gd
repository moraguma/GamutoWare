extends Node2D

var timer

var head = false
var larm = false
var rarm = false
var legs = false

var randomized_member = [0,1,2,3]

var randomized_index = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomized_member.shuffle()
	timer = get_node("Timer")
	timer.start(6)
	

func _process(delta: float) -> void:
	
