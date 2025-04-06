extends Node2D

var rng = RandomNumberGenerator.new()

signal win
signal lose

const WIDTH = 1920
const HEIGHT = 1080

var porta_demonio = -1

@onready var global = $GLOBAL
@onready var texto = $Label
@onready var morte = $Morte
@onready var tempo = $Timer2
@onready var pesq = $"porta-esquerda/portaesq"
@onready var pdir = $"porta-direita/portadir"
@onready var pfrente = $"porta-frente/portafrente"
@onready var bump = $bump
@onready var musica = $musica

func speedup(j):
	if tempo.wait_time > 0.6:
			tempo.wait_time -= 0.3
	if tempo.wait_time <= 0.6:
		tempo.wait_time -= 0.1
	if morte.wait_time > 1:
		morte.wait_time -= 0.2
	if morte.wait_time <= 1 and morte.wait_time >= 0.5:
		morte.wait_time -= 0.05
	else:
		morte.wait_time = 0.5
	if j.speed_scale < 16:
		pesq.speed_scale += 0.2
		pdir.speed_scale += 0.2
		pfrente.speed_scale += 0.2
	else:
		pesq.speed_scale += 0.1
		pdir.speed_scale += 0.1
		pfrente.speed_scale += 0.1

func _ready() -> void:
	musica.play()
	tempo.start()
	print(pdir.speed_scale)
	


func faceondoor(i):
	if(i == 0):
		pesq.play("demonio_spawn")
		porta_demonio = 0
		morte.start()
		speedup(pesq)
	if(i == 1):
		pdir.play("demonio_spawn")
		porta_demonio = 1
		morte.start()
		speedup(pdir)
	if(i == 2):
		pfrente.play("demonio_spawn")
		porta_demonio = 2
		morte.start()
		speedup(pfrente)

func _physics_process(delta):
	if(Input.is_action_just_pressed("direita")):
		$"porta-direita/portadir".play("porta_fechando")
		if(porta_demonio == 1):
			porta_demonio = -1
			morte.stop()
			tempo.start()
		bump.play()
	if(Input.is_action_just_pressed("esquerda")):
		$"porta-esquerda/portaesq".play("porta_fechando")
		if(porta_demonio == 0):
			porta_demonio = -1
			morte.stop()
			tempo.start()
		bump.play()
	if(Input.is_action_just_pressed("cima")):
		$"porta-frente/portafrente".play("porta_fechando")
		if(porta_demonio == 2):
			porta_demonio = -1
			morte.stop()
			tempo.start()
		bump.play()

func _on_timer_timeout():
	faceondoor(rng.randi_range(0, 2))
	tempo.stop()
	
func on_morte():
	$Sprite2D.visible = true
	emit_signal("lose")

func testosd() -> void:
	texto.text = ""

func _on_wincondition_timeout() -> void:
	emit_signal("win")
