extends CharacterBody2D

@onready var parent = get_parent()
@onready var caverna = get_node("../Caverna")

var alive = true
var won = false

const BG_VEL = 1000
const VEL = 500
const ACCEL = 10

func _on_ready():
	position = Vector2(0, 0)
	velocity = Vector2(0, 0)

func _physics_process(delta):
	if(not alive):
		return
	if(won):
		velocity.x = BG_VEL
		var target_vel = clamp((caverna.get_path_y(position.x)-position.y)/delta,
							-VEL, VEL)
		velocity.y = target_vel + (velocity.y-target_vel)*exp(-10*delta)
		
		rotation = atan2(velocity.y, velocity.x)

		position += velocity*delta
	else:
		var target_vel = get_input_dir()
		velocity = target_vel+(velocity-target_vel)*exp(-ACCEL*delta)
		
		var boost_factor = velocity.x/BG_VEL-1
		rotation = atan2(velocity.y, velocity.x)
		var collided = move_and_collide(velocity*delta)
		if(collided):
			parent.register_lose()
			alive = false
			get_node("Sprite2D").visible = false
			get_node("Trail").emitting = false
			get_node("Explosion").emitting = true
			get_node("ExplosionSFX").play()
			
func get_input_dir():
	var dir = Vector2(BG_VEL, 0)
	if Input.is_action_pressed("cima"):
		dir += Vector2(0, -VEL)
	if Input.is_action_pressed("direita") or Input.is_action_pressed("acao"):
		dir += Vector2(VEL, 0)
	if Input.is_action_pressed("baixo"):
		dir += Vector2(0, VEL)
	if Input.is_action_pressed("esquerda"):
		dir += Vector2(-VEL, 0)
	return dir
