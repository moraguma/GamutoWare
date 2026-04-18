extends Sprite2D

func add_potion(potion:String):
	match potion:
		"Roxo": modulate = modulate.lerp(Color.from_rgba8(125, 70, 200), 0.5)
		"Rosa": modulate = modulate.lerp(Color.from_rgba8(250, 100, 190), 0.5)
		"Verde": modulate = modulate.lerp(Color.from_rgba8(130, 180, 70), 0.5)
		"Amarelo": modulate = modulate.lerp(Color.from_rgba8(250, 150, 50), 0.5)
