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
	$Win.play()
	emit_signal("win")


# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	$Lose.play()
	emit_signal("lose")


func _on_vidro_body_entered(body: Node2D) -> void:
	if body.tipo == 'garrafa':
		register_win()
	else:
		register_lose()
	body.queue_free()

func _on_plastico_body_entered(body: Node2D) -> void:
	if body.tipo == 'sacola':
		register_win()
	else:
		register_lose()
	body.queue_free()
	
func _on_metal_body_entered(body: Node2D) -> void:
	if body.tipo == 'lata':
		register_win()
	else:
		register_lose()
	body.queue_free()

func _on_papel_body_entered(body: Node2D) -> void:
	if body.tipo == 'papel':
		register_win()
	else:
		register_lose()
	body.queue_free()
