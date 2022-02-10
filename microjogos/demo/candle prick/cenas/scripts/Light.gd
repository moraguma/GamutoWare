extends Node2D


const BIG_ROT_SPEED = 0.5
const SMALL_ROT_SPEED = 1
const ACCELERATION = 0.3


var target = null
var extra = Vector2(0, 0)


onready var small_light = $SmallLight
onready var big_light = $BigLight


func _physics_process(delta):
	position = position.linear_interpolate(target.get_global_position() + extra, ACCELERATION)
	
	small_light.rotate(SMALL_ROT_SPEED * delta)
	big_light.rotate(BIG_ROT_SPEED * delta)
