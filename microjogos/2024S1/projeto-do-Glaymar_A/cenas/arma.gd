extends Area2D

func _physics_process(delta):
	var inimigo_na_area =  get_overlapping_bodies()
	if inimigo_na_area.size() > 0:
		var mirar_inimigo = inimigo_na_area.front()
		look_at(mirar_inimigo.global_position)

func atirar():
	const MUNICAO = preload("res://microjogos/2024S1/projeto-do-Glaymar_A/cenas/municao.tscn")
	var nova_tiro = MUNICAO.instantiate()
	nova_tiro.global_position = %mira.global_position
	nova_tiro.global_rotation = %mira.global_rotation
	%mira.add_child(nova_tiro)


func _on_timer_timeout():
	atirar()
