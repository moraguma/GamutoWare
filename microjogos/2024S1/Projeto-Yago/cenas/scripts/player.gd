extends CharacterBody2D

@onready var lista_txt = $Hud/Lista

signal lose
signal win

var end_game = false

const SPEED = 1000
const accel = 4000
const friction = 1000
var sacola = {}
var input = Vector2.ZERO
var produtos = ["leite", "ovos", "paes", "queijo", "tomate", "alface"] #Produtos a serem selecionados

func add_produto(produto):
	if sacola.get(produto) == null: lose.emit()
	elif sacola.get(produto) == false:
		sacola[produto] = true
	update_label()
	var is_list_complete = true
	for prod in sacola.values():
		if not prod: is_list_complete = false
	if is_list_complete: win.emit()
	
func update_label():
	var temp_string = ""
	for prod in sacola:
		var prod_name = ''
		match Global.language:
			Global.LANGUAGE.EN:
				match prod:
					"leite":  prod_name = 'Milk'
					"ovos":   prod_name = 'Eggs'
					"paes":   prod_name = 'Breads'
					"tomate": prod_name = 'Tomato'
					"alface": prod_name = 'Lettuce'
					"queijo": prod_name = 'Cheese'
			Global.LANGUAGE.PT:
				match prod:
					"leite":  prod_name = 'Leite'
					"ovos":   prod_name = 'Ovos'
					"paes":   prod_name = 'Pães'
					"tomate": prod_name = 'Tomate'
					"alface": prod_name = 'Alface'
					"queijo": prod_name = 'Queijo'
		if sacola.get(prod): temp_string += '[s]' + prod_name + '[/s]\n'
		else: temp_string += prod_name + '\n'
	lista_txt.text = temp_string
#[s]Queijo[/s]

func _ready():
	produtos.shuffle()
	for i in range(3):
		sacola[produtos[i]] = false
	print(sacola)
	update_label()
	
func _physics_process(delta):
	input = get_input()
	
	#rotation = velocity.angle()
	if velocity.normalized() != Vector2(0,0):
		rotation = lerp_angle(rotation, deg_to_rad(90) + velocity.angle(), 0.3)
	
	#var normal_velocity = velocity.normalized()
	#rotation = cos(normal_velocity.x) + sin(normal_velocity.y) 
	
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * accel * delta)
		velocity = velocity.limit_length(SPEED)
	position.x = clamp(position.x, -600, 600)
	position.y = clamp(position.y, -900, 900)
	move_and_slide()

func get_input():
	input.x = int(Input.is_action_pressed("direita")) - int(Input.is_action_pressed("esquerda"))
	input.y = int(Input.is_action_pressed("baixo")) - int(Input.is_action_pressed("cima"))
	return input.normalized()


