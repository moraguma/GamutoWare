extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	play("rotation")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event.is_action_pressed("acao"):
		pause()
