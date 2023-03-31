extends RayCast2D


const RAYCAST_LENGHT = 500
const TIME = 1

@onready var indicator = $Indicator
@onready var animation_player = $AnimationPlayer


func aim(dir):
	target_position = dir * RAYCAST_LENGHT
	
	indicator.add_point(Vector2(0, 0))
	indicator.add_point(target_position)
	
	animation_player.play("shot")


func shoot():
	if is_colliding():
		var collider = get_collider()
		if collider.get_collision_layer_value(1):
			collider.die()
