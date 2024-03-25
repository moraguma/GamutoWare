extends Node2D

#TODO Arrumar jittering do bot ao andar
#TODO Adicionar seta apontando para produtos objetivos
#TODO ENCERRAR JOGO EM WIN!
#TODO ADICIONAR BARRA DE TEMPO?!

signal win
signal lose
signal Entrou

var produtos = ["Leite", "Ovos", "Pães", "Queijo", "Tomate", "Alface"] #Produtos a serem selecionados
var current_area = 0 #Area do produto a ser pego
var compras = [] #Array que demonstrara Produtos a serem pegos
var subtração = 3 #Inteiro a ser subtraido conforme lista for completa


# Called when the node enters the scene tree for the first time.
func _ready():
	
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("BUY!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("COMPRE!")
	
	produtos.shuffle()
	produtos = produtos.slice(0, 3)

	Entrou.connect(interac)
	
	update_label()
	
	#for e in produtolista:
			#match e:
				#1 :
					#produtos += "Queijo" + "\n"
				#2:
					#produtos += "Pães" + "\n"
				#3:
					#produtos += "Tomate" + "\n"
				#4:
					#produtos += "Ovos" + "\n"
				#5:
					#produtos += "Alface" + "\n"
				#6:
					#produtos += "Leite" + "\n"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if subtração == 0:
		register_win()

func _on_area_body_entered(body): #Area 01: (INFERIOR DIREITO)(Queijo)
	if body == $"CharacterBody2D":
		current_area = 1
		emit_signal("Entrou")

func _on_area2_body_entered(body): #Area 02: (INFERIOR ESQUERDO)(Pães)
	if body == $"CharacterBody2D":
		current_area = 2
		emit_signal("Entrou")
		
func _on_area3_body_entered(body): #Area 03: (Tomate)
	if body == $"CharacterBody2D":
		current_area = 3
		emit_signal("Entrou")

func _on_area4_body_entered(body): #Area 04: (Ovos)
	if body == $"CharacterBody2D":
		current_area = 4
		emit_signal("Entrou")

func _on_area5_body_entered(body): #Area 05: (SUPERIOR DIREITO)(ALface)
	if body == $"CharacterBody2D":
		current_area = 5
		emit_signal("Entrou")

func _on_area6_body_entered(body): #Area 06: (SUPERIOR ESQUERDO)(Leite)
	if body == $"CharacterBody2D":
		current_area = 6
		emit_signal("Entrou")

func update_label():
	var temp_string = ""
	for e in produtos:
		temp_string += e + '\n'
		
	$CanvasLayer/RichTextLabel.text = temp_string
	
func register_win(): #TODO fazer condição de WIN
	emit_signal("win")
# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	emit_signal("lose")
	

func interac():
	match current_area: #Verificar localização
			
			0:
				pass
			1:
				#compras.append("Queijo") #TODO append antes de conferir
				if not "Queijo" in produtos:
					register_lose()
				else:
					var temp_index = produtos.find("Queijo")
					produtos[temp_index] = "[s]Queijo[/s]"
					subtração -= 1
					
			2:
				#compras.append("Pães")
				if not "Pães" in produtos:
					register_lose()
				else:
					var temp_index = produtos.find("Pães")
					produtos[temp_index] = "[s]Pães[/s]"
					subtração -= 1
			3:
				#compras.append("Tomate")
				if not "Tomate" in produtos:
					register_lose()
				else:
					var temp_index = produtos.find("Tomate")
					produtos[temp_index] = "[s]Tomate[/s]"
					subtração -= 1
			4:
				#compras.append("Ovos")
				if not "Ovos" in produtos:
					register_lose()
				else:
					var temp_index = produtos.find("Ovos")
					produtos[temp_index] = "[s]Ovos[/s]"
					subtração -= 1
			5:
				#compras.append("Alface")
				if not "Alface" in produtos:
					register_lose()
				else:
					var temp_index = produtos.find("Alface")
					print(temp_index)
					produtos[temp_index] = "[s]Alface[/s]"
					subtração -= 1
			6:
				#compras.append("Leite")
				if not "Leite" in produtos:
					register_lose()
				else:
					var temp_index = produtos.find("Leite")
					produtos[temp_index] = "[s]Leite[/s]"
					subtração -= 1
	update_label()

func _on_area_body_exited(body):
	if body == $"CharacterBody2D":
		current_area = 0
