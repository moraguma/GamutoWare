extends Node2D

@export var mob_scene1: PackedScene
@export var mob_scene2: PackedScene

func _ready():
	$EsqueletoTimer.wait_time = 1.5
	$EsqueletoTimer.start()

	$FlechaTimer.wait_time = 1.5
	$FlechaTimer.start()
	Minigames.register_win(self)

func _on_esqueleto_timer_timeout():
	var mob = mob_scene1.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_location = $EsqueletoPath/LocalGeracaoEsqueleto
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's position to the random location.
	mob.position = mob_spawn_location.position

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)


func _on_flecha_timer_timeout():
	
	var mob = mob_scene2.instantiate()
	
	var mob_spawn_location = $FlechaPath/LocalGeracaoFlecha
	mob_spawn_location.progress_ratio = [0.0, 1.0].pick_random()
	
	mob.position = mob_spawn_location.position
	
	add_child(mob)
