extends Node2D

var perdeu = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func spawn_creeper():
	var cena = load("res://microjogos/2023S1/projeto_leonardo_valente/cenas/creeper.tscn")
	var objeto = cena.instantiate()
	add_child(objeto)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	for i in get_children():
		i.target = $"../Player".position
	


func _timeout_explosao():
	for i in get_children():
		i.explode()
	if(perdeu):
		$"../Player".morrer()
		$"..".register_lose()
		#print("morreu")
	else:
		$"..".register_win()
		
		#print("viveu")

	
func dar_ignite():
	for i in get_children():
		i.ignite()
