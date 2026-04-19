extends Area2D

var SPEED = 180.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += delta*SPEED
	if position.y >= 850:
		SPEED = SPEED*-1
	pass
