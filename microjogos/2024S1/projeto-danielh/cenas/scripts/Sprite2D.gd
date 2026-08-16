extends AnimatedSprite2D

@onready var _animated_sprite = $Gamuto

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_animated_sprite.play("gamuto")
