extends Sprite2D


var velocity = Vector2(0, 0)


func _physics_process(delta):
	if Input.is_action_just_pressed("direita"):
		velocity.x = 200
	if Input.is_action_just_pressed("esquerda"):
		velocity.x = -200
	else :
		velocity.x = 0
	
	position += velocity * delta
	
