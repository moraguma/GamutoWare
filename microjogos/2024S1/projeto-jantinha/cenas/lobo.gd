extends CharacterBody2D
var velocidademax = 500.00
var aceleracao = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physic_process(delta):
	var direcao = Input.get_vector("direita", "esquerda", "cima", "baixo")
	var correr = Input.is_action_pressed("acao")
	if correr:
		velocity = direcao* (aceleracao*delta)
		if velocity == velocidademax:
			velocity = direcao * velocidademax





func _on_sensacao_body_entered(body):
	pass # Replace with function body.
