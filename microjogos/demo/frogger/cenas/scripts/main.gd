extends Node2D


const Car = preload("res://microjogos/demo/frogger/cenas/Car.tscn")


const TURNS_PER_SPAWN = 3


signal win
signal lose


const WIDTH = 256
const HEIGHT = 144


const STEP_SIZE = 16


var turns = 0


@onready var car_container = $CarContainer
@onready var frog = $Frog


func _ready():
	
	# Popula a rua com carros igualmente espaçados
	var x_pos = -STEP_SIZE / 2
	while x_pos < WIDTH:
		spawn_car_y(x_pos)
		x_pos += TURNS_PER_SPAWN * STEP_SIZE
	
	# Aleatoriza a posição do sapo. Mesmo conceito da aleatorização de posição em spawn_car_y
	frog.position = Vector2(STEP_SIZE * 1.5 + STEP_SIZE * (randi() % ((WIDTH - 3 * STEP_SIZE) / STEP_SIZE)), HEIGHT - STEP_SIZE / 2)


# Chamado a cada passo do sapo
func step():
	# Chama a função de movimento de todos os carros
	for car in car_container.get_children():
		car.step()
	
	# Passa o turno. Se passarem turnos o bastante, cria um novo carro
	turns += 1
	if turns >= TURNS_PER_SPAWN:
		turns = 0
		
		spawn_car()


# Cria um carro no começo da pista
func spawn_car():
	spawn_car_y(-STEP_SIZE / 2)


# Dada uma posição x, cria um carro numa posição válida aleatória
func spawn_car_y(x_pos):
	var new_car = Car.instantiate()
	
	# Seleciona a posição y do carros aleatoriamente. STEP_SIZE * 1.5 é a primeira posição válida, que é somada a 16 multiplicado por um inteiro entre 0 e o valor máximo tal que a posição continua válida
	new_car.position = Vector2(x_pos, STEP_SIZE * 1.5 + STEP_SIZE * (randi() % ((HEIGHT - 3 * STEP_SIZE) / STEP_SIZE)))
	
	car_container.add_child(new_car)


func register_win():
	emit_signal("win")


func register_lose():
	emit_signal("lose")
