extends Node2D


const RADIUS = 10
const FREQUENCY = 3


var base_pos
var time = 0


func _ready():
	base_pos = position


func _process(delta):
	time += delta
	position = base_pos + Vector2(0, RADIUS * sin(2 * FREQUENCY * time))
