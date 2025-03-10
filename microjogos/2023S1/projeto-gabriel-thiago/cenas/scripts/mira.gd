extends Sprite2D

@export var speed = 500;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_pressed("direita"):
		position.x += 1*speed*delta
	if Input.is_action_pressed("esquerda"):
		position.x += -1*speed*delta
	if Input.is_action_pressed("cima"):
		position.y += -1*speed*delta
	if Input.is_action_pressed("baixo"):
		position.y += 1*speed*delta
		
	pass
