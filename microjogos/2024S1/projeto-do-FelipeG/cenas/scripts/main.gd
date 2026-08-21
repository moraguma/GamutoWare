extends Node2D

@export var speed_multiplier: float = 3.0
var sorvetes_capturados: int = 0
@export var sorvetes_para_vitoria: int = 4
var won: bool = false

func _on_sorvete_capturado():
	sorvetes_capturados += 1
	if(!won):
		if(sorvetes_capturados >= sorvetes_para_vitoria):
			won = true
			Minigames.register_win(self)
