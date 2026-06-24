extends Node2D

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	Minigames.register_win(self)


func _on_gamuto_dead():
	Minigames.register_lose(self)
