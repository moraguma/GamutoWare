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

var vidas = 2


@export var car_scene: PackedScene



func _on_car_timer_timeout():
	var carro = car_scene.instantiate()
	
	var carro_spawn_location = get_node("Path2D/Carspawn")
	carro_spawn_location.progress_ratio = randf()
	
	carro.position = carro_spawn_location.position
	var velocidade = Vector2(0, -300)

	carro.linear_velocity = velocidade
	

	
	add_child(carro)
	#$Carro_som.play()
	print("Som tocado")


func _on_warningtimer_timeout():
	$StartMessage.visible = false
	$Warning_msg.visible = false
	await get_tree().create_timer(0.2).timeout
	$StartMessage.visible = true
	$Warning_msg.visible = true
	await get_tree().create_timer(0.4).timeout
	$StartMessage.visible = false
	$Warning_msg.visible = false
	await get_tree().create_timer(0.2).timeout
	$Warning_msg.visible = true
	await get_tree().create_timer(0.4).timeout
	$Warning_msg.visible = false



# Chame esta função para registrar que o jogador venceu o jogo
func register_win():
	if vidas == 2:
		print("win")
		emit_signal("win")
	else:
		pass


# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	if vidas != 2:
		print("lose")
		emit_signal("lose")
	else:
		pass





func _on_game_time_timeout():
	register_lose()
	register_win()
