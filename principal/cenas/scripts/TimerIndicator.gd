extends Node2D


const DEACTIVATED_POSITION = Vector2(0, 0)
const ACTIVATED_POSITION = Vector2(0, -207)
const ACCELERATION = 0.3


var aim_pos = DEACTIVATED_POSITION
var active = false


onready var main = get_parent()
onready var timer = main.get_node("Timer")
onready var bar = $TimerProgressBar


func _process(delta):
	if active:
		bar.value = timer.time_left / main.MICROGAME_TIME
	else:
		bar.value = 0
	
	position = lerp(position, aim_pos, ACCELERATION)


func activate():
	active = true
	aim_pos = ACTIVATED_POSITION


func deactivate():
	active = false
	aim_pos = DEACTIVATED_POSITION
