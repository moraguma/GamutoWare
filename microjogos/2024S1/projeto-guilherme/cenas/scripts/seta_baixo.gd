extends Node2D

var _scale = Vector2(1,1)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("baixo"):
		_scale = Vector2(1.25, 1.25)
		set_scale(_scale)
		await get_tree().create_timer(0.1).timeout
		_scale = Vector2(1, 1)
		set_scale(_scale)
	
	pass
