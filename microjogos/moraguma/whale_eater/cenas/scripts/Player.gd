extends CharacterBody2D


const GRAVITY = 0.08
const TERMINAL_SPEED = 200
const MIN_RUN_SPEED = 20
const MIN_SPIN_SPEED = 160


var gravity_dir = Vector2(0, 1)
var was_on_floor = true
var active = true


@onready var sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer
@onready var land_sound = $LandSound
@onready var camera = get_parent().get_node("Camera")


func _physics_process(delta):
	movement_process()
	animation_process()


func movement_process():
	velocity = lerp(velocity, gravity_dir * TERMINAL_SPEED, GRAVITY)
	var t = velocity
	set_up_direction(-gravity_dir)
	move_and_slide()


func animation_process():
	orientation_process()
	
	var is_on_floor = is_on_floor() or is_on_wall()
	
	if is_on_floor:
		if not was_on_floor:
			camera.add_trauma(0.3)
			animation_player.play_anim("land")
			land_sound.play()
		elif velocity.distance_to(Vector2(0, 0)) > MIN_RUN_SPEED:
			animation_player.play_anim("walk")
		else:
			animation_player.play_anim("idle")
	else:
		if velocity.distance_to(Vector2(0, 0)) > MIN_SPIN_SPEED:
			animation_player.play_anim("spin")
		else:
			animation_player.play_anim("float")
	
	was_on_floor = is_on_floor


func orientation_process():
	if gravity_dir.dot(Vector2(0, -1)) > sqrt(2)/2:
		sprite.rotation = PI
	elif gravity_dir.dot(Vector2(1, 0)) > sqrt(2)/2:
		sprite.rotation = 3 * PI / 2
	elif gravity_dir.dot(Vector2(0, 1)) > sqrt(2)/2:
		sprite.rotation = 0
	else:
		sprite.rotation = PI / 2
	
	if gravity_dir.angle_to(velocity) > 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false


func set_gravity(v):
	gravity_dir = v
