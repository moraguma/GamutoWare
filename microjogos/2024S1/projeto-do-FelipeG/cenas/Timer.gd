extends Timer
@onready var sorvetes = [$"../sorveterosa",$"../sorvetemarrom",$"../sorveteverde",$"../sorvetevermelho",$"../sorveteamarelo",$"../sorveteazul",$"../Gamuto"]


# Called wheme.n the node enters the scene tree for the first ti
func _ready():
	
	sorvetes.shuffle()
	start(1)
	
	
	
# Called every ftimerrame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timeout():
	if sorvetes.size():
		
		var cair = sorvetes.pop_front()
		cair.velocity.y = 250
	
	

