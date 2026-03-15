extends Node2D

# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
# tela 1920x1080, que é padrão para monitores full HD. Caso você queira uma resolução menor para 
# atingir uma estética mais pixelada, você pode mudar estes números para qualquer outra resolução 
# 16:9



const UP_POS = 854
const DOWN_POS = 1005


# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	pass
	
	randomize()
	var gone_up = false
	var gone_down = false
	var cars = $Policias.get_children()
	for car in cars:
		var r = randi() % 2 == 0
		if r:
			gone_up = true
		else:
			gone_down = true
		car.position[1] = UP_POS if r else DOWN_POS
	
	if not gone_down:
		cars[1].position[1] = DOWN_POS
	elif not gone_up:
		cars[1].position[1] = UP_POS
	
	Minigames.register_win(self)
# Called every frame. 'delta' is the elapsed time since the previous frame.


var speed = 500
func _physics_process(delta):
	var velocity =  Vector2()
	velocity = velocity.normalized()*speed*delta
	position = velocity*delta
	
# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a renderização, 
# como a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou 
# desde a última chamada desta função. O comando pass não faz nada

# --------------------------------------------------------------------------------------------------
# SUAS FUNÇÕES
# --------------------------------------------------------------------------------------------------


# Um método genérico. Crie quantos métodos você precisar!
func my_method():
	pass

func _on_carro_principal_lose():
	Minigames.register_lose(self)
	$Background.paused = true
	$Policias.is_lose = true
