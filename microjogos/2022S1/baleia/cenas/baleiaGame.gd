extends Node2D

const WIDTH = 1920
const HEIGHT = 1080

const MAX_DIFF = 730

func _ready():
	$TileMap.position += Vector2(rand_range(0, 730), 0)


signal win
signal lose
