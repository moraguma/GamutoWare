extends RigidBody2D


# Called when the node enters the scene tree for the first time.
@export var progressebar: ProgressBar
var input_rotacao: float = 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	input_rotacao = Input.get_axis("esquerda", "direita")
	angular_velocity = -input_rotacao * 2.0 
	if Input.is_action_just_released("acao"):
		apply_impulse(Vector2.RIGHT.rotated(rotation) * progressebar.value * 15)


func _on_body_entered(body: Node) -> void:
	apply_impulse(Vector2.LEFT.rotated(rotation) * progressebar.value * 10)
	collision_layer = 0
	$Sombra.visible = true
	$AudioStreamPlayer.play()
