extends Camera2D
@export var randomStrength: float = 7.0
@export var shakeFade: float = 5.0

var rng = RandomNumberGenerator.new()
var shakeStrength: float = 0.0

@onready var gam = $"/root/Sala-principal/gamuto"

func apply_shake():
	shakeStrength = randomStrength
	
func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shakeStrength, shakeStrength), rng.randf_range(-shakeStrength, shakeStrength))

func _process(delta):
	if(Input.is_action_just_pressed("direita") or Input.is_action_just_pressed("esquerda") or Input.is_action_just_pressed("cima")):
		apply_shake()
	if shakeStrength > 0:
		shakeStrength = lerpf(shakeStrength,0,shakeFade * delta)
		
		offset = randomOffset()

	
	
	
