extends Node2D

# Declaração dos sinais win e lose
signal win
signal lose

# 16:9
const WIDTH = 1920
const HEIGHT = 1080

#---------------------------------------------------------------------------------------------------
# VARIÁVEIS LOCAIS
#---------------------------------------------------------------------------------------------------

const mail = preload("res://microjogos/2023S1/mail_cleaner/cenas/mail.tscn")

# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("DELETE THE SUSPICIOUS EMAILS!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("DELETE OS EMAILS SUSPEITOS!")

func _physics_process(delta):
	pass

func _process(delta):
	pass


# --------------------------------------------------------------------------------------------------
# FUNÇÕES LOCAIS
# --------------------------------------------------------------------------------------------------


# --------------------------------------------------------------------------------------------------
# CONDIÇÕES DE VITÓRIA
# --------------------------------------------------------------------------------------------------

# Chame esta função para registrar que o jogador venceu o jogo
func register_win():
	emit_signal("win")


# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	emit_signal("lose")
