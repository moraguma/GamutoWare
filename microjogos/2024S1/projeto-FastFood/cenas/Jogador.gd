extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Input.is_action_pressed("ui_left"):
		$jogador.flip_h = true
		
	if Input.is_action_pressed("ui_right"):
		$jogador.flip_h = false
		
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
