extends CharacterBody2D


const SPEED = 900.0 
@export var direction = Vector2(0,1)

func _physics_process(delta):
	# Add the gravity.
	var player = self.get_parent().get_node("../Player")
	direction = self.global_position.direction_to(player.global_position)
	velocity =  SPEED * direction 
	move_and_slide()




