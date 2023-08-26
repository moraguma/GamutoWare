extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("acao"):
					rotation_degrees += 90
					if rotation_degrees > 180:  
						rotation_degrees -= 180
	pass
