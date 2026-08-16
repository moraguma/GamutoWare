extends Node2D

const UP_POS = 854
const DOWN_POS = 1005


# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
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


var speed = 500
func _physics_process(delta):
	var velocity =  Vector2()
	velocity = velocity.normalized()*speed*delta
	position = velocity*delta


func _on_carro_principal_lose():
	Minigames.register_lose(self)
	$Background.paused = true
	$Policias.is_lose = true
