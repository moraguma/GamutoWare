extends CharacterBody2D

@export var collision_timer : Timer
@export var sprite : Sprite2D

@export var speed = 10
@export var angular_speed = PI
@export var up_counter = 0

var life := 30

var status = "OK"


func _on_timer_timeout() -> void:
	status = "OK"
	sprite.frame = 0

func _process(delta):
	var direction = 0
	if status == "OK":
		if Input.is_action_pressed("baixo"):
			velocity *= 0.9
		direction = Input.get_axis("esquerda", "direita")
		if Input.is_action_pressed("cima") or Input.is_action_pressed("acao"):
			up_counter = min(60, up_counter+1)
			velocity = Vector2.UP.rotated(rotation) * speed * up_counter
	rotation += angular_speed * direction * delta

	var collision = move_and_collide(velocity * delta)
	if collision:
		if status == "BLOCKED":
			sprite.frame = 2
		else:
			sprite.frame = 1
		velocity = velocity.bounce(collision.get_normal()) * 0.5
		if status == "OK": 
			life -= 3
		if life <= 0:
			queue_free()
		status = "BLOCKED"
		collision_timer.start()
