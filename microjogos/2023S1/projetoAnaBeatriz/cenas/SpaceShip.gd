extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
func _physics_process(delta):
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta
	if Input.action_press("direita"):
		velocity.x = 200
	if Input.action_press("esquerda"):
		velocity.x = -200
	else :
		velocity.x = 0
	
