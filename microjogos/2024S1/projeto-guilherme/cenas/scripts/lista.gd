extends Node2D
signal win
signal lose

var resp = ""
var jogador = ""
var tentativas = 0

var bot_atual = ""

@export var jogo = "a"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	var texto = $texto_lista
	
	#lista de igredientes
	var random = RandomNumberGenerator.new()
	var i = 0
	var lista = ""
	while i <= 4:
		var ingred = random.randi_range(1, 4)
		
		if ingred == 1:
			lista = lista + "carne\n"
		elif ingred == 2:
			lista = lista + "alface\n"
		elif ingred == 3:
			lista = lista + "queijo\n"
		elif ingred == 4:
			lista = lista + "tomate\n"
		resp = resp + str(ingred)
		
		i += 1
	
	texto.set_text (lista)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var resultado  = $resultado
	
	#entrada dos botoes
	if Input.is_action_just_pressed("cima") and tentativas <=4:
		bot_atual = "1"
		jogador = jogador + bot_atual
		tentativas += 1
	elif Input.is_action_just_pressed("direita") and tentativas <=4:
		bot_atual = "2"
		jogador = jogador + bot_atual
		tentativas += 1
	elif Input.is_action_just_pressed("baixo") and tentativas <=4:
		bot_atual = "3"
		jogador = jogador + bot_atual
		tentativas += 1
	elif Input.is_action_just_pressed("esquerda") and tentativas <=4:
		bot_atual = "4"
		jogador = jogador + bot_atual
		tentativas += 1
	
	#decida das camadas
	if tentativas == 1: #camada1
		
		$camada1.botao = bot_atual
		$camada1.caindo = true
		$camada1.tent = 1

	
	if tentativas == 2: #camada1
		
		$camada2.botao = bot_atual
		$camada2.caindo = true
		$camada2.tent = 2
	
	if tentativas == 3: #camada1
		
		$camada3.botao = bot_atual
		$camada3.caindo = true
		$camada3.tent = 3
	
	if tentativas == 4: #camada1
		
		$camada4.botao = bot_atual
		$camada4.caindo = true
		$camada4.tent = 4
	
	if tentativas == 5: #camada1
		
		$camada5.botao = bot_atual
		$camada5.caindo = true
		$camada5.tent = 5
	
	if tentativas > 4:
		
		await get_tree().create_timer(0.5).timeout
		
		$pao_cima.caindo = true
		$pao_cima.tent = 6
		
		
		
		if resp == jogador:
			jogo = "win"
			win.emit()
		else:
			jogo ="lose"
			lose.emit()
		
	
	
	pass
	
	
	
	
