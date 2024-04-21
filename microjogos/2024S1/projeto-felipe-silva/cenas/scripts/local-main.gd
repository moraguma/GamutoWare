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

const NUM_ANONS = 25
const anon_scene = preload("res://microjogos/2024S1/projeto-felipe-silva/cenas/anon.tscn")

func _ready():
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("GO LUNCH!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("VÁ ALMOÇAR!")

	for _n in range(0, NUM_ANONS):
		var c_scene = anon_scene.instantiate()
		c_scene.position.x = randi_range(-400, 800)
		c_scene.position.y = randi_range(-1200, -300)
		add_child(c_scene)


func _on_world_limit_body_entered(body):
	if body == $"Main Character":
		emit_signal("win")
		body.active = false
		

func _on_porta_area_body_entered(body):
	if body == $"Main Character":
		emit_signal("win")
		body.active = false
