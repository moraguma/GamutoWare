extends Area2D

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	var numX = rng.randf_range(-330,330)
	var numY = rng.randf_range(-64,112)
	
	position.x = numX
	position.y = numY
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
