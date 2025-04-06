extends Node2D
# thorn https://opengameart.org/content/vine-with-thorns
# teleporter https://opengameart.org/content/teleporter-circle

@export var obstacle_scene: PackedScene
@export var player_scene: PackedScene
@export var goal_scene: PackedScene

# Declaração dos sinais win e lose

signal win
signal lose

# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
# tela 1920x1080, que é padrão para monitores full HD. Caso você queira uma resolução menor para 
# atingir uma estética mais pixelada, você pode mudar estes números para qualquer outra resolução 
# 16:9
const WIDTH = 1920
const HEIGHT = 1080

# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("REACH THE TELEPORTER!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("FAÇA ALGO!")
	
	var spawn_areas_config = pick_random_spawn_config()
	create_something(obstacle_scene, 100, spawn_areas_config["obstacles_spawn_area"], [spawn_areas_config["player_spawn_area"], spawn_areas_config["treasure_spawn_area"]])
	create_something(player_scene, 4, spawn_areas_config["player_spawn_area"], [])
	var goal_scenes = create_something(goal_scene, 1, spawn_areas_config["treasure_spawn_area"], [], false)
	for goal_scene in goal_scenes:
		goal_scene.connect("body_entered", _on_goal_body_entered)


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

func pick_random_spawn_config():
	var areas = {
		"config1": {
			"player_spawn_area": {
				"x_start": 400,
				"y_start": 400,
				"x_end": 600,
				"y_end": 600
			},
			"obstacles_spawn_area": {
				"x_start": 0,
				"y_start": 0,
				"x_end": WIDTH,
				"y_end": HEIGHT
			},
			"treasure_spawn_area": {
				"x_start": 800,
				"y_start": 400,
				"x_end": 1000,
				"y_end": 600
			}
		}
	}
	return areas["config1"]

func create_player():
	var player_instance = player_scene.instantiate()
	
func generate_coordenates(dict):
	var x_start = dict["x_start"]
	var y_start = dict["y_start"]
	var x_end = dict["x_end"]
	var y_end = dict["y_end"]
	var max_width = x_end - x_start
	var max_height = y_end - y_start
	return {"x": x_start + randf() * max_width, "y": y_start + randf() * max_height}
	
func if_boxes_contain_coordenates(box_dicts, coordenates):
	for box_dict in box_dicts:
		var box_x_start = box_dict["x_start"]
		var box_y_start = box_dict["y_start"]
		var box_x_end = box_dict["x_end"]
		var box_y_end = box_dict["y_end"]
		var coord_x = coordenates["x"]
		var coord_y = coordenates["y"]
		if coord_x > box_x_start and coord_x < box_x_end and coord_y > box_y_start and coord_y < box_y_end:
			return true
	return false

func create_something(scene, num, spawn_dict, no_spawn_dicts_list, random_rotation=true):
	var instances = []
	for instance_id in num:
		var object_instance = scene.instantiate()
		var spawn_coordinates = generate_coordenates(spawn_dict)
		while if_boxes_contain_coordenates(no_spawn_dicts_list, spawn_coordinates):
			spawn_coordinates = generate_coordenates(spawn_dict)
		object_instance.position = Vector2(spawn_coordinates["x"], spawn_coordinates["y"])
		if random_rotation:
			object_instance.rotation = randf()
		add_child(object_instance)
		instances.append(object_instance)
	return instances

func create_obstacles(num=5):
	for instance_id in num:
		var obstacle_instance = obstacle_scene.instantiate()
		obstacle_instance.position = Vector2(randf()*WIDTH, randf()*HEIGHT)
		obstacle_instance.rotation = randf()
		add_child(obstacle_instance)


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


func _on_goal_body_entered(body: Node2D) -> void:
	print("YOU WIN!!!")
	register_win()
