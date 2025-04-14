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
	
	var config = pick_random_spawn_config()
	var player_spawn_areas = config["player_spawn_areas"]
	var obstacles_spawn_restrictions = []
	obstacles_spawn_restrictions.append_array(player_spawn_areas)
	obstacles_spawn_restrictions.append(config["treasure_spawn_area"])
	obstacles_spawn_restrictions.append_array(config["paths"])
	create_something(obstacle_scene, 500, config["obstacles_spawn_area"], obstacles_spawn_restrictions, -1)
	
	for player_spawn_area in player_spawn_areas:
		create_something(player_scene, 1, player_spawn_area, [], PI/2)
	
	var goal_scenes = create_something(goal_scene, 1, config["treasure_spawn_area"], [])
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
			"player_spawn_areas": [Rect2(100,100,2,2), Rect2(125,175,2,2), Rect2(195,115,2,2)],
			"obstacles_spawn_area": Rect2(0,0,WIDTH,HEIGHT),
			"treasure_spawn_area": Rect2(150,750,2,2),
			"paths": [Rect2(50,50,1200,300), Rect2(1050,50,200,600), Rect2(50,650,1200,400)]
		}
	}
	return areas["config1"]
	
func if_coordenates_are_restricted(point, rects):
	for rect in rects:
		if rect.has_point(point):
			return true
	return false

func create_something(scene, num, spawn_rect: Rect2, spawn_restrictions, rotation=null):
	var instances = []
	for instance_id in num:
		var object_instance = scene.instantiate()
		var random_x = randi_range(spawn_rect.position.x,spawn_rect.end.x)
		var random_y = randi_range(spawn_rect.position.y,spawn_rect.end.y)
		var spawn_point := Vector2(random_x,random_y)
		while if_coordenates_are_restricted(spawn_point, spawn_restrictions):
			random_x = randi_range(spawn_rect.position.x,spawn_rect.end.x)
			random_y = randi_range(spawn_rect.position.y,spawn_rect.end.y)
			spawn_point = Vector2(random_x,random_y)
		
		object_instance.position = spawn_point
		if rotation:
			if rotation == -1:
				object_instance.rotation = randf()
			else:
				object_instance.rotation = rotation
		
		add_child(object_instance)
		instances.append(object_instance)
	return instances


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
	register_win()
