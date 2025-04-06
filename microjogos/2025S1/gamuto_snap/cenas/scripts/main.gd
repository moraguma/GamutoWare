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

@onready var gamuto1 : Area2D = $gamutinhos/gamuto1
@onready var gamuto2 : Area2D = $gamutinhos/gamuto2
@onready var gamuto3 : Area2D = $gamutinhos/gamuto3
@onready var gamuto4 : Area2D = $gamutinhos/gamuto4
@onready var gamuto5 : Area2D = $gamutinhos/gamuto5

var snapped_gamutos : int = 0

# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("SNAP SOME PICS!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("TIRE UMAS FOTOS!")
	
	# Chama a função para escolher os 2 pontos de spawn
	get_spawn_points()

# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a física, como
# a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou desde
# a última chamada desta função. O comando pass não faz nada
func _physics_process(_delta):
	pass

# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a renderização, 
# como a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou 
# desde a última chamada desta função. O comando pass não faz nada
func _process(_delta):
	pass

# --------------------------------------------------------------------------------------------------
# SUAS FUNÇÕES
# --------------------------------------------------------------------------------------------------

# Função para selecionar aleatoriamente duas posições de spawn entre as 5 possíveis
func get_spawn_points():
	var spawns : Array = $spawnPoints.get_children()
	
	# Loop para rodas 2 vezes
	for i : int in range(2):
		var selected_spawn_index : int = randi() % spawns.size()
		var selected_spawn : Marker2D = spawns[selected_spawn_index]
		
		match selected_spawn.position:
			gamuto1.position:
				print("SPAWN 1 SELECTED!")
			gamuto2.position:
				print("SPAWN 2 SELECTED!")
			gamuto3.position:
				print("SPAWN 3 SELECTED!")
			gamuto4.position:
				print("SPAWN 4 SELECTED!")
			gamuto5.position:
				print("SPAWN 5 SELECTED!")
				
		# Remove a posição já escolhida para não ter repetição
		spawns.remove_at(selected_spawn_index)
	
	# Chama a função para deletar os Gamutos que não foram escolhidos
	remove_others(spawns)

# Função que deleta os Gamutos que não foram aleatoriamente escolhidos no começo 
func remove_others(spawns : Array):
	# Percorre o array com os markers restantes	
	for marker : Marker2D in spawns:
		match marker.position:
			gamuto1.position:
				gamuto1.queue_free()
			gamuto2.position:
				gamuto2.queue_free()
			gamuto3.position:
				gamuto3.queue_free()
			gamuto4.position:
				gamuto4.queue_free()
			gamuto5.position:
				gamuto5.queue_free()

# Função que registra quando algum dos Gamutos foram fotografados e checa a condição de vitória
func _on_gamutinhos_any_was_snapped() -> void:
	snapped_gamutos += 1
	
	if snapped_gamutos == 2:
		print("YOU WIN!")
		register_win()

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
