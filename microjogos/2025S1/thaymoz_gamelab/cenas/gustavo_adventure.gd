#extends Node2D
#
#var quantidades = 0
#var clicados = 0
#
#func _ready() -> void:
	#var numeros = randi_range(3, 7)
	#quantidades = numeros
	##print(quantidades)
	 #
	#
#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("acao"):
		#clicados += 1
		#if clicados == quantidades:
##			vc ganhou
			#pass
		#elif clicados > quantidades:
##			explodiu
			#pass
		#elif clicados < quantidades:
##			murchou
			#pass
