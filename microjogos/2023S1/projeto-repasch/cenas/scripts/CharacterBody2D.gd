extends CharacterBody2D

var comi = 0
const SPEED = 500.0
var is_dashing = false
func _ready() -> void:
	$Sprite2D.frame = randi_range(0, 9)

func _physics_process(delta):
	var dir = Vector2(Input.get_action_strength("direita") - Input.get_action_strength("esquerda"), 0)
	$Sprite2D.flip_h = dir.x >= 0.0
	if Input.is_action_just_pressed("acao") and not is_dashing:
		is_dashing = true
		$Dash.start(0.1)
	velocity = dir * SPEED * (1 if not is_dashing else 5)
	move_and_slide()
	
func soma_comida():
	comi += 1
	match comi:
		1: $Dishes/Dish1.visible = true
		2: $Dishes/Dish2.visible = true
		3: 
			$Dishes/Dish3.visible = true
			get_parent().register_win()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("food"):
		soma_comida()
		body.queue_free()
		$Eat.play()


func _on_dash_timeout() -> void:
	is_dashing = false
