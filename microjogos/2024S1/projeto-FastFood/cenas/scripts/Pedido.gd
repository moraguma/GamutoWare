extends Sprite2D

@onready var node_Player = $"../../Player_seta"

signal trocar

# Gambiarra pra vitória ficar registrada
signal jogo_vencido

var acertos

# Valor atribuído a cada lanche
var batata_frita = 0
var hamburguer = 1
var refri = 2

# Valor do player (que vai ser substituído pelo valor do lanche escolhido)
var LancheNaMao = 0

# Gerar um valor aleatório de lanche para pôr na tela
var pedido = randi() % 3 # Sortear um número de 0 a 3 (número do lanche)

# Definição de término do jogo
var jogo_terminado: bool = false

func _ready():
	acertos = 0
	print('[Display/Pedido] PEDIDO INICIAL = ', pedido)
	if pedido == 0:
		$"../../Display/Pedido".texture=ResourceLoader.load("res://microjogos/2024S1/projeto-FastFood/Sprites/Lanches/Batata_frita.png")
	elif pedido == 1:
		$"../../Display/Pedido".texture=ResourceLoader.load("res://microjogos/2024S1/projeto-FastFood/Sprites/Lanches/Hamburguer.png")
	elif pedido == 2:
		$"../../Display/Pedido".texture=ResourceLoader.load("res://microjogos/2024S1/projeto-FastFood/Sprites/Lanches/Refri.png")
	
	# $"../../Display/Pedido".trocar.connect(func_Trocar)
	node_Player.sig_ACERTOU.connect(func_ACERTOU)
	node_Player.sig_ERROU.connect(func_ERROU)
	node_Player.trocar.connect(func_TROCAR)

func func_ACERTOU():
	$Timer.start(0.2) # DLC
	texture=ResourceLoader.load("res://microjogos/2024S1/projeto-FastFood/Sprites/Resultado/Acerto.png")
	pedido = -1
	acertos += 1

func func_ERROU():
	$Timer.start(0.2) # DLC
	$"../../Display/Pedido".texture=ResourceLoader.load("res://microjogos/2024S1/projeto-FastFood/Sprites/Resultado/Erro.png")
	pedido = -1

func func_TROCAR():
	pass

func _process(delta):
	if pedido == 0:
		$"../../Display/Pedido".texture=ResourceLoader.load("res://microjogos/2024S1/projeto-FastFood/Sprites/Lanches/Batata_frita.png")
	elif pedido == 1:
		$"../../Display/Pedido".texture=ResourceLoader.load("res://microjogos/2024S1/projeto-FastFood/Sprites/Lanches/Hamburguer.png")
	elif pedido == 2:
		$"../../Display/Pedido".texture=ResourceLoader.load("res://microjogos/2024S1/projeto-FastFood/Sprites/Lanches/Refri.png")
	if acertos >= 3:
		if !jogo_terminado:
			#match Global.language:
			#	Global.LANGUAGE.EN:
			#		NotificationCenter.notify("YOU WIN!")
			#	Global.LANGUAGE.PT:
			#		NotificationCenter.notify("VOCÊ GANHOU!")
			# Não funciona por algum motivo. A popup de "win" aparece, mas uma vida é perdida.
			# Talvez seja gerado um signal novo com o mesmo nome mas identificador interno diferente? 
			#emit_signal("win") 
			# Funciona... mas por quê exatamente???
			jogo_vencido.emit()
			jogo_terminado = true
		
func _on_timer_timeout(): # DLC 
	print('[Display/Pedido] SINAL RECEBIDO')
	pedido = randi() % 3 # Sortear um número de 0 a 3 (número do lanche)
	print('[Display/Pedido] NOVO PEDIDO = ', pedido)
	$Timer.stop()
