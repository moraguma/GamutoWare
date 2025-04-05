extends Node2D


signal win
signal lose


const HEIGHT = 180
const WIDTH = 320





const LINE_POINTS = [Vector2(-4, -4), Vector2(324, -4), Vector2(324, 184), Vector2(-4, 184), Vector2(-4, -3)]
const FIRST_TIME = 1
const SPAWN_TIME = 0.389
const MAX_SPREAD = PI/3


@onready var spawn_pos = $SpawnPos.curve
@onready var timer = $Timer
@onready var music = $Music


func _ready():
	
	music.play()
	
	call_deferred("emit_signal", "win")
	
	randomize()
	
	for point in LINE_POINTS:
		spawn_pos.add_point(point)
	
	timer.start(FIRST_TIME)

var Shot = preload("res://microjogos/moraguma/deerskull/cenas/Shot.tscn")

func spawn():
	var shot = Shot.instantiate()
	shot.position = spawn_pos.sample_baked(randf() * spawn_pos.get_baked_length())
	add_child(shot)
	shot.call_deferred("aim", (Vector2(160, 90) - shot.position).rotated(randf_range(-1, 1) * MAX_SPREAD).normalized())
	
	timer.start(SPAWN_TIME)


func register_lose():
	timer.stop()
	
	emit_signal("lose")
