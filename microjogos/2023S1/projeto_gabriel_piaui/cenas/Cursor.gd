extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("direita"):
		position += Vector2(200,0)
	if Input.is_action_just_pressed("esquerda"):
		position += Vector2(-200,0)
	if Input.is_action_just_pressed("baixo"):
		position += Vector2(0,200)
	if Input.is_action_just_pressed("cima"):
		position += Vector2(0,-200)
	pass


