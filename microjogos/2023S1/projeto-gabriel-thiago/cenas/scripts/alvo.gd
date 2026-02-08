extends Area2D

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	var numX = rng.randf_range(630,1290)
	var numY = rng.randf_range(520,680)
	position.x = numX
	position.y = numY
