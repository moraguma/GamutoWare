extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	play("default")
	play ("lofi-study-112191.mp3")
var esta_em_cima = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Input.is_action_just_pressed("cima"):
		if not esta_em_cima:
			get_node ("carro_principal").position.y= -390
			esta_em_cima= true
	if Input.is_action_just_pressed("baixo"): 
		if  esta_em_cima:
			get_node ("carro_principal").position.y= -333
			esta_em_cima= false

