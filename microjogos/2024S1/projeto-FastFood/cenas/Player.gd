extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	rotation_degrees = 90
	var rotacao = 0 
	pass # Replace with function body.
	
var rotacao = 0 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_left"):
		# flip_h = true
		rotation_degrees = 180
		var rotacao = 180
	if Input.is_action_pressed("ui_right"):
		# flip_h = false
		rotation_degrees = 0
		var rotacao = 0 
	if Input.is_action_pressed("ui_up"):
		rotation_degrees = 270
		var rotacao = 270
	if Input.is_action_pressed("ui_down"):
		rotation_degrees = 90
		var rotacao = 90
	
	pass
