extends Area2D
var janela
var velocidade = 700

func _ready() -> void:
	janela = get_viewport_rect().size
	position = Vector2(janela.x/2,janela.y/2)

func _process(delta):
	
	#Controle da câmera
	var direcao = Vector2.ZERO
	if Input.is_action_pressed("direita"):
		direcao.x += 1
	if Input.is_action_pressed("esquerda"):
		direcao.x += -1
	if Input.is_action_pressed("cima"):
		direcao.y += -1
	if Input.is_action_pressed("baixo"):
		direcao.y += 1
	
	position += direcao * velocidade * delta
		
	
	
	

		
