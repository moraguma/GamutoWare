extends Node2D

# Declaração dos sinais win e lose

signal win
signal lose

# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
# tela 1920x1080, que é padrão para monitores full HD. Caso você queira uma resolução menor para 
# atingir uma estética mais pixelada, você pode mudar estes números para qualquer outra resolução 
# 16:9
const WIDTH = 1920
const HEIGHT = 1080

@onready var pocao1r_instance = preload ("res://microjogos/2025S1/seu_projeto/cenas/Pocao1r.tscn").instantiate()
@onready var pocao2r_instance = preload ("res://microjogos/2025S1/seu_projeto/cenas/Pocao2r.tscn").instantiate()
@onready var pocao3r_instance = preload ("res://microjogos/2025S1/seu_projeto/cenas/Pocao3r.tscn").instantiate()
@onready var pocao4r_instance = preload ("res://microjogos/2025S1/seu_projeto/cenas/Pocao4r.tscn").instantiate()

# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------
var receita = range(1,5)

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("DO SOMETHING!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("FAÇA A RECEITA!")

	receita.shuffle()
	receita = receita.slice(0,3)
	print(receita)
	for pocao in receita: 
		match pocao: 
			1: %Receita.add_child(pocao1r_instance)
			2: %Receita.add_child(pocao2r_instance)
			3: %Receita.add_child(pocao3r_instance)
			4: %Receita.add_child(pocao4r_instance)
			
func posicionar_receita():
	var receita_container = $Receita
	var largura_tela = get_viewport().get_visible_rect().size.x
	var largura_container = receita_container.rect_size.x
	var posicao_x = (largura_tela - largura_container) / 2
	
	#receita_container.rect_position = Vector2 (posicao_x, 0)
	#receita_container.separation = 20
			
# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a física, como
# a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou desde
# a última chamada desta função. O comando pass não faz nada
func _physics_process(delta):
	pass


# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a renderização, 
# como a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou 
# desde a última chamada desta função. O comando pass não faz nada
func _process(delta):
	pass


# --------------------------------------------------------------------------------------------------
# SUAS FUNÇÕES
# --------------------------------------------------------------------------------------------------


# Um método genérico. Crie quantos métodos você precisar!
func my_method():
	pass


# --------------------------------------------------------------------------------------------------
# CONDIÇÕES DE VITÓRIA
# --------------------------------------------------------------------------------------------------
# Quando o jogo começa, ela assume que o jogador não conseguiu vencer o jogo ainda, ou seja, se não
# acontecer nada, o jogador vai perder o jogo. A verificação se o jogador venceu o minigame é feita
# com base na emissão dos sinais "win" e "lose". Se "win" foi o último sinal emitido, o jogador
# vencerá o jogo, e se "lose" foi o último sinal emitido ou nenhum sinal foi emitido, o jogador
# perderá o jogo


# Chame esta função para registrar que o jogador venceu o jogo
func register_win():
	emit_signal("win")


# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	emit_signal("lose")


func _on_node_2d_atual_changing(id: Variant) -> void:
	if len(receita)>0:
		if receita[0] == id: 
			print("Correto!")
			receita.remove_at(0)
			if len(receita)==0:
				register_win()
				print("Vitória!")
				$ganhou.play()
			else:
				$feitico.play()
		else: 
			$perdeu.play()
			$Perdeu.show()
			print("Incorreto")
			register_lose()
