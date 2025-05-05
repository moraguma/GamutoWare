extends CharacterBody2D


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	velocity.y += (gravity * delta) 
	move_and_slide()

func _on_area_2d_area_entered(area):
	if area.is_in_group("player"):
		queue_free()

	
