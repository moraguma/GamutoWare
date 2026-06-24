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

var cena_estrela = preload("res://microjogos/2024S1/projeto-da-ana-luiza/cenas/estrela_amarela.tscn")


# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	register_win()


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


func spawn_estrela():
	var estrela_nova : RigidBody2D = cena_estrela.instantiate()
	estrela_nova.position.x = 960
	estrela_nova.position.y = 800.0
	estrela_nova.linear_velocity = Vector2(randf_range(-300, 300), -1400)
	add_child(estrela_nova)


func _on_area_2d_body_entered(body: PhysicsBody2D) -> void:
	if body.is_in_group("star"):
		register_lose()
		body.delete()
