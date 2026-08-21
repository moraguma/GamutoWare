extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tempo = randf_range(0, 3)
	#$AnimationPlayer.current_animation_position = tempo
	$AnimationPlayer.play("pisca-pisca")
	$AnimationPlayer.advance(tempo)

	frame = randi()%(hframes*vframes)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
