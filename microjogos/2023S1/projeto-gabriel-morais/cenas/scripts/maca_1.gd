extends Area2D

var speed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = randf_range(150,1000)
	position.x = randf_range(1250, 1920)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
