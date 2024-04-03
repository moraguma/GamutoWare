extends CharacterBody2D

@export var rotation_speed =  1.0472 * 2
@export var spawnPositions : Array[Marker2D] = []
var counterBalaoBom = 0
var counterBalaoRuim = 0
var counterBonsAtirados = 0
var counterRuinsAtirados = 0
# tenho 10 pontos, preciso escolher pontos aleatorios e colocar numa lista de outros pontos, sem repetir
var chosenPoints : Array[Marker2D] = []
var balaobom = preload("res://microjogos/2024S1/ShootGamuto/cenas/balaoBom.tscn")
var balaoruim = preload("res://microjogos/2024S1/ShootGamuto/cenas/balaoRuim.tscn")

var acertou_bom = false

@onready var main = get_parent()

func _physics_process(delta):
	
	if not acertou_bom:
		$Line2D.rotate(rotation_speed * delta)
		$RayCast2D.rotate(rotation_speed * delta)
		$Superior.rotate(rotation_speed * delta)
		#if($Line2D.rotation * (180 / PI) > 90):
			#_reverse_rotation()
		#
		#if($Line2D.rotation * (180 / PI) < 0):
			#_reverse_rotation()
		
		move_and_slide()
	
func _reverse_rotation():
	rotation_speed *= -1
	
func _ready():
	set_process_input(true) 
	randomize()
	for i in range(0, spawnPositions.size()):
		
		var randomSet = randi() % 2
		if randomSet == 0: 
			var balao = balaobom.instantiate()
			add_child(balao) 
			counterBalaoBom = counterBalaoBom + 1
			balao.global_transform = spawnPositions[i].global_transform
		else:
			var balao = balaoruim.instantiate()
			add_child(balao) 
			counterBalaoRuim = counterBalaoRuim + 1
			balao.global_transform = spawnPositions[i].global_transform
	#var balao = balaoruim.instantiate()
	#add_child(balao) 
	#balao.global_transform = $"../Marker2D".global_transform
	##This may or may not be required for inputs to work.

func _input(ev):
	if Input.is_action_just_pressed("acao"):
		_attack()
		$"../x".play()

func _attack():
	if $RayCast2D.is_colliding():
		##print($RayCast2D.get_collider().get_collision_layer());
		var collided_object = $RayCast2D.get_collider()
		collided_object.hide()
		#$"../RichTextLabel".text = "ôi"
		if $RayCast2D.get_collider().get_collision_layer() == 4:
			$"../Lose".play()
			$"../AudioStreamPlayer".stop()
			acertou_bom = true
			set_process_input(false)
		else:
			counterBonsAtirados += 1
			#$"../RichTextLabel".text = "you lost"
			
		if counterBonsAtirados >= counterBalaoRuim and not acertou_bom:
			#$"../RichTextLabel".text = "you won"
			acertou_bom = true
			set_process_input(false)
			register_win()

# Chame esta função para registrar que o jogador venceu o jogo
func register_win():
	main.register_win()


# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	main.register_lose()
