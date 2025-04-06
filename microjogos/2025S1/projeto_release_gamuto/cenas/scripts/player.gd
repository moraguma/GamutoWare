extends CharacterBody2D

var speed = 10
var angular_speed = PI
var up_counter = 0

const WIDTH = 1920
const HEIGHT = 1080
var collision_timer := Timer.new()

var status = "OK"



func _ready() -> void:	
	collision_timer.wait_time = 0.1
	add_child(collision_timer)
	collision_timer.connect("timeout", _on_timer_timeout)
	

func _on_timer_timeout() -> void:
	status = "OK"
	get_node("Sprite2D").frame = 0

func _process(delta):	
	var direction = 0
	if Input.is_action_pressed("baixo") and status == "OK":
		velocity = Vector2.ZERO
		up_counter = 0
	if Input.is_action_pressed("esquerda") and status == "OK":
		direction = -1
		up_counter = max(1,up_counter-1)
	if Input.is_action_pressed("direita") and status == "OK":
		direction = 1
		up_counter = max(1,up_counter-1)

	rotation += angular_speed * direction * delta

	if Input.is_action_pressed("cima") and status == "OK":
		up_counter += 1
		velocity = Vector2.UP.rotated(rotation) * speed * up_counter
	
	var pos_x = self.position.x
	var pos_y = self.position.y
	if pos_x >= WIDTH or pos_x <= 0 or pos_y >= HEIGHT or pos_y <= 0:
		print("VELOCITY", velocity, "POS", pos_x, pos_y, "ROTATION", rotation)
		status = "BLOCKED"
		velocity = velocity.bounce(Vector2(pos_y, pos_x))
		collision_timer.start()
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		if status == "BLOCKED":
			get_node("Sprite2D").frame = 2
		else:
			get_node("Sprite2D").frame = 1
		velocity = velocity.bounce(collision.get_normal())
		status = "BLOCKED"
		collision_timer.start()
