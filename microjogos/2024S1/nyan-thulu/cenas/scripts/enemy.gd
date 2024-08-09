extends CharacterBody2D


const V_SPEED = 600.0
const H_SPEED = 800.0 
@export var direction = Vector2(0,1)

func _physics_process(delta):
	# Add the gravity.
	var player = self.get_parent().get_node("Player")
	direction = self.global_position.direction_to(player.global_position)
	velocity =  (H_SPEED if direction[0] != 0 else V_SPEED) * direction 
	move_and_slide()
