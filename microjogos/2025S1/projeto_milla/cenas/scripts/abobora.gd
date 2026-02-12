extends CharacterBody2D

@export_enum("baixo", "cima", "direita", "esquerda") var direcao : int
@export var enable = false
var dir_dict = {0:"baixo", 1:"cima", 2:"direita", 3:"esquerda"}
func _ready() -> void:
	$Sprite2D.frame = direcao

func _physics_process(delta: float) -> void:
	velocity.y += get_gravity().y * delta
	modulate = Color.from_hsv(0, clamp(position.y/1080, 0, 1), 1, 1)
	move_and_slide()
	
	
func _input(event: InputEvent) -> void:
	if enable and event.is_pressed():
		if Input.is_action_just_pressed(dir_dict[direcao]):
			queue_free()
		else:
			get_parent().register_error()
			$AnimationPlayer.play("errou")
