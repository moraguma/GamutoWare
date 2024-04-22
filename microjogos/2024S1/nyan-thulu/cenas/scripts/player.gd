extends Area2D

@onready var bullet_scene = preload("res://microjogos/2024S1/nyan-thulu/cenas/bullet.tscn")

signal dead
var is_dead = false
var read_to_shoot = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_dead:
		return
	var velocity_bullet = Vector2(0,0);
	if Input.is_action_just_pressed("direita"):
		velocity_bullet =  Vector2(1, 0) * 900
	elif Input.is_action_just_pressed("cima"):
		velocity_bullet = Vector2(0, -1) * 900
	elif Input.is_action_just_pressed("esquerda"):
		velocity_bullet = Vector2(-1, 0) * 900
	elif Input.is_action_just_pressed("baixo"):
		velocity_bullet = Vector2(0, 1) * 900

	if velocity_bullet.length() != 0 and read_to_shoot:
		var bullet =  bullet_scene.instantiate()
		bullet.linear_velocity = velocity_bullet
		bullet.set_rotation( bullet.linear_velocity.angle())
		add_child(bullet)
		read_to_shoot = false
		$Timer.start()

func _on_timer_timeout():
	read_to_shoot = true


func _on_body_entered(body):
	if body == get_parent().get_node("Enemy"):
		is_dead = true
		dead.emit()
