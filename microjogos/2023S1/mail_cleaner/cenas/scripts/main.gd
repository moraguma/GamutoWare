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


const mail_quantity: int = 13
const space_between_mail: int = 100
const mail_fall_speed: float = 50.0 * 15
const mail = preload("res://microjogos/2023S1/mail_cleaner/cenas/mail.tscn")

var mail_list: Array = []
var mail_spawn: Node2D
var lost: bool = false

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
	if len(mail_list) == 0: return
	mail_fall(delta)
	if lost: return
	var right = Input.is_action_just_released("direita")
	var left = Input.is_action_just_released("esquerda")
	if right:
		if not mail_list[0].is_red: # wrong
			lost = true
			register_lose()
	elif left:
		if mail_list[0].is_red: # wrong
			lost = true
			register_lose()
	
	if left or right:
		$Hit.play()
		mail_list[0].start_deletion(right)
		mail_list.pop_at(0)
	
	if len(mail_list) == 0 and not lost:
		register_win()

# --------------------------------------------------------------------------------------------------
# FUNÇÕES LOCAIS
# --------------------------------------------------------------------------------------------------

func custom_ready():
	$Phone/BlueScreen.visible = false
	$Background/AnimationPlayer.current_animation = "background_movement"
	mail_spawn = $Phone/Mask/MailSpawn
	for i in range(mail_quantity):
		var new_mail = mail.instantiate()
		mail_spawn.add_child(new_mail)
		new_mail.scale = mail_spawn.scale
		mail_list.append(new_mail)
	
	set_mail_position()
		
func set_mail_position():
	for i in range(len(mail_list)):
		mail_list[i].position.y = -(i * space_between_mail)
		
func mail_fall(delta: float):
	for i in range(len(mail_list)):
		var desired_y: float = -(i * space_between_mail)
		if mail_list[i].position.y < desired_y:
			mail_list[i].position.y += mail_fall_speed * delta
			if mail_list[i].position.y > desired_y:
				mail_list[i].position.y = desired_y

# --------------------------------------------------------------------------------------------------
# CONDIÇÕES DE VITÓRIA
# --------------------------------------------------------------------------------------------------

# Chame esta função para registrar que o jogador venceu o jogo
func register_win():
	emit_signal("win")


# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	$Phone/BlueScreen.visible = true
	$Music.playing = false
	$Scratch.playing = true
	GlobalCamera.add_trauma(0.75)
	emit_signal("lose")
