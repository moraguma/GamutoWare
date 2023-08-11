extends Node2D

# Declaração dos sinais win e lose
signal win
signal lose

# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
# tela 1920x1080, que é padrão para monitores full HD. Caso você queira uma resolução menor para 
# atingir uma estética mais pixelada, você pode mudar estes números para qualquer outra resolução 
# 16:9
const WIDTH = 1920
const HEIGHT = 1080

var rng = RandomNumberGenerator.new()
var alreadyLost = false
# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("BUS LIMAO SUPREMACY")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("LEMON BUS SUPREMACY")
	
	register_win()
	
	rng.randomize()
	
	# Add a timer to this node
	var timer_init = Timer.new()
	self.add_child(timer_init)

	timer_init.connect("timeout", startBisLoop)
	timer_init.set_wait_time(1.5)
	timer_init.one_shot = true
	timer_init.start()


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

func startBisLoop():
	var timer = Timer.new()
	self.add_child(timer)

	timer.connect("timeout", spawnBis)
	timer.set_wait_time(0.4)
	timer.start()

func spawnBis():
	var n = rng.randf_range(1, 100)
	if n > 35:
		spawnBisPadrao()
	else:
		spawnBisLimao()
	
func spawnBisPadrao():
	var bis = preload("res://microjogos/2023S1/bis-limao/cenas/bis_normal.tscn").instantiate()
	add_child(bis)

func spawnBisLimao():
	var bis = preload("res://microjogos/2023S1/bis-limao/cenas/bis_limao.tscn").instantiate()
	add_child(bis)
# --------------------------------------------------------------------------------------------------


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
func register_lose(reason: String):
	if alreadyLost:
		return
	emit_signal("lose")
	alreadyLost = true
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("Perdeu :/")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("You lost :/")
	get_node("Gamuto").loseAnim(reason)
