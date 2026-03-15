extends Node2D


signal win
signal lose

const WIDTH = 1920
const HEIGHT = 1080

const Target = preload("res://microjogos/demo/tiro_ao_alvo/cenas/Alvo.tscn")
const TOTAL_TARGETS = 4

var hits = 0

func _ready():
	randomize()
	
	# Cria um total de [TOTAL_TARGETS] alvos
	
	for i in range(TOTAL_TARGETS):
		var new_target = Target.instantiate()										# Instancia os alvos
		add_child(new_target)													# Adiciona os alvos na cena
	
	$Musica.play()																# Toca a música


# Registra que um alvo foi acertado. Se todos os alvos tiverem sido acertados, marca a vitória do jogo
func register_hit():
	hits += 1
	if hits >= TOTAL_TARGETS:
		Minigames.register_win(self)


func Minigames.register_win(self):
	emit_signal("win")

func Minigames.register_lose(self):
	emit_signal("lose")

