extends AnimatedSprite2D

@onready var Player := $"../Player"
var batata_frita = 0
var hamburguer = 1
var refri = 2
var LancheNaMao = 0
var rotacao
var pedido = randi() % 3 # Sortear um número de 0 a 3 (número do lanche)

func _ready():
	rotacao = Player.rotacao

func _process(delta):
	if pedido == 0:
		$Pedido.play("Batata")
	elif pedido == 1:
		$Pedido.play("Hamburguer")
	elif pedido == 2:
		$Pedido.play("Refri")
	if rotacao == 180 and Input.is_action_pressed("ui_select"): # Se a seta estiver apontando pra esquerda e a barra de espaço for apertada
		LancheNaMao = batata_frita # Atribuir o valor da batata_frita na 'mao'
	elif rotacao == 90 and Input.is_action_pressed("ui_select"):
		LancheNaMao = hamburguer
	elif rotacao == 0 and Input.is_action_pressed("ui_select"):
		LancheNaMao = refri
	
	# Momento da entrega do lanche
	if rotacao == 270 and Input.is_action_pressed("ui_select"): # Se estiver olhando para cima e apertar espaço
		if LancheNaMao == pedido: # Se o LancheNaMao for igual ao lanche sorteado no começo...
			print('Acertou')
		else:
			print('Errou')
