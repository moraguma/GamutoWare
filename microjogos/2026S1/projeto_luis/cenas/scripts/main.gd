extends Node2D

var idx = randi_range(0,4)

var passaros = ["Passaros/Passaro1",
				"Passaros/Passaro2",
				"Passaros/Passaro3",
				"Passaros/Passaro4",
				"Passaros/Passaro5"]
				
var paths = ["res://microjogos/2026S1/projeto_luis/recursos/imagens/Passaro1.png",
			 "res://microjogos/2026S1/projeto_luis/recursos/imagens/Passaro2.png",
			 "res://microjogos/2026S1/projeto_luis/recursos/imagens/Passaro3.png",
			 "res://microjogos/2026S1/projeto_luis/recursos/imagens/Passaro4.png",
			 "res://microjogos/2026S1/projeto_luis/recursos/imagens/Passaro5.png"]

var passaro = passaros[idx]
var path = paths[idx]
var jogo = true
				
# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------
func _ready():
	$Guia/Sombra.texture= load(path)

func _process(_delta):
	
	if Input.is_action_pressed("acao"):
		var foto = get_node(passaro).has_overlapping_areas()
		var foco = $Camera/Slider.has_overlapping_areas()
		if foto == true and foco == true:
			$SomCamera.play(0.75)
			$Camera/Fade.play("fade")	
			Minigames.register_win(self) 
			jogo = false
			
# --------------------------------------------------------------------------------------------------
# SUAS FUNÇÕES
# --------------------------------------------------------------------------------------------------

# Um método genérico. Crie quantos métodos você precisar!
func my_method():
	pass
