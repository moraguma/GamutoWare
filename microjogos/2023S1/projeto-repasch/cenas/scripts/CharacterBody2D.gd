extends CharacterBody2D

var comi = 0
var speed = 500.0
func _ready() -> void:
	$Sprite2D.frame = randi_range(0, 9)

func _physics_process(delta):
	var dir = Vector2(Input.get_action_strength("direita") - Input.get_action_strength("esquerda"), 0)
	if Input.is_action_just_pressed("acao"):
		speed = 2000
		$Timer.start(0.1)
	$Sprite2D.flip_h = dir.x >= 0.0
	velocity = dir * speed
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


func _on_timer_timeout() -> void:
	speed = 500
