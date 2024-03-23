extends CharacterBody2D

@export var speed = 400
@export var rotation_speed = 30

var rotation_direction = 0

func get_input():
	rotation_direction = Input.get_axis("ui_left", "ui_right")
	velocity = transform.y * Input.get_axis("ui_down", "ui_up") * speed

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
