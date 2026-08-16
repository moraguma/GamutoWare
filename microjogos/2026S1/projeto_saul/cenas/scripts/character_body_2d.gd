#ERES EL ALIEN

extends CharacterBody2D

const PLAYER_SPEED : float = 10
const PLAYER_ROTATION_SPEED : float = 1

var velocidad = 2
var direccion = 1
var vivo = true

@export var planet : CharacterBody2D
@export var tiempo : Timer
@export var variable : CollisionObject2D

func _ready() -> void:
	tiempo.start()
	$Sprite2D.visible = true
	Minigames.register_win(self)

func _physics_process(delta):
	if vivo:
		rotate(direccion*velocidad*delta)
		if Input.is_action_pressed("ui_right"):
			direccion = 1
		if Input.is_action_pressed("ui_left"):
			direccion = -1
	else:
		rotate(0)
		$Sprite2D.play("fuego")
	
	
