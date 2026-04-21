extends RigidBody2D


@onready var pivot = get_node("Pivot")
@onready var posicao= get_node("Node2D/Sprite2D3/AnimationPlayer")



var alpha = 0
var forca = 0
const velocidade = 2000
var shooting = false

func _physics_process(delta):
	
	if Input.is_action_just_pressed("acao"):
		print("shooting")
		if shooting:
			var fator = posicao.current_animation_position
			if fator > 1:
				fator = 2 - fator
			linear_velocity = Vector2(0,-1).rotated(pivot.rotation) * velocidade * fator
			$Node2D.queue_free()
			pivot.queue_free()
		else:
			shooting = true
			$Node2D.show()
			posicao.play("new_animation_3")
			pivot.angular_velocity = 0
		
