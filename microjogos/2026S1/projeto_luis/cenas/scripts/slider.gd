extends Area2D

var velocidade = 80
var start = Vector2(-210,-175)
var direcao = Vector2(1,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = start


func _process(delta: float) -> void:
	move(delta)

func move(delta):
	var indice = -(abs(position.x))*6/220 + 8
	var indice_blur = (position.x**2)*5/(220**2) + 1
	
	if position.x < 210 and direcao.x > 0:
		position += velocidade * delta * direcao *indice
		$"../Blur".material.set_shader_parameter("blur_scale",indice_blur)
	elif position.x > 210 and direcao.x > 0:
		direcao.x = -1
	
	if direcao.x < 0 and position.x > -210:
		position += velocidade * delta * direcao *indice
		$"../Blur".material.set_shader_parameter("blur_scale",indice_blur)
	elif direcao.x < 0 and position.x < -210:
		direcao.x = 1
	
		
		
