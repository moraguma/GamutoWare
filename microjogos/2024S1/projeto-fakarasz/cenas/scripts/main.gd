extends Node2D

# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
# tela 1920x1080, que é padrão para monitores full HD. Caso você queira uma resolução menor para 
# atingir uma estética mais pixelada, você pode mudar estes números para qualquer outra resolução 
# 16:9


const AMPLITUDE = 112
const CENTER = 113


# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	
	$Gamutos.position[0] = CENTER + randf_range(-AMPLITUDE, AMPLITUDE)


# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a física, como
# a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou desde
# a última chamada desta função. O comando pass não faz nada
func _physics_process(delta):
	if Input.is_action_just_pressed("acao"):
		var direction=Vector2(1,0).rotated(get_node("Seta").rotation)
		get_node("Bola").linear_velocity = -direction * 1000
		get_node("Seta").visible=false

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

func _on_Gamutos_area_entered(area):
	area.queue_free()
	Minigames.register_lose(self)

	
func _on_Gol_area_entered(area):
	area.queue_free()
	Minigames.register_win(self)


