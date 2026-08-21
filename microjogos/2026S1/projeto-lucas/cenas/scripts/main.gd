extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var startTime: int = randi()%240
	$BackgroundMusic.play(startTime)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
