extends Node2D

@export var dinheiro_colocado = false
@export var ra_colocado = false
var ganhou = false

func _on_cartão_movendo_ra_ativado() -> void:
	if dinheiro_colocado:
		Minigames.register_win(self)
		#$VitoriaPorra.visible = true
		ganhou = true
	ra_colocado = true
	

func _on_cartão_movendo_ra_desativo() -> void:
	if ganhou:
		return
	Minigames.register_lose(self)
	ra_colocado = false

func _on_dinheiro_movendo_dinheiro_ativado() -> void:
	if ra_colocado:
		Minigames.register_win(self)
		$VitoriaPorra.visible = true
		ganhou = true
	dinheiro_colocado = true

func _on_dinheiro_movendo_dinheiro_desativo() -> void:
	if ganhou:
		return
	Minigames.register_lose(self)
	dinheiro_colocado = false
