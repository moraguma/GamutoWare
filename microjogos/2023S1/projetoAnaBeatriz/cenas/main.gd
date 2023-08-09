extends Node2D

const MIN_X = 300.0
const MAX_X = 1620.0
const START_Y = 200
const SEPARACAO = 300


var timer


@onready var inimigos = [$Inimigo, $Inimigo2, $Inimigo3, $"Nave maior"]


func _ready():
	timer = get_node("Timer")
	timer.start(6)
	
	var y = START_Y
	for inimigo in inimigos:
		inimigo.position = Vector2(randf_range(MIN_X, MAX_X), y)
		y -= SEPARACAO


func _on_timer_timeout():
	get_tree().quit()
