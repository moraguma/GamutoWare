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


const mail_quantity: int = 6
const space_between_mail: int = 10
const mail = preload("res://microjogos/2023S1/mail_cleaner/cenas/mail.tscn")

var mail_list: Array = []
var mail_spawn: Node2D

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
	
	custom_ready()

func _physics_process(delta):
	pass

func _process(delta):
	pass


# --------------------------------------------------------------------------------------------------
# FUNÇÕES LOCAIS
# --------------------------------------------------------------------------------------------------

func custom_ready():
	mail_spawn = $Phone/MailSpawn
	for i in range(mail_quantity):
		var new_mail = mail.instantiate()
		mail_spawn.add_child(new_mail)
		var size: Vector2 = new_mail.get_viewport().get_visible_rect().size
		var mail_relative_position: Vector2 = Vector2(0, -(i * (space_between_mail)))
		new_mail.position = mail_relative_position
		print(new_mail.position)
		mail_list.append(new_mail)

# --------------------------------------------------------------------------------------------------
# CONDIÇÕES DE VITÓRIA
# --------------------------------------------------------------------------------------------------

# Chame esta função para registrar que o jogador venceu o jogo
func register_win():
	emit_signal("win")


# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	emit_signal("lose")
