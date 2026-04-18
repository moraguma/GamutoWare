extends Node2D

var fruit_scene = preload("res://microjogos/2023S1/projeto-viniwaki/cenas/fruit.tscn")
var slice_queues = {
	1: [],
	2: [],
	3: [],
	4: [],
}

# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
# tela 1920x1080, que é padrão para monitores full HD. Caso você queira uma resolução menor para 
# atingir uma estética mais pixelada, você pode mudar estes números para qualquer outra resolução 
# 16:9




# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	Minigames.register_win(self)
	


# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a física, como
# a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou desde
# a última chamada desta função. O comando pass não faz nada
func _physics_process(_delta):
	pass


# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a renderização, 
# como a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou 
# desde a última chamada desta função. O comando pass não faz nada
func _process(_delta):
	if Input.is_action_just_pressed("cima"):
		if slice_queues[1].size() != 0:
			successful_cut(1)
	
	if Input.is_action_just_pressed("direita"):
		if slice_queues[2].size() != 0:
			successful_cut(2)
	
	if Input.is_action_just_pressed("baixo"):
		if slice_queues[3].size() != 0:
			successful_cut(3)
	
	if Input.is_action_just_pressed("esquerda"):
		if slice_queues[4].size() != 0:
			successful_cut(4)
	


# --------------------------------------------------------------------------------------------------
# SUAS FUNÇÕES
# --------------------------------------------------------------------------------------------------


# Um método genérico. Crie quantos métodos você precisar!
func successful_cut(dir: int):
		var f = slice_queues[dir].pop_front()
		f.set_cut()
		$slice.position = f.position
		$slice.animate_once(dir)
		$audio_slice.play()
		$score_count.text = str(int($score_count.text) + 1)

func remove_from_slice_queue(d, fruit):
	slice_queues[d].erase(fruit)
	$audio_lose.play()
	Minigames.register_lose(self)
	
func throw_fruit():
	var new_fruit = fruit_scene.instantiate()
	var dir = randi_range(1,4)
	new_fruit.set_dir(dir)
	
	var fruit_spawn_loc = $Path2D/PathFollow2D
	fruit_spawn_loc.progress_ratio = randf()
	new_fruit.position = fruit_spawn_loc.position - Vector2(0, 1216)
	
	slice_queues[dir].append(new_fruit)
	add_child(new_fruit)
	
	$audio_throw.play()
	

func _on_timer_timeout():
	throw_fruit()

	if randf() > 0.9:
		throw_fruit()

	if randf() > 0.5:
		throw_fruit()
