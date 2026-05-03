extends CharacterBody2D

@export var speed : float
#var velocity = Vector2()  # Vetor de velocidade
var poder_petar : bool = false
# Função _ready, que é chamada quando o node é inicializado
func _ready():
	pass

func _process(delta):
	velocity = Vector2.ZERO  # Inicializa a velocidade
	if Input.get_axis("esquerda", "direita") < 0:  # Movimento para a esquerda
		velocity.x = -speed
	elif Input.get_axis("esquerda", "direita") > 0:  # Movimento para a direita
		velocity.x = speed
	if Input.get_axis("cima", "baixo") < 0:  # Movimento para cima
		velocity.y = -speed
	elif Input.get_axis("cima", "baixo") > 0:  # Movimento para baixo
		velocity.y = speed
		
	if poder_petar and Input.is_action_just_pressed("acao"):
		emit_signal("win")
		get_parent().register_win()
		print("foi uma metida satisfatória")
		
	move_and_slide()

func _on_gamuto_body_entered(body: Node2D) -> void:
		poder_petar = true
		print("meteu dentro")

func _on_gamuto_body_exited(body: Node2D) -> void:
	poder_petar = false
	print("desmeteu")
