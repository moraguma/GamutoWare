extends "res://principal/cenas/scripts/ToTitle.gd"


const LERP_WEIGHT = 0.1


var aim_pos = Vector2(0, 0)


func _process(delta):
	position = position.linear_interpolate(aim_pos, LERP_WEIGHT)
