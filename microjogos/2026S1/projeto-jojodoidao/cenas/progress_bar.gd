extends ProgressBar
var subindo = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("acao"):
		if subindo:
			value += 100*delta
		else: 
			value -= 100*delta
	if value >= 100:
		subindo = false
	if value <= 0:
		subindo = true
