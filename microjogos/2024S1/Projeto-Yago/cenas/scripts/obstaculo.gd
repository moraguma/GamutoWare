extends CharacterBody2D

@onready var _follow :PathFollow2D = get_parent()
var _speed :float = 1000.0

func _physics_process(delta):
	_follow.set_progress(_follow.get_progress() + _speed * delta)
