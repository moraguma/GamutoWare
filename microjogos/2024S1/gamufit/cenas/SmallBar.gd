extends Area2D
signal gamuto_collided
signal gamuto_not_collided

# Variáveis para controlar a velocidade e a amplitude do movimento
var min_speed = 0.5
var max_speed = 5.0
var min_amplitude = 30.0
var max_amplitude = 250.0
var speed = 0.0
var amplitude = 0.0
var time_passed = 0.0
var update_interval = 5.0 # Intervalo de tempo para atualizar os parâmetros (em segundos)
var time_since_last_update = 0.0
var current_position = Vector2.ZERO
var target_speed = 0.0
var target_amplitude = 0.0
var first_update = true

func _ready():
	# Define a posição inicial
	position.y = 0
	current_position = position
	# Inicializa a amplitude e velocidade aleatórias
	randomize_parameters()
	speed = target_speed
	amplitude = target_amplitude

func _process(delta):
	# Atualiza o tempo decorrido
	time_passed += delta
	time_since_last_update += delta

	# Verifica se é hora de atualizar os parâmetros
	if time_since_last_update >= update_interval:
		randomize_target_parameters()
		time_since_last_update = 0.0
		print("Target Speed:", target_speed, "Target Amplitude:", target_amplitude)

	# Interpola gradualmente para os novos parâmetros, exceto na primeira execução
	if first_update:
		first_update = false
	else:
		speed = lerp(speed, target_speed, 0.1 * delta)
		amplitude = lerp(amplitude, target_amplitude, 0.1 * delta)

	# Movendo a barra usando a função seno
	position = current_position + amplitude * sin(time_passed * speed) * Vector2.UP

func randomize_parameters():
	# Atualiza a amplitude e velocidade aleatórias
	target_amplitude = randf_range(min_amplitude, max_amplitude)
	target_speed = randf_range(min_speed, max_speed)

func randomize_target_parameters():
	# Atualiza os alvos para a próxima mudança gradativa
	randomize_parameters()

	####AQUI ESTÁ O CÓDIGO DE COLISÃO DO "Gamuto(icon)" e a "SmallBar"####
	
# Função chamada quando um corpo entra na área de colisão
func _on_body_entered(body):
	# Verifica se o corpo é o Gamuto(icon)
	if body.name == "Gamuto(icon)":
		print("Gamuto collided with SmallBar")
		emit_signal("gamuto_collided")

# Função chamada quando um corpo sai da área de colisão
func _on_body_exited(body):
	# Verifica se o corpo é o Gamuto(icon)
	if body.name == "Gamuto(icon)":
		print("Gamuto exited from SmallBar")
		emit_signal("gamuto_not_collided")
