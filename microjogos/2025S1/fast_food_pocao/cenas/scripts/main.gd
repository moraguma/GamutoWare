extends Control




@export var roxo : CompressedTexture2D
@export var rosa : CompressedTexture2D
@export var verde : CompressedTexture2D
@export var amarelo : CompressedTexture2D

# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------
var receita = ["Roxo", "Rosa", "Verde", "Amarelo"]

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	var roxo_button = $MarginContainer/Roxo
	var rosa_button = $MarginContainer/Rosa
	var verde_button = $MarginContainer/Verde
	var amarelo_button = $MarginContainer/Amarelo
	
	roxo_button.pressed.connect(escolher_pocao.bind(roxo_button))
	rosa_button.pressed.connect(escolher_pocao.bind(rosa_button))
	verde_button.pressed.connect(escolher_pocao.bind(verde_button))
	amarelo_button.pressed.connect(escolher_pocao.bind(amarelo_button))
	$MarginContainer/Roxo.grab_focus()

	receita.shuffle()
	receita = receita.slice(0,3)
	for pocao in receita: 
		var texture_rect = TextureRect.new()
		match pocao: 
			"Roxo": texture_rect.texture = roxo
			"Rosa": texture_rect.texture = rosa
			"Verde": texture_rect.texture = verde
			"Amarelo": texture_rect.texture = amarelo
		%Receita.add_child(texture_rect)


# Chame esta função para registrar que o jogador venceu o jogo
func register_win():
	Minigames.register_win(self)


# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	Minigames.register_lose(self)
	

func escolher_pocao(id: Variant) -> void:
	if len(receita)>0:
		if receita[0] == id.name: 
			receita.remove_at(0)
			if len(receita)==0:
				register_win()
				$ganhou.play()
				$Ganhou.show()
			else:
				$feitico.play()
		else: 
			$perdeu.play()
			$Perdeu.show()
			register_lose()
			receita = []
		$PotionMix.add_potion(id.name)
