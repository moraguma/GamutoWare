extends Sprite2D
var omega = 4
var tempo = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	tempo += delta
	offset.y = 20 * cos(omega*tempo)
