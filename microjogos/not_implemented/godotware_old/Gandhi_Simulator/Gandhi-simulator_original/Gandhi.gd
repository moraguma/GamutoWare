extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_fixed_process(true)
	pass
func _fixed_process(delta):
	if Input.is_key_pressed(KEY_UP) and not Input.is_key_pressed(KEY_LEFT) and not Input.is_key_pressed(KEY_RIGHT):
		move(Vector2(0,-5))
	if Input.is_key_pressed(KEY_DOWN) and not Input.is_key_pressed(KEY_LEFT) and not Input.is_key_pressed(KEY_RIGHT):
		move(Vector2(0,5))
	if Input.is_key_pressed(KEY_RIGHT) and not Input.is_key_pressed(KEY_UP) and not Input.is_key_pressed(KEY_DOWN):
		move(Vector2(5,0))
	if Input.is_key_pressed(KEY_LEFT) and not Input.is_key_pressed(KEY_UP) and not Input.is_key_pressed(KEY_DOWN):
		move(Vector2(-5,0))
	if Input.is_key_pressed(KEY_UP) and Input.is_key_pressed(KEY_LEFT):
		move(Vector2(-3.53,-3.53))
	if Input.is_key_pressed(KEY_UP) and Input.is_key_pressed(KEY_RIGHT):
		move(Vector2(3.53,-3.53))
	if Input.is_key_pressed(KEY_DOWN) and Input.is_key_pressed(KEY_LEFT):
		move(Vector2(-3.53,3.53))
	if Input.is_key_pressed(KEY_DOWN) and Input.is_key_pressed(KEY_RIGHT):
		move(Vector2(3.53,3.53))
	pass