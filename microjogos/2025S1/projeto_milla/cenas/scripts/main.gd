extends Node2D

# Um método genérico. Crie quantos métodos você precisar!
func _ready() -> void:
	register_win()

# Chame esta função para registrar que o jogador venceu o jogo
func register_win():
	Minigames.register_win(self)


# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	Minigames.register_lose(self)
