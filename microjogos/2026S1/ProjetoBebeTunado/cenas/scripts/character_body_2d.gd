extends CharacterBody2D


const SPEED = 2000.0

@onready var animacao = $"../AnimatedSprite2D"

func _physics_process(_delta):
	var direcao = Input.get_vector("esquerda", "direita", "cima", "baixo")
	
	velocity = direcao * SPEED

	if direcao.x > 0 :
		animacao.play("direita")
	elif direcao.x < 0:
		animacao.play("esquerda")
	elif direcao.y > 0:
		animacao.play("baixo")
	elif direcao.y < 0:
		animacao.play("cima")


	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == self:
		Minigames.register_win(self)
	pass # Replace with function body.
