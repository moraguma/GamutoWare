extends Area2D

# Variáveis para controlar a velocidade e a amplitude do movimento
var min_speed = 0.5
var max_speed = 7.0
var min_amplitude = 30.0
var max_amplitude = 100.0
var speed = 0.0
var amplitude = 0.0
var time_passed = 0.0

func _ready():
	# Define a posição inicial
	position.y = 0
	# Inicializa a amplitude e velocidade aleatórias
	randomize_parameters()
	# Inicia o temporizador para atualizar os parâmetros
	$Timer.start(1.0)

func _process(delta):
	# Atualiza o tempo decorrido
	time_passed += delta

	# Movendo a barra usando a função seno
	position.y = amplitude * sin(time_passed * speed)

func _on_Timer_timeout():
	# Atualiza os parâmetros aleatórios
	randomize_parameters()
	print("Speed:", speed, "Amplitude:", amplitude)
	# Reinicia o temporizador para o próximo intervalo de atualização
	$Timer.start(1.0)

func randomize_parameters():
	# Atualiza a amplitude e velocidade aleatórias
	amplitude = randf_range(min_amplitude, max_amplitude)
	speed = randf_range(min_speed, max_speed)
