extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("win");
	custom_integrator = true;
	$AnimatedSprite2D.play("default")
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_pressed("direita") :
		linear_velocity.x = 10
		
		
	elif Input.is_action_pressed("esquerda") :
		linear_velocity.x = -10
		
	else:
		linear_velocity.x = 0
	move_and_collide(linear_velocity)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

	

