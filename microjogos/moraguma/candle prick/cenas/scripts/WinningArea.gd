extends Node2D


const CANDLE_TOLERANCE = 4
const ARROW_DISTANCE = 16
const RADIUS = 4
const FREQUENCY = 8


var is_horizontal = true
var time_elapsed = 0
var active = true


onready var parent = get_parent()
onready var candle = parent.get_node("Candle")

onready var arrow_1 = $Arrow1
onready var arrow_2 = $Arrow2


func _physics_process(delta):
	if active:
		if candle.position.distance_to(position) < CANDLE_TOLERANCE:
			active = false
			
			parent.win()
			candle.win()


func _process(delta):
	time_elapsed += delta
	
	if is_horizontal:
		arrow_1.position = Vector2(-1, 0) * (ARROW_DISTANCE + RADIUS * sin(FREQUENCY * time_elapsed))
		arrow_1.rotation = PI / 2
		
		arrow_2.position = Vector2(1, 0) * (ARROW_DISTANCE + RADIUS * sin(FREQUENCY * time_elapsed))
		arrow_2.rotation = 3 * PI / 2
	else:
		arrow_1.position = Vector2(0, 1) * (ARROW_DISTANCE + RADIUS * sin(FREQUENCY * time_elapsed))
		arrow_1.rotation = 0
		
		arrow_2.position = Vector2(0, -1) * (ARROW_DISTANCE + RADIUS * sin(FREQUENCY * time_elapsed))
		arrow_2.rotation = PI
