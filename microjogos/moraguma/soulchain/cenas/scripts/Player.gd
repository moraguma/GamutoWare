extends CharacterBody2D


const AIR_INTERVAL = 30
const COLLECTION_DISTANCE = 16
const MOVE_SPEED = 100
const ACCELERATION = 0.1
const DEATH_IMPULSE = 200
const GRAVITY = Vector2(0, 400)
const FREE_GRAVITY = Vector2(0, 400)
const DAMPENING = 0.1
const ELASTIC_CONSTANT = 100


var base_lenght = 0
var has_soul = true
var is_hanging = false
var hanger = null
var alive = true
var was_on_floor = false

@onready var animation_player = $AnimationPlayer
@onready var jump_sound = $JumpSound

func _physics_process(delta):
	if is_hanging:
		if Input.is_action_just_pressed("acao"):
			jump_sound.play()
			
			hanger.release()
			is_hanging = false
	elif hanger:
		if position.distance_to(hanger.position) < COLLECTION_DISTANCE:
			has_soul = true
			
			hanger.queue_free()
			hanger = null
	
	if alive:
		if is_hanging:
			velocity += GRAVITY * delta
			var distance = (position - hanger.position).distance_to(Vector2(0, 0))
			if distance > base_lenght:
				velocity += (hanger.position - position).normalized() * (distance - base_lenght) * ELASTIC_CONSTANT
			#velocity += (GRAVITY - GRAVITY.project(hanger.position - position)) * delta
		else:
			velocity += FREE_GRAVITY * delta
			if is_on_floor():
				velocity.x = lerpf(velocity[0], MOVE_SPEED, ACCELERATION)
		set_velocity(velocity)
		set_up_direction(Vector2(0, -1))
		move_and_slide()
		velocity = velocity
		
		animation_process()
		
		for i in get_slide_collision_count():
			var col = get_slide_collision(i)
			if col.get_collider() is TileMap:
				if col.get_collider().tile_set.get_physics_layer_collision_layer(0) == 2:
					velocity = col.get_normal() * DEATH_IMPULSE
					alive = false
					animation_player.play("death")
		
	else:
		velocity = velocity.lerp(Vector2(0, 0), DAMPENING)
		position += velocity * delta


func animation_process():
	if is_on_floor():
		if not was_on_floor:
			animation_player.play_anim(get_anim_name("land"))
		else:
			animation_player.play_anim(get_anim_name("walk"))
	else:
		if abs(velocity[1]) < AIR_INTERVAL:
			animation_player.play_anim(get_anim_name("air"))
		elif velocity[1] < 0:
			animation_player.play_anim(get_anim_name("jump"))
		else:
			animation_player.play_anim(get_anim_name("fall"))
	
	was_on_floor = is_on_floor()


func get_anim_name(name):
	if not has_soul: 
		return "void_" + name
	return name


func set_hanger(new_hanger):
	is_hanging = true
	hanger = new_hanger
	hanger.player = self
	
	base_lenght = (position - hanger.position).distance_to(Vector2(0, 0))
