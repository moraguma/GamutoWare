extends Node2D

const x_inicial = 645
const y_inicial = 300
const movimento = 127

var positions = []

func _ready():
	var children = get_children()
	for child in children:
		var sobreposto = true
		while sobreposto:
			child.position.x = x_inicial + movimento * ( randi()%6 )
			child.position.y = y_inicial + movimento * ( randi()%6 )
			if Vector2(child.position.x, child.position.y) not in positions:
				sobreposto = false
		positions.append(Vector2(child.position.x, child.position.y))


#arrumar os dados
#fazer código de randomização das posições
#fazer código de randomização dos números dos dados
#fazer código de aniimação dos dados
#adicionar sons
#arrumar imagens
