extends CharacterBody2D

@onready var player = get_node("/root/Main/Player")
	
	
func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 150.0
	move_and_slide()
	



func _on_collision_shape_2d_child_order_changed():
	emit_signal("lose")
