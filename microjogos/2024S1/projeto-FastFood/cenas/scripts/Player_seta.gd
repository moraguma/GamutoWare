extends Sprite2D

@onready var Pedido := $"../Display/Pedido"
var pedido

# Signals
signal sig_ACERTOU
signal sig_ERROU
signal trocar

func _ready():
	rotation_degrees = 270
	pass # Replace with function body.

# Valor atribuído a cada lanche
var batata_frita = 0
var hamburguer = 1
var refri = 2

# Valor do player (que vai ser substituído pelo valor do lanche escolhido)
var LancheNaMao = -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pedido = Pedido.pedido
	if Input.is_action_pressed("ui_left"):
		rotation_degrees = 180

	if Input.is_action_pressed("ui_right"):
		# flip_h = false
		rotation_degrees = 0
		
	if Input.is_action_pressed("ui_up"):
		rotation_degrees = 270
		
	if Input.is_action_pressed("ui_down"):
		rotation_degrees = 90
	
	# Pegar o valor Lanche para o LancheNaMao
	if rotation_degrees == 180 and Input.is_action_just_pressed("ui_select"): # Se a seta estiver apontando pra esquerda e a barra de espaço for apertada
		LancheNaMao = batata_frita # Atribuir o valor da batata_frita na 'mao'
		
	elif rotation_degrees == 90 and Input.is_action_just_pressed("ui_select"):
		LancheNaMao = hamburguer
		
	elif rotation_degrees == 0 and Input.is_action_just_pressed("ui_select"):
		LancheNaMao = refri
	
	# Selecionar lanche
	if Input.is_action_just_pressed("ui_select"):
		if LancheNaMao == pedido:
			trocar.emit()
			sig_ACERTOU.emit()
			print('[Player_seta] LancheNaMao = ', LancheNaMao)
			print('[Display/Pedido] Pedido = ', pedido)
			print('-----')
		elif LancheNaMao != -1 and LancheNaMao != pedido:
			trocar.emit()
			sig_ERROU.emit()
			print('[Player_seta] LancheNaMao =', LancheNaMao)
			print('[Display/Pedido] Pedido = ', pedido)
			print('-----')

