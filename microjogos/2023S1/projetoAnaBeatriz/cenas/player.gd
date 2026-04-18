extends CharacterBody2D
var cena_projetil = preload("res://microjogos/2023S1/projetoAnaBeatriz/cenas/shot.tscn")


@onready var shot = $"../Shot"


func _physics_process(_delta):
	if Input.is_action_pressed("direita"):
		velocity.x = 600
	elif Input.is_action_pressed("esquerda"):
		velocity.x = -600
	else:
		velocity.x = 0
	move_and_slide()

func _process(_delta):
	if Input.is_action_just_pressed("acao"):
		shot.play()
		
		var cena = cena_projetil.instantiate()
		cena.position = position
		get_parent().add_child(cena)


func colidir():
	get_parent().morrer()
	queue_free()
