extends Node2D

const MAX_DIFF = 730

func _ready():
	$Tilemap.position += Vector2(randf_range(0, 730), 0)
	
