extends Node2D

# Declaração dos sinais win e lose
signal win
signal lose

# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
const WIDTH = 1920
const HEIGHT = 1080

const TOTAL_LIVROS = 6

# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------
var pos = 0
const y = 960
var lugares = [405, 615, 825, 1035, 1245, 1455]
var select =1
var flechapos = 1024
var livros = ["Livro1", "Livro2", "Livro3", "Livro4", "Livro5", "Livro6"] 
var base = ["Livro1", "Livro2", "Livro3", "Livro4", "Livro5", "Livro6"]
var venceu = false

@onready var ambient = $Ambient
@onready var move = $Move
@onready var click = $Click
@onready var win_sound = $Win

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("ARRANGE")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("ORGANIZE")
	
	ambient.play()
	
	randomize()
	
	var a = randi() % TOTAL_LIVROS
	var b = a
	while b == a:
		b = randi() % TOTAL_LIVROS
	trocar(livros, a, b)

func trocar(l, a, b):
	var aux = l[a]
	l[a] = l[b]
	l[b] = aux

# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a física, como
# a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou desde
# a última chamada desta função. O comando pass não faz nada
func _physics_process(delta):
	if not venceu:
		var aux
		if livros == base:
			win_sound.play()
			register_win()
			venceu = true
		
		if select == 0:
			if Input.is_action_just_pressed("esquerda"):
				if pos>0:
					aux = livros[pos] 
					livros[pos] = livros[pos-1]
					livros[pos-1] = aux
					get_node(livros[pos]).position = Vector2(lugares[pos-1],960)
					get_node(livros[pos-1]).position = Vector2(lugares[pos],960)
					pos-=1
					$"flecha amarela".position = Vector2(lugares[pos],1024)
					$"flecha branca".position = Vector2(lugares[pos],1024)
					
					move.play()
			if Input.is_action_just_pressed("direita"):
				if pos<5:
					aux = livros[pos] 
					livros[pos] = livros[pos+1]
					livros[pos+1] = aux

					get_node(livros[pos]).position = Vector2(lugares[pos+1],960)
					get_node(livros[pos+1]).position = Vector2(lugares[pos],960)
					pos+=1
					$"flecha amarela".position = Vector2(lugares[pos],1024)
					$"flecha branca".position = Vector2(lugares[pos],1024)
					
					move.play()
					
		if select == 1:
			if Input.is_action_just_pressed("esquerda"):
				if pos>0:
					pos-=1
					$"flecha amarela".position = Vector2(lugares[pos],1024)
					$"flecha branca".position = Vector2(lugares[pos],1024)
			if Input.is_action_just_pressed("direita"):
				if pos<5:
					pos+=1
					$"flecha amarela".position = Vector2(lugares[pos],1024)
					$"flecha branca".position = Vector2(lugares[pos],1024)
		if Input.is_action_just_pressed("acao"):
			click.play()
			
			if select == 1 :
				select = 0
				$"flecha amarela".show()
				$"flecha branca".hide()
			elif select == 0 :
				select = 1
				$"flecha branca".show()
				$"flecha amarela".hide()
		for a in range(6):
			get_node(livros[a]).position = Vector2(lugares[a],960)
		pass


# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a renderização, 
# como a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou 
# desde a última chamada desta função. O comando pass não faz nada
func _process(delta):
	pass

# --------------------------------------------------------------------------------------------------
# SUAS FUNÇÕES
# --------------------------------------------------------------------------------------------------

# Um método genérico. Crie quantos métodos você precisar!


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
