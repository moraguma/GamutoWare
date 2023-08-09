extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(velocity):
	if Input.is_action_pressed("direita"):
		velocity.x = 100
	elif Input.is_action_pressed("esquerda"):
		velocity.x = -100
	else:
		velocity.x = 0
		velocity.y = 0
	
