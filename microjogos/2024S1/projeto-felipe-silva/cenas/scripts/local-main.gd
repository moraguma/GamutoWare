extends Node2D

const NUM_ANONS = 25
const anon_scene = preload("res://microjogos/2024S1/projeto-felipe-silva/cenas/anon.tscn")

func _ready():
	for _n in range(0, NUM_ANONS):
		var c_scene = anon_scene.instantiate()
		c_scene.position.x = randi_range(-400, 800)
		c_scene.position.y = randi_range(-1200, -300)
		add_child(c_scene)
