extends Sprite


const LERP_WEIGHT = 0.1

const SHAKE = 0.5

const MAX_OFFSET = Vector2(80, 45)
const MAX_ROLL = 0.15
const TRAUMA_POWER = 2

var EFFECTIVE_LERP_WEIGHT

export var trauma = 0.0

var aim_rot = 0
var base_rotation = 0

onready var noise = OpenSimplexNoise.new()
var noise_y = 0


func _ready():
	randomize()
	noise.seed = randi()
	noise.period = 4
	noise.octaves = 2


func _process(delta):
	if trauma:
		trauma = max(trauma, 0)
		shake()


func shake():
	# Implementação de tremida de camera baseada em 
	# https://kidscancode.org/godot_recipes/2d/screen_shake/
	
	var amount = pow(trauma, TRAUMA_POWER)
	
	noise_y += 1
	
	offset[0] = MAX_OFFSET[0] * amount * noise.get_noise_2d(noise.seed * 2, noise_y)
	offset[1] = MAX_OFFSET[1] * amount * noise.get_noise_2d(noise.seed * 3, noise_y)


func set_trauma(x):
	trauma = x
