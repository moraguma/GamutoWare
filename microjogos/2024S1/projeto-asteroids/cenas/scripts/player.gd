extends Area2D

@export var Bullet : PackedScene
#preload("res://microjogos/2024S1/projeto-asteroids/cenas/bullet.tscn")
@export var speed = 400
@export var rotation_speed = 4

signal dead

var is_alive = true

var rotation_dir = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	is_alive = true
	$AnimatedSprite2D.visible = false
	var a = get_node("Muzzle")
	a.position = position
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_alive == true:
		if Input.is_action_pressed("ui_right"):
			rotation_dir = 1
		elif Input.is_action_pressed("ui_left"):
			rotation_dir = -1
		else:
			rotation_dir = 0
		
		if Input.is_action_just_pressed("acao"):
			shoot()
			$AudioStreamPlayer2D.play()
			
		rotation += rotation_dir*rotation_speed*delta
	pass
	
func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.position = $Muzzle.position
	b.rotation = $Muzzle.global_rotation
	pass


func _on_player_died():
	if is_alive == true:
		is_alive = false
		$AnimatedSprite2D.visible = true
		$AudioStreamPlayer2D2.play()
	pass # Replace with function body.
	
#func transfer_data():
	#Main.is_alive = is_alive
	#pass


func _on_animated_sprite_2d_animation_finished():
	
	$AnimatedSprite2D.visible = false
	pass # Replace with function body.
