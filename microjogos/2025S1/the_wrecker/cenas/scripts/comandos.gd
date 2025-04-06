extends Label

var comandos = [1,2]

var lista_verdadeira = []

func _ready() -> void:
	for i in range(8):
		lista_verdadeira.append(comandos.pick_random())
	
	get_parent().get_parent().get_parent().get_node("Player").lista_true = lista_verdadeira
	

func _get_number():
	var random_number = comandos[randi() % comandos.size()]
	return random_number
		
