extends CharacterBody2D
const Comandos = preload("res://microjogos/2025S1/the_wrecker/cenas/scripts/comandos.gd") 
@onready var anim_tree: AnimationTree = $AnimationTree
var lista_digito = []
var lista_true = []
var vitoria = false
@onready var texto = $"../Label"

const distancia_teclas = 200
const escala_teclas = 3
var lista_sprites = []
	
@onready var imagem_esquerda = load("res://microjogos/2025S1/the_wrecker/recursos/imagens/Default/keyboard_arrows_left.png")
@onready var imagem_direita = load("res://microjogos/2025S1/the_wrecker/recursos/imagens/Default/keyboard_arrows_right.png")


func reset_conditions():
	anim_tree.set("parameters/conditions/up", false)
	anim_tree.set("parameters/conditions/down", false)
	anim_tree.set("parameters/conditions/space", false)
	anim_tree.set("parameters/conditions/lat", false)
	


func _input(event: InputEvent) -> void:
	reset_conditions()
	
	var initial_len = len(lista_digito)
	if Input.is_action_just_pressed("direita"):
		anim_tree.set("parameters/conditions/lat", true)
		lista_digito.append(1)
		

	elif Input.is_action_just_pressed("esquerda"):
		
		anim_tree.set("parameters/conditions/lat", true)
		lista_digito.append(2)
	
	for i in range(len(lista_digito)):
		if lista_digito[i] != lista_true[i]:
			texto.text = "Nem fez cógecas"
			lista_digito = []
		elif lista_digito[i] == lista_true[i]:
			texto.text = "Corte certeiro!"
			
			var sprite = Sprite2D.new()
			match lista_digito[i]:
				2:
					sprite.texture = imagem_esquerda
				1:
					sprite.texture = imagem_direita
			sprite.position = Vector2(300 + distancia_teclas * i, 450)
			sprite.scale *= escala_teclas
			add_sibling(sprite)
			lista_sprites.append(sprite)
				
		print(lista_true)
		print(lista_digito)
				
	if lista_digito == lista_true:
		get_parent().register_win() #pega o nó pai
		print("ganhou")

	
	#print(Comandos._get_number())
	if len(lista_digito) != initial_len:	
		print("")


func lose():
	reset_conditions()
	anim_tree.set("parameters/conditions/hurt", true)
