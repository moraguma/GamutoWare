extends Node2D

# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
# tela 1920x1080, que é padrão para monitores full HD. Caso você queira uma resolução menor para 
# atingir uma estética mais pixelada, você pode mudar estes números para qualquer outra resolução 
# 16:9


@onready var musica = get_node("AudioStreamPlayer")

# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------
# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	instanciar_objeto()
	musica.play()
	
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

func instanciar_objeto():
	var escolha = (randi() % 4) +1 
	print(escolha)
	var cena = load("res://microjogos/2023S1/projeto-enzo-bertoloti/cenas/mapa%d.tscn" % escolha)
#	var cena = load("res://microjogos/2023S1/projeto-enzo-bertoloti/cenas/mapa4.tscn")
	var objeto = cena.instantiate()
	add_child(objeto)

# Um método genérico. Crie quantos métodos você precisar!
func my_method():
	pass
