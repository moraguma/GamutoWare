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
 # LISTA ANIMAIS STAND BY
#var animais = [{"nome": "Barata", "tamanho": 1}, {"nome": "Rato", "tamanho": 2},{"nome": "Cobra", "tamanho":3 },
 #{"nome": "Coelho", "tamanho": 4},{"nome": "Cachorro", "tamanho": 5},{"nome": "Humano", "tamanho": 6},
#{"nome": "Cavalo", "tamanho": 7},{"nome": "Elefante", "tamanho": 8},{"nome": "Baleia", "tamanho": 9}]

#Lista de Palavras
#var alfabeto =[{"nome": "Abóbora", "tamanho": 1}, {"nome": "Acerola", "tamanho": 2},{"nome": "Barracuda", "tamanho": 3},
#{"nome": "Carreta", "tamanho": 4},{"nome": "Crosta", "tamanho": 5},{"nome": "Dedo", "tamanho": 6},
#{"nome": "Piranha", "tamanho": 7},{"nome": "Queijo", "tamanho": 8}, {"nome": "Saída", "tamanho": 9}]

var lista_coisas = ["Abóbora", "Acerola", "Barracuda", "Carreta", "Crosta", "Dedo", "Piranha", "Queijo", "Saída"]
var up: StringName # lista_al[up] --> lista_coisas.get_index(up)
var down : StringName 
var left : StringName 
var right : StringName 
var senha = []
var score=0

# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	# Verifica a linguagem do jogo e mostra texto nesta linguagem. Deve dar uma ideia do que deve
	# ser feito para vencer o jogo. A fonte usada não suporta caracteres latinos como ~ ou ´
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("CHANGE YOUR PASSWORD!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("MUDE SUA SENHA!")
	#RANDOMIZAR A LISTA DE COISAS
	var lista_al = lista_coisas.duplicate()
	lista_al.shuffle()
	#TOCAR MUSICA
	$"Fight(adaptado)".play()
	#DEFINIÇÃO DAS SETAS
	up = lista_al[0]
	down = lista_al[1]
	left = lista_al[2]
	right = lista_al[3]
	
	#print("UP = " + up)
	#print("DOWN = " + down)
	#print("LEFT = " + left)
	#print("RIGHT = " + right)
	
	#MOVIMENTACAO DO GAMUTO MAL
	$AnimationPlayer.play("TEXTO")
	#MOVIMENTACAO DO TEXTO
	$GamutoMal/AnimationPlayer.play("GAMUTOMAL")
	#MOVIMENTAÇÃO GAMUTOBEM
	$Gamutobem/AnimationPlayer.play("GAMUTOBEM")
	#var tween = create_tween()
	#tween.set_ease(Tween.EASE_OUT)
	#tween.set_trans(Tween.TRANS_LINEAR)
	#tween.tween_property($GamutoMal, "position", Vector2(352, 880), 6)
	
	#APARECIMENTO DOS TESTOS
	$SetaBaixo/Control/RichTextLabel.text = down
	$SetaDireita/Control/RichTextLabel.text = right
	$SetaEsquerda/Control/RichTextLabel.text = left
	$"SetaCima(1)"/Control/RichTextLabel.text = up
	

	#RESPOSTA
	var senha = []

	# if (botao cima pressionado and up não ta na lista);
		# senha.append(up)

#TODAS AS KEYBINDS
func _process(delta):
	if Input.is_action_pressed("cima") and up not in senha:
		senha.append(up)
		comparacao()
	elif Input.is_action_pressed("baixo") and down not in senha:
		senha.append(down)
		comparacao()
	elif Input.is_action_pressed("esquerda") and left not in senha:
		senha.append(left)
		comparacao()
	elif Input.is_action_pressed("direita") and right not in senha:
		senha.append(right)
		comparacao()
		
	elif len(senha) > 0:
		if Input.is_action_just_pressed("acao") and len(senha)>0 and len(senha)<2:
			senha.resize(senha.size() - 1)
			score-=1
			$Respostas/Control/RichTextLabel.text = "".join(senha)
		elif Input.is_action_just_pressed("acao") and lista_coisas.find(senha[-1]) > lista_coisas.find(senha[-2]):
			senha.resize(senha.size() - 1) 
			score-=1
			$Respostas/Control/RichTextLabel.text = "".join(senha)
		elif Input.is_action_just_pressed("acao") and lista_coisas.find(senha[-1]) < lista_coisas.find(senha[-2]):
			senha.resize(senha.size() - 1)
			score+=1
			$Respostas/Control/RichTextLabel.text = "".join(senha)
			
	if up in senha:
		$"SetaCima(1)"/Control/RichTextLabel.visible = false
	if up not in senha:
		$"SetaCima(1)"/Control/RichTextLabel.visible = true
	if right in senha:
		$"SetaDireita"/Control/RichTextLabel.visible = false
	if right not in senha:
		$"SetaDireita"/Control/RichTextLabel.visible = true
	if down in senha:
		$"SetaBaixo"/Control/RichTextLabel.visible = false
	if down not in senha:
		$"SetaBaixo"/Control/RichTextLabel.visible = true
	if left in senha:
		$"SetaEsquerda"/Control/RichTextLabel.visible = false
	if left not in senha:
		$"SetaEsquerda"/Control/RichTextLabel.visible = true
		
# --------------------------------------------------------------------------------------------------
# SUAS FUNÇÕES
# --------------------------------------------------------------------------------------------------

# COMPARAR OS VALORES DADOS
func comparacao():
	if len(senha) < 2: 
		score += 1
		print("FIRST SCORE UP")
	elif lista_coisas.find(senha[-1]) > lista_coisas.find(senha[-2]):
		score += 1
		print("SCORE UP")
	elif lista_coisas.find(senha[-1]) < lista_coisas.find(senha[-2]):
		score -= 1 
	$Respostas/Control/RichTextLabel.text = "".join(senha)
	if score == 4:
		register_win()
		$"VITÓRIA".visible = true


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
