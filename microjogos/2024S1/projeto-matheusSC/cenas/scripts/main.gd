extends Node2D

var current_pos = 0
var pode_checkar = true
var perdeu = false
var ganhou = false
var current_pressed = ""

var particulas
var crowd_anim
var oh_no
var gota

var crowd_anim_played = false

# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
# tela 1920x1080, que é padrão para monitores full HD. Caso você queira uma resolução menor para 
# atingir uma estética mais pixelada, você pode mudar estes números para qualquer outra resolução 
# 16:9




# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	$Music.play()
	
	current_pos = 0
	particulas = $"particulas"
	crowd_anim = $"crowd/AnimationPlayer"
	oh_no = $"oh no"
	gota = $"gota"
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("CLICK IN ORDER")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("CLIQUE NA SEQUÊNCIA")


# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a física, como
# a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou desde
# a última chamada desta função. O comando pass não faz nada
func _physics_process(delta):
	
	pass


# Esta função é chamada uma vez por frame e é otimizada para cálculos relacionados a renderização, 
# como a movimentação de um personagem. O parâmetro delta indica a quantidade de tempo que passou 
# desde a última chamada desta função. O comando pass não faz nada
func _process(delta):
	if ganhou:
		if not $Applause.playing:
			$Applause.play()
		particulas.emitting = true
		if not crowd_anim_played:
			crowd_anim.play("crowd_shake")
			crowd_anim_played = true
		Minigames.register_win(self)
	if perdeu:
		if $Music.playing:
			$Wrong.play()
			$Music.stop()
		oh_no.play()
		oh_no.visible = true
		gota.visible = true
	pass


# --------------------------------------------------------------------------------------------------
# SUAS FUNÇÕES
# --------------------------------------------------------------------------------------------------


# Um método genérico. Crie quantos métodos você precisar!
func my_method():
	pass

func _on_timer_timeout():
	pode_checkar = true
	pass # Replace with function body.
