extends AnimatedSprite2D

const x_inicial = 283.5
const y_inicial = 848

func _ready() -> void:
	position = Vector2(x_inicial, y_inicial)
	
func _process(delta: float) -> void:
	var icon = get_node("../Node2D/Icon")
	var dados = [get_node("../Node2D/Dado1"), get_node("../Node2D/Dado2"), get_node("../Node2D/Dado3")]
	for dado in dados:
		if icon.position == dado.position:
			if Input.is_action_just_pressed("acao"):
				play("rolls") #por 0.2 segundo
			else:
				play("static")
				frame = dado.frame
		else:
			play("not_here")
#	for dado in dados:
#		if icon == dado:
			
