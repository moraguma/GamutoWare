extends Camera2D

signal transition_time

# ------------------------------------------------------------------------------
# CONSTANTES
# ------------------------------------------------------------------------------
const LERP_WEIGHT = 0.1

const SHAKE = 0.5

const DECAY = 0.8
const MAX_OFFSET = Vector2(160, 90)
const MAX_ROLL = 0.15
const TRAUMA_POWER = 2


# ------------------------------------------------------------------------------
# VARIÁVEIS
# ------------------------------------------------------------------------------
var EFFECTIVE_LERP_WEIGHT

var trauma = 0.0

var aim_rot = 0
var base_rotation = 0

@onready var noise = FastNoiseLite.new()
var noise_y = 0

@onready var animation_player = $AnimationPlayer

func _ready():
	randomize()
	noise.seed = randi()
	noise.frequency = 0.25


func _process(delta):
	if trauma:
		trauma = max(trauma - DECAY * delta, 0)
		shake()
	else:
		rotation = base_rotation


func add_trauma(amount = SHAKE):
	trauma = amount


func shake():
	# Implementação de tremida de camera baseada em 
	# https://kidscancode.org/godot_recipes/2d/screen_shake/
	
	var amount = pow(trauma, TRAUMA_POWER)
	
	rotation = base_rotation + MAX_ROLL * amount * noise.get_noise_1d(noise_y)
	offset[0] = MAX_OFFSET[0] * amount * noise.get_noise_1d(noise_y)
	offset[1] = MAX_OFFSET[1] * amount * noise.get_noise_1d(noise_y + 9999)
	
	noise_y += 1


func animate_transition():
	animation_player.stop()
	animation_player.play("transition")
